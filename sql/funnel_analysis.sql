-- Recruitment Funnel & Time-to-Hire Optimization
-- SQL script (PostgreSQL-ish / SQLite-friendly with small edits)

-- 1) Funnel counts per stage
SELECT
  stage,
  COUNT(DISTINCT candidate_id) AS candidates
FROM recruitment_stages
GROUP BY stage
ORDER BY candidates DESC;

-- 2) Hires by source + hire rate
SELECT
  c.source,
  COUNT(DISTINCT c.candidate_id) AS total_candidates,
  COUNT(DISTINCT CASE WHEN r.stage = 'Hired' THEN c.candidate_id END) AS hires,
  ROUND(
    COUNT(DISTINCT CASE WHEN r.stage = 'Hired' THEN c.candidate_id END) * 100.0 /
    COUNT(DISTINCT c.candidate_id),
    2
  ) AS hire_rate_pct
FROM candidates c
JOIN recruitment_stages r
  ON c.candidate_id = r.candidate_id
GROUP BY c.source
ORDER BY hire_rate_pct DESC;

-- 3) Time-to-hire (days) by role (Applied -> Hired)
-- SQLite version uses julianday(); for Postgres replace with DATE_PART('day', hired_date - applied_date)
WITH applied AS (
  SELECT candidate_id, MIN(date(stage_date)) AS applied_date
  FROM recruitment_stages
  WHERE stage = 'Applied'
  GROUP BY candidate_id
),
hired AS (
  SELECT candidate_id, MIN(date(stage_date)) AS hired_date
  FROM recruitment_stages
  WHERE stage = 'Hired'
  GROUP BY candidate_id
),
tth AS (
  SELECT
    c.role,
    a.candidate_id,
    (julianday(h.hired_date) - julianday(a.applied_date)) AS time_to_hire_days
  FROM applied a
  JOIN hired h ON a.candidate_id = h.candidate_id
  JOIN candidates c ON c.candidate_id = a.candidate_id
)
SELECT
  role,
  ROUND(AVG(time_to_hire_days), 1) AS avg_time_to_hire_days,
  ROUND(AVG(time_to_hire_days * 1.0), 1) AS avg_time_to_hire_days_copy,
  COUNT(*) AS hires
FROM tth
GROUP BY role
ORDER BY avg_time_to_hire_days DESC;

-- 4) Transition times (stage -> next stage)
WITH ordered AS (
  SELECT
    candidate_id,
    stage,
    date(stage_date) AS stage_date,
    LAG(date(stage_date)) OVER (PARTITION BY candidate_id ORDER BY date(stage_date)) AS prev_date,
    LAG(stage) OVER (PARTITION BY candidate_id ORDER BY date(stage_date)) AS prev_stage
  FROM recruitment_stages
)
SELECT
  prev_stage AS from_stage,
  stage AS to_stage,
  ROUND(AVG(julianday(stage_date) - julianday(prev_date)), 1) AS avg_days_between_stages,
  COUNT(*) AS transitions
FROM ordered
WHERE prev_date IS NOT NULL
GROUP BY from_stage, to_stage
ORDER BY transitions DESC;