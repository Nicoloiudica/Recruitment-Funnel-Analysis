# Recruitment Funnel & Time-to-Hire Optimization  
(SQL • Python • Excel • Tableau)

End-to-end data analysis project on a **synthetic Applicant Tracking System (ATS) dataset**, designed to replicate real-world recruiting processes (Greenhouse / Lever–style schemas).

The project demonstrates how **SQL, Python, Excel and Tableau** can be used together to analyze recruiting performance and hiring efficiency.

---

## Business Questions
1. Where do candidates drop off in the recruitment funnel?
2. Which sourcing channels generate the highest-quality hires?
3. How long does it take to hire by role?
4. Where are the main bottlenecks in the hiring process?

---

## Dataset
Synthetic ATS data stored in `data/`:
- `candidates.csv`
- `recruitment_stages.csv`
- `offers.csv`

The data is designed to reflect realistic recruiting patterns:
- referrals convert better than job boards
- technical roles take longer to hire
- salary correlates with offer acceptance, but is not the only driver

---

## Tools & How They Are Used

### SQL (`/sql`)
- Funnel conversion and drop-off analysis by stage
- Stage-to-stage transitions
- Time-to-hire calculations

📄 Main file:
- `sql/funnel_analysis.sql`

---

### Python (`/python`)
- Data cleaning and feature engineering
- KPI computation (hire rate, time-to-hire, source performance)
- Exploratory analysis to support dashboard insights

📓 Notebook:
- `python/recruitment_analysis.ipynb`

---

### Excel (`/excel`)
- KPI summary tables
- Stakeholder-ready metrics for reporting
- Validation of key calculations

📊 File:
- `excel/Recruitment_KPI.xlsx`

---

### Tableau (Visualization Layer)
Interactive dashboard combining all insights:
- Recruitment funnel by stage
- Average time-to-hire by role
- Source quality (volume vs hire rate)

👉 **Live Dashboard (Tableau Public):**  
https://public.tableau.com/app/profile/nicolo.iudica/viz/RecruitmentFunnelHiringEfficiencyDashboard/RecruitmentFunnelDashboard

---

## Key Insights & Recommendations

- **Referrals show the highest hire rate** despite lower volume.  
  *Recommendation:* invest more in referral programs for high-impact roles.

- The main **bottleneck is between Tech Interview and Offer**, driving longer time-to-hire and drop-off.  
  *Recommendation:* improve interviewer availability and feedback SLAs.

- **Time-to-hire varies significantly by role**, especially for technical positions.  
  *Recommendation:* tailor recruitment processes by role instead of using a single pipeline.

- **Offer acceptance correlates with salary**, but compensation alone does not explain outcomes.  
  *Recommendation:* improve candidate experience and expectation alignment earlier.

---

## Recruitment Funnel Structure
Applied → HR Interview → Tech Interview → Offer → Hired  
(or Rejected)

---

## Notes
This project is fully synthetic and intended for **portfolio and analytical demonstration purposes only**.
