# SAS Correlation Heatmap for Cancer Alley Thesis Analysis

This repository contains SAS code to generate a professional, annotated correlation heatmap from environmental and health data analyzed in my M.S. thesis at Tulane University School of Public Health and Tropical Medicine.

The thesis, titled "Cancer Alley: Industrial Emissions and Cancer Incidence in Louisiana," examines census tract-level associations between toxic releases from industrial facilities (using EPA Toxic Release Inventory data) and cancer incidence (Louisiana Tumor Registry), while adjusting for socioeconomic and behavioral risk factors.

## Project Overview

This heatmap visualizes pairwise Pearson correlations among key variables, including:
- Industrial exposure proxies (CDens, RDens, NearF_D, NearR_D, SF_D)
- Socioeconomic factors (GINI, Poverty, MedIncome)
- Demographic factors (Black)
- Behavioral risk factors (Smoking, Binge, Obesity, CheckUps)

The visualization is designed for clarity in reports and publications, with centered numeric labels, a clean color gradient, and minimal axis clutter.

## Files

- `correlation_heatmap.sas` – Complete, reproducible SAS code
  - Imports CSV data
  - Computes correlations using PROC CORR
  - Reshapes output for plotting
  - Generates annotated heatmap with SGPLOT (HEATMAPParm statement)
  - Exports to PDF
- `CORRELATION_HEATMAP.pdf` – Example output from the code (generated December 2025)

## Requirements

- SAS 9.4 or later
- Input CSV file with the variables listed in the macro variable `corr_vars`

Note: The actual thesis dataset contains sensitive health information and is not included. An example dataset 
![AllCanc_0303.csv](AllCanc_0303.csv) is included.

## Code Highlights

- Use of macro variable to define variable list once (avoids repetition and errors)
- Efficient reshaping of PROC CORR output using arrays
- Modern SGPLOT features: HEATMAPParm, overlaid TEXT for value labels, custom color model
- Journal-style PDF output suitable for theses and manuscripts

## Output Example

![Correlation Heatmap](CORRELATION_HEATMAP.pdf)

## Contact

Wendy Bogil  
New Orleans, LA  
wendybogil@gmail.com  
[LinkedIn](https://www.linkedin.com/in/wendybogil)

