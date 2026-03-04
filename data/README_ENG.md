# Data

This project is a real product analysis task.

For privacy reasons, the original datasets are not included.

SQL queries are written based on a simulated warehouse schema.

## Implementation Notes

**Original implementation:** Excel + Yandex DataLens  
**Extended analytical layer:** SQL-based warehouse simulation

## Key Findings (Simulated Results)

Based on the simulated funnel analysis:

- Visit → Registration conversion: ~42%
- Registration → Activity conversion: ~65%
- Activity → Subscription conversion: ~18%

Key bottleneck identified:
The largest drop occurs at the Activity → Subscription stage, 
indicating potential issues with value perception or pricing.

Business hypothesis:
Improving onboarding communication or introducing a limited free trial 
could increase subscription conversion.

Additional metric: Day 1 retention ~ 32%

## Dashboard Preview

The funnel and retention metrics were visualized in Yandex DataLens.

WID Dashboard:

<img width="2560" height="1440" alt="24-02-2026 14-05-54" src="https://github.com/user-attachments/assets/86340fdc-70f4-440c-bc37-8ef9065d9757" />

Ссылка на Дашборд: https://datalens.yandex/xsbara0fp4kyh

# Included Reports

- Funnel Performance Dashboard  
  Conversion rates across Visit → Registration → Activity → Subscription

- Retention Cohort Analysis  
  Retention 7 / Retention 30 trends by user cohort

- Acquisition Channel Comparison  
  Performance analysis across Google Ads, TikTok, Instagram

- Monetization A/B Test Results  
  Statistical validation of pricing hypothesis

## A/B Test: Monetization Scenario

Original implementation: Excel (Z-test for proportions)

SQL layer added for portfolio demonstration:
- Group aggregation
- Conversion rate calculation
- ARPU calculation
