wd <- paste(getwd(), "/data/Data.csv", sep = "")
## Create data folder containing Data.csv in the same level
## of this R Script
data <- read.csv(wd, header = TRUE)

library(dplyr)
library(naniar)
table(data$q32_1) # Decrease in income from JOB LOSS or CLOSURE of Business
# -2   -1    0    1 
#  8    6 1215  757 
table(data$q33a_1) # Sale of ASSETS
#   -7   -5   -2   -1    0    1 
# 1229  166    5   23  555    8
table(data$q33a_2) # Engaged in additional income generating activities
#   -7   -5   -2   -1    0    1 
# 1229  166    5   23  548   15 
table(data$q33a_3) # Received assistance from Friends & family
#   -7   -5   -2   -1    0    1 
# 1229  166    5   23  422  141 
table(data$q33a_4) # Borrowed from friends & family
#   -7   -5   -2   -1    0    1 
# 1229  166    5   23  468   95 
table(data$q33a_5) # Took a loan from a financial institution
#   -7   -5   -2   -1    0    1 
# 1229  166    5   23  495   68 
table(data$q33a_6) # Credited purchases
#   -7   -5   -2   -1    0    1 
# 1229  166    5   23  464   99 
table(data$q33a_7) # Delayed payment obligations
#   -7   -5   -2   -1    0    1 
# 1229  166    5   23  548   15 
table(data$q33a_8) # Sold harvest in advance
#   -7   -5   -2   -1    0    1 
# 1229  166    5   23  555    8 
table(data$q33a_9) # Reduced food consumption
#   -7   -5   -2   -1    0    1 
# 1229  166    5   23  462  101 
table(data$q33a_10) # Reduced non-food Consumption
#   -7   -5   -2   -1    0    1 
# 1229  166    5   23  442  121 
table(data$q33a_11) # Relied on savings
#   -7   -5   -2   -1    0    1 
# 1229  166    5   23  386  177 
table(data$q33a_12) # Received assistance from government
#   -7   -5   -2   -1    0    1 
# 1229  166    5   23  489   74 
table(data$q33a_13) # Took advanced payment from employer
#   -7   -5   -2   -1    0    1 
# 1229  166    5   23  561    2 
table(data$q33a_14) # Was covered by insurance policy
#   -7   -5   -2   -1    0    1 
# 1229  166    5   23  562    1 

############################################################################
table(data$q32_2) # Decrease in income from reduction in WORKING HOURS
# -2   -1    0    1 
# 11   13 1719  243

table(data$q33b_1) # Sale of ASSETS 
#   -7   -5   -2   -1    0    1 
# 1743   88    3    5  146    1
table(data$q33b_2) # Engaged in additional income generating activities
#   -7   -5   -2   -1    0    1 
# 1743   88    3    5  139    8 
table(data$q33b_3) # Received assistance from Friends & family
#   -7   -5   -2   -1    0    1 
# 1743   88    3    5  107   40 
table(data$q33b_4) # Borrowed from friends & family
#   -7   -5   -2   -1    0    1 
# 1743   88    3    5  126   21 
table(data$q33b_5) # Took a loan from a financial institution
#   -7   -5   -2   -1    0    1 
# 1743   88    3    5  134   13 
table(data$q33b_6) # Credited purchases
#   -7   -5   -2   -1    0    1 
# 1743   88    3    5  126   21 
table(data$q33b_7)  # Delayed payment obligations
#   -7   -5   -2   -1    0    1 
# 1743   88    3    5  143    4 
table(data$q33b_8) # Sold harvest in advance
#   -7   -5   -2   -1    0    1 
# 1743   88    3    5  145    2 
table(data$q33b_9) # Reduced food consumption
#   -7   -5   -2   -1    0    1 
# 1743   88    3    5  118   29
table(data$q33b_10) # Reduced non-food Consumption
#   -7   -5   -2   -1    0    1 
# 1743   88    3    5  115   32
table(data$q33b_11) # Relied on savings
#   -7   -5   -2   -1    0    1 
# 1743   88    3    5  104   43
table(data$q33b_12) # Received assistance from government
#   -7   -5   -2   -1    0    1 
# 1743   88    3    5  138    9 
table(data$q33b_13) # Took advanced payment from employer
#   -7   -5   -2   -1    0 
# 1743   88    3    5  147
table(data$q33b_14) # Was covered by insurance policy
#   -7   -5   -2   -1    0 
# 1743   88    3    5  147

############################################################################
table(data$q32_3) # Decrease in income from LOSS OF HARVEST
# -2   -1    0    1 
# 20   12 1849  105 

