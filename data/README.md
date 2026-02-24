# Data

This folder contains raw and processed datasets used in the analysis.

Raw data is not included due to confidentiality.

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

WID Dashboard
<img width="2560" height="1440" alt="24-02-2026 14-04-15" src="https://github.com/user-attachments/assets/cad8f31a-f899-4c91-af80-d1e454256cc9" />

