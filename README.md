# similarities

Comparison of similarity measures on different datasets

## Datasets

1. APS
2. SO
3. WoS
4. Patent
5. Zeit

## Measures

1. CN: consecutive words
2. KK: connections
3. TD: time-diagram
4. OC: word co-occurrence

## Processing steps

1. Calculating the measure word by word (cn.pl, kk.pl, aps-cn.txt, ...)
2. Words-list.pl
3. Calculating the percentage (cn-kk-perc.pl)
4. Unify the measures, insert zeros (cn-kk-perc-unify.pl)

(Ezeket még el kell nevezni shorthanddel, mint fent, és akkor jobb lesz a rendszerezhetőség.)