table(data$q33c_1) # Sale of ASSETS
#   -7   -5   -2   -1    0    1 
# 1881   49    1    2   52    1 
table(data$q33c_2) # Engaged in additional income generating activities
#   -7   -5   -2   -1    0    1 
# 1881   49    1    2   49    4
table(data$q33c_3) # Received assistance from Friends & family
#   -7   -5   -2   -1    0    1 
# 1881   49    1    2   44    9
table(data$q33c_4) # Borrowed from friends & family
#   -7   -5   -2   -1    0    1 
# 1881   49    1    2   44    9 
table(data$q33c_5) # Took a loan from a financial institution
#   -7   -5   -2   -1    0    1 
# 1881   49    1    2   43   10
table(data$q33c_6) # Credited purchases
#   -7   -5   -2   -1    0    1 
# 1881   49    1    2   41   12 
table(data$q33c_7) # Delayed payment obligations
#   -7   -5   -2   -1    0    1 
# 1881   49    1    2   50    3
table(data$q33c_8) # Sold harvest in advance
#   -7   -5   -2   -1    0    1 
# 1881   49    1    2   48    5
table(data$q33c_9) # Reduced food consumption
#   -7   -5   -2   -1    0    1 
# 1881   49    1    2   45    8 
table(data$q33c_10) # Reduced non-food Consumption
#   -7   -5   -2   -1    0    1 
# 1881   49    1    2   44    9
table(data$q33c_11) # Relied on savings
#   -7   -5   -2   -1    0    1 
# 1881   49    1    2   40   13 
table(data$q33c_12) # Received assistance from government
#   -7   -5   -2   -1    0    1 
# 1881   49    1    2   48    5
table(data$q33c_13) # Took advanced payment from employer
#   -7   -5   -2   -1    0 
# 1881   49    1    2   53 
table(data$q33c_14) # Was covered by insurance policy
#   -7   -5   -2   -1    0 
# 1881   49    1    2   53

############################################################################
table(data$q32_4) # Reduction of sales of products that were not from a family or businesses' own agricultural production
# -2   -1    0    1
# 17   23 1832  114

table(data$q33d_1) # Sale of ASSETS
#   -7   -5   -1    0    1 
# 1872   48    2   63    1 
table(data$q33d_2) # Engaged in additional income generating activities
#   -7   -5   -1    0    1 
# 1872   48    2   61    3 
table(data$q33d_3) # Received assistance from Friends & family
#   -7   -5   -1    0    1 
# 1872   48    2   54   10
table(data$q33d_4) # Borrowed from friends & family
#   -7   -5   -1    0    1 
# 1872   48    2   55    9 
table(data$q33d_5) # Took a loan from a financial institution 
#   -7   -5   -1    0    1 
# 1872   48    2   55    9 
table(data$q33d_6) # Credited purchases
#   -7   -5   -1    0    1 
# 1872   48    2   53   11
table(data$q33d_7) # Delayed payment obligations
#   -7   -5   -1    0    1 
# 1872   48    2   61    3 
table(data$q33d_8) # Sold harvest in advance
#   -7   -5   -1    0    1 
# 1872   48    2   62    2 
table(data$q33d_9) # Reduced food consumption
#   -7   -5   -1    0    1 
# 1872   48    2   56    8 
table(data$q33d_10) # Reduced non-food Consumption
#   -7   -5   -1    0    1 
# 1872   48    2   51   13
table(data$q33d_11) # Relied on savings
#   -7   -5   -1    0    1 
# 1872   48    2   40   24 
table(data$q33d_12) # Received assistance from government
#   -7   -5   -1    0    1 
# 1872   48    2   61    3 
table(data$q33d_13) # Took advanced payment from employer
#   -7   -5   -1    0 
# 1872   48    2   64
table(data$q33d_14) # Was covered by insurance policy
#   -7   -5   -1    0    1 
# 1872   48    2   63    1

