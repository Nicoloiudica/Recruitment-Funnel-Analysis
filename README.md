# Recruitment Funnel & Time-to-Hire Optimization (SQL + Python + Excel + Tableau)

This project analyzes a **synthetic ATS dataset** (inspired by Greenhouse / Lever style schemas) to:
- measure **funnel conversion** and **drop-off** per stage
- compute **time-to-hire** and identify **bottlenecks**
- evaluate **source effectiveness** (volume vs hire rate)
- analyze **offer acceptance** and the relationship with salary

## Business questions
1. Where do candidates drop off in the recruiting funnel?
2. Which sources produce the highest-quality hires?
3. What is the average/median time-to-hire by role?
4. Which transitions (stage → stage) are the slowest?

## Dataset
Files in `data/`:
- `candidates.csv`
- `recruitment_stages.csv`
- `offers.csv`

Stages:
**Applied → HR Interview → Tech Interview → Offer → Hired** (or **Rejected**)

## Deliverables
- `sql/funnel_analysis.sql`
- `python/recruitment_analysis.ipynb`
- `excel/Recruitment_KPI.xlsx`

## Tableau dashboard (wireframe)
Build 1 dashboard with 4 sections:
1. **Funnel**: counts per stage + conversion rate
2. **Time-to-hire**: avg/median by role + distribution
3. **Source quality matrix**: candidates (x) vs hire rate (y) — size = hires
4. **Offers**: acceptance rate by role + salary distribution (accepted vs not)

Filters:
- Role, Location, Source, Application month

## Notes on synthetic data
The dataset is generated to resemble real patterns:
- referrals tend to convert better
- roles vary in difficulty and time-to-hire
- acceptance correlates moderately with salary