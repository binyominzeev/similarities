# Comparison of similarity measures on different datasets

PL and TXT files are following the file naming patterns, consisting of the following three components:

## 1. Processing steps

0. WDC: word count, word toplist of dataset
1. MES: Calculating the measure word by word (cn.pl, kk.pl, aps-cn.txt, ...)
  - _(In the case of 3-TD, this step is distributed into 3 sub-steps:)_
  - 1-NORM: min-max normalization of time-diagrams for every important word
  - 2-BOX: producing 0-9 and 0-1 boxes for every word (in the transformed system)
  - 3-NGB: identifying nearest neighbors based on neighboring boxes
  - _(In every other case, a RAW file is produced using raw numbers as measurement, and)_
  - 1b-POW: power law-matching to raw file, in order to calculate the 0-1 normalization
2. WD: Words-list.pl
3. PR: Calculating the percentage (cn-kk-perc.pl)
4. UN: Unify the measures, insert zeros (cn-kk-perc-unify.pl)
5. EV: Assembling the results table, evaluation of measures

## 2. Datasets

1. APS
2. SO
3. WoS
4. Patent
5. Zeit

## 3. Measures

1. CN: consecutive words
2. KK: connections
3. TD: time-diagram
4. OC: word co-occurrence

## Current status

- 2018-10-11: 1-APS-1-CN, 1-APS-2-KK ready
- 2018-10-12: 1-APS-4-OC ready
- 2018-11-04: 1-APS-3-TD ready
- 2018-11-11: 1-APS comparison/evaluation ready
- 2018-12-18: 1-APS-2-KK 1-MES, 2-WD for all ready
- 2018-12-23: 1-APS, 5-EV ready
- 2018-12-23: 2-SO-1-CN, 2-SO-4-OC ready
- 2018-12-24: 2-SO ready, 5-ZEIT 1-CN, 4-OC, 3-TD as well
- 2018-12-25: 4-Patent, 5-Zeit ready, as well as better, power-law based normalization