############################################################################
table(data$q32_5) # Decrease in income from reduction in REMITTANCES
# -2   -1    0    1 
# 29   23 1817  117
table(data$q33e_1) # Sale of ASSETS
#   -7   -5   -1    0    1 
# 1869   47    1   68    1 
table(data$q33e_2) # Engaged in additional income generating activities
#   -7   -5   -1    0    1 
# 1869   47    1   67    2 
table(data$q33e_3) # Received assistance from Friends & family
#   -7   -5   -1    0    1 
# 1869   47    1   55   14 
table(data$q33e_4) # Borrowed from friends & family
#   -7   -5   -1    0    1 
# 1869   47    1   55   14 
table(data$q33e_5)
#   -7   -5   -1    0    1 # Took a loan from a financial institution
# 1869   47    1   60    9 
table(data$q33e_6) # Credited purchases
#   -7   -5   -1    0    1 
# 1869   47    1   55   14 
table(data$q33e_7) # Delayed payment obligations
#   -7   -5   -1    0 
# 1869   47    1   69 
table(data$q33e_8) # Sold harvest in advance
#   -7   -5   -1    0    1 
# 1869   47    1   68    1
table(data$q33e_9) # Reduced food consumption
#   -7   -5   -1    0    1 
# 1869   47    1   57   12 
table(data$q33e_10) # Reduced non-food Consumption
#   -7   -5   -1    0    1 
# 1869   47    1   54   15 
table(data$q33e_11) # Relied on savings
#   -7   -5   -1    0    1 
# 1869   47    1   44   25 
table(data$q33e_12) # Received assistance from government
#   -7   -5   -1    0    1 
# 1869   47    1   68    1
table(data$q33e_13) # Took advanced payment from employer
#   -7   -5   -1    0 
# 1869   47    1   69 
table(data$q33e_14) # Was covered by insurance policy
#   -7   -5   -1    0 
# 1869   47    1   69 
###########################################################################

table(data$q32_6) # ILLNESS, injury, or death of income earning member of household
# -2   -1    0    1 
# 21   30 1771  164 

table(data$q33f_1)
#   -7   -5   -2   -1    0    1 
# 1822   44    1    7  111    1
table(data$q33f_2)
#   -7   -5   -2   -1    0 
# 1822   44    1    7  112 
table(data$q33f_3)
#   -7   -5   -2   -1    0    1 
# 1822   44    1    7   72   40 
table(data$q33f_4)
#   -7   -5   -2   -1    0    1 
# 1822   44    1    7   87   25 
table(data$q33f_5)
#   -7   -5   -2   -1    0    1 
# 1822   44    1    7   97   15 
table(data$q33f_6)
#   -7   -5   -2   -1    0    1 
# 1822   44    1    7  100   12 
table(data$q33f_7)
#   -7   -5   -2   -1    0    1 
# 1822   44    1    7  111    1 
table(data$q33f_8)
#   -7   -5   -2   -1    0    1 
# 1822   44    1    7  111    1 
table(data$q33f_9)
#   -7   -5   -2   -1    0    1 
# 1822   44    1    7   99   1
table(data$q33f_10)
#   -7   -5   -2   -1    0    1 
# 1822   44    1    7  100   12 
table(data$q33f_11)
#   -7   -5   -2   -1    0    1 
# 1822   44    1    7   97   15 
table(data$q33f_12)
#   -7   -5   -2   -1    0    1 
# 1822   44    1    7   95   17 
table(data$q33f_13)
#   -7   -5   -2   -1    0 
# 1822   44    1    7  112 
table(data$q33f_14)
#   -7   -5   -2   -1    0    1 
# 1822   44    1    7  105    7 

############################################################################
table(data$q32_7) # Any other shock (specify)
# -2   -1    0    1 
# 28   39 1880   39
table(data$q33g_1) # Sale of ASSETS
#   -7   -5   -3   -1    0 
# 1947   20    4    1   14
table(data$q33g_2) # Engaged in additional income generating activities
#   -7   -5   -3   -1    0 
# 1947   20    4    1   14 
table(data$q33g_3) # Received assistance from Friends & family
#   -7   -5   -3   -1    0    1 
# 1947   20    4    1   12    2 
table(data$q33g_4) # Borrowed from friends & family
#   -7   -5   -3   -1    0    1 
# 1947   20    4    1   11    3 
table(data$q33g_5) # Took a loan from a financial institution
#   -7   -5   -3   -1    0    1 
# 1947   20    4    1   13    1 
table(data$q33g_6) # Credited purchases
#   -7   -5   -3   -1    0    1 
# 1947   20    4    1   10    4 
table(data$q33g_7) # Delayed payment obligations
#   -7   -5   -3   -1    0 
# 1947   20    4    1   14 
table(data$q33g_8) # Sold harvest in advance
#   -7   -5   -3   -1    0 
# 1947   20    4    1   14 
table(data$q33g_9) # Reduced food consumption
#   -7   -5   -3   -1    0    1 
# 1947   20    4    1   12    2 
table(data$q33g_10) # Reduced non-food Consumption
#   -7   -5   -3   -1    0    1 
# 1947   20    4    1   11    3 
table(data$q33g_11) # Relied on savings
#   -7   -5   -3   -1    0 
# 1947   20    4    1   14 
table(data$q33g_12) # Received assistance from government
#   -7   -5   -3   -1    0    1 
# 1947   20    4    1   13    1
table(data$q33g_13) # Took advanced payment from employer
#   -7   -5   -3   -1    0 
# 1947   20    4    1   14 
table(data$q33g_14) # Was covered by insurance policy
#   -7   -5   -3   -1    0 
# 1947   20    4    1   14 
############################################################################
## SHOCKS IN HOUSEHOLDS
table(data$q32_1) # Decrease in income from JOB LOSS or CLOSURE of Business
# -2   -1    0    1 
#  8    6 1215  757
table(data$q32_2) # Decrease in income from reduction in WORKING HOURS
# -2   -1    0    1 
# 11   13 1719  243
table(data$q32_3) # Decrease in income from LOSS OF HARVEST
# -2   -1    0    1 
# 20   12 1849  105
table(data$q32_4) # Reduction of sales of products that were not from a family or businesses' own agricultural production
# -2   -1    0    1 
# 17   23 1832  114 
table(data$q32_5) # Decrease in income from reduction in REMITTANCES
# -2   -1    0    1 
# 29   23 1817  117 
table(data$q32_6) # ILLNESS, injury, or death of income earning member of household
# -2   -1    0    1 
# 21   30 1771  164 
table(data$q32_7) # Any other shock (specify)
# -2   -1    0    1 
# 28   39 1880   39

############################################################################

table(data2$q34) # Since MARCH 2020, has any member of your HH received any type of assistance?
# -9   -2   -1    0    1 
#  2    6   13  236 1729 

## TYPES OF ASSISTANCE RECEIVED
table(data2$q35_1) # Received/not-Monthly allowance of GEL 200 for six months because of a lost job?
# -9   -7   -1    0    1 
#  2  255    7 1563  159 
table(data2$q35_2) # Received/not-Income tax exemptions?
# -9   -7   -2   -1    0    1 
#  3  255    3   18 1663   44 
table(data2$q35_3) # Received/not-One-time payment of GEL300 for self-employed people who lost income
# -9   -7   -1    0    1 
#  3  255   13 1473  242
table(data2$q35_4) # Received/not-GEL 200 payment for school supplies/ children?
# -9  -7  -2  -1   0   1 
#  3 255   2  19 852 855
table(data2$q35_5) # Received/not-Increase in monthly social vulnerability status payment
# -9   -7   -2   -1    0    1 
#  3  255    6    8 1598  116 
table(data2$q35_6) # Received/not-Loan (mortgages) subsidies?
# -9   -7   -2   -1    0    1 
#  3  255    6   21 1649   52
table(data2$q35_7) # Received/not-Subsidies on utility payments?
# -9   -7   -2   -1    0    1 
#  4  255    1   20  220 1486 
table(data2$q35_8) # Received/not-Relief on loan payments?
# -9   -7   -2   -1    0    1 
#  4  255    8   40 1358  321 
table(data2$q35_9) # Received/not-Another form of assistance?
# -9   -7   -2   -1    0    1
#  4  255   16   57 1597   57


# Duplicate the dataset with NA
data2 <- data

# install.packages("naniar")
# library(naniar)
# library(dplyr)
# Create quintiles
# replace -9, -2, and -1 with NA
data2 <- data2 %>% replace_with_na(replace = list(q29 = c(-9,-2,-1)))
data2 <- data2 %>% mutate(quint = ntile(q29, 5))
table(data2$quint)
#   1   2   3   4   5 
# 264 263 263 263 263

## Since [MARCH 2020], has any member of your household received any 
## type of assistance to reduce hardship due to COVID-19?
table(data2$q34)

## Food Security
table(data2$q31)
# -2  -1   1   2   3   4   5 
# 14  28  58 233 212 449 992 

## How would you evaluate the current financial state of your household?
table(data2$q38)
# -9  -2  -1   1   2   3   4 
#  5  23  18  15 655 924 346

## What is your expectation about the change of financial state of your family in the next 12 months?
table(data2$q39)
# -9  -2  -1   1   2   3   4   5 
#  5   8 559  14 351 639 308 102 

## Type of area
table(data2$settlement) # #1 urban, 2 small town, 3 rural, 4 capital
#   1   2   3   4 
# 591  61 586 748
data2 <- data2 %>% mutate(areatype = ifelse(between(settlement, 4, 4), 1,
                         ifelse(between(settlement, 1, 1), 2, 3)))
table(data2$areatype) # 1 capital, 2 urban, 3, rural
#   1   2   3 
# 748 591 647

data2 <- data2 %>% mutate(areatype2 = ifelse(between(areatype, 1, 2),1,2))
table(data2$areatype2) # 1 urban, 2, rural
#    1    2 
# 1339  647