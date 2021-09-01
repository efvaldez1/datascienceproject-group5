library(foreign)
library(dplyr)
library(ggplot2)

wd <- paste(getwd(), "/data/Data.csv", sep = "")
## Create data folder containing Data.csv in the same level
## of this R Script
data <- read.csv(wd, header = TRUE)

## employed or not before the pandemic
table(data$q23)
## employed or not before the pandemic
table(data$q27_)

# switched or not
table(data$q25)

## correct q27, generate q27_ if q25 = 1 (same), copy q23 values
## if q25 is otherwise, copy q27 values
data <- data %>% mutate(q27_ = ifelse(q25 == 1, q23, q27))
## select the following variables
data2 <- data %>% select(q24, q23, q25, q27, q27_)

## check the distribution of those who are still employed during the pandemic
table(data$q24)
## -2   -1    0    1 
##  4    2 1220  760

## keep only those who are still employed after the pandemic (q24==1)
data3 <- data2 %>% filter(q24 == 1)

## check sector distribution before the pandemic
table(data3$q23)
# -7  -2  -1   1   2   3   4   5   6   7   8   9  10  11  12  13  14 
# 41  24   5  44   3  32  67  71  41  23  22  10  26  59 212  41  39 

## check sector distribution after the pandemic
table(data3$q27_)
# -7  -2  -1   1   2   3   4   5   6   7   8   9  10  11  12  13  14 
#  3  23   4  49   2  35  67  82  46  21  18  12  26  63 217  42  50 
## check the data if you only keep q27_ = -7
data4 <- data3 %>% filter(q27_ == -7)
# 3 observations of 5 variables
## check the data if you only keep q23 = -7
data4 <- data3 %>% filter(q23 == -7)
# 3 observations of 5 variables
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = 

# generate a table for those who switch or not remove -1 and -2 responses 
# in each variable
data2 <- data %>% select(q23, q25, q27_, wt)
response <- c(1:14)
data2 <- data2 %>% filter(q23 %in% response)
data2 <- data2 %>% filter(q27_ %in% response)

## Check the distributions for each variable
table(data2$q25)
#   1   2 
# 643  47 
table(data2$q23)
# 1   2   3   4   5   6   7   8   9  10  11  12  13  14 
# 44   3  32  67  71  41  23  22  10  26  59 212  41  39
table(data2$q27_)
# 1   2   3   4   5   6   7   8   9  10  11  12  13  14 
# 46   2  31  64  73  44  20  16  12  26  61 211  41  43 
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = 
## check why there are only 690 respondents who either switch or not
response2 <- c(1:2)
data5 <- data %>% select(q23, q25, q27_)
data5 <- data5 %>% filter(q25 %in% response2)
table(data5$q23)
# -2  -1   1   2   3   4   5   6   7   8   9  10  11  12  13  14 
# 23   3  44   3  32  67  71  41  23  22  10  26  59 212  41  39 
table(data5$q27_)
# -2  -1   1   2   3   4   5   6   7   8   9  10  11  12  13  14 
# 22   4  46   2  31  64  73  44  20  16  12  26  61 211  41  43 
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = 

## Collapse the sector variables q23(before) and q27_(after) to 
## broader categories such as Agriculture, Industry and Service
data_2 <- data2 %>% mutate(Before = ifelse(between(q23, 1, 1), "Agriculture",
                                                       ifelse(between(q23, 2, 4), "Industry", "Service")))
data_2 <- data_2 %>% mutate(After = ifelse(between(q27_, 1, 1), "Agriculture",
                                           ifelse(between(q27_, 2, 4), "Industry", "Service")))
## Check distributions of the new variables
data_2 <- data_2 %>% select(Before, After, wt)
table(data_2$Before)
# Agriculture    Industry     Service 
#          44         102         544 
table(data_2$After)
# Agriculture    Industry     Service 
#          46          97         547 

###########################################################################
## Sankey plots
dat_fin <- data_2 %>%
  group_by(Before, After) %>%
  summarise(freq = sum(wt)) %>% # to perform weighted counts change n() ton = n() to n = sum(wt) 
  ungroup()
#  Before      After          freq
#   <chr>       <chr>         <dbl>
# 1 Agriculture Agriculture  70786.
# 2 Agriculture Service       1573.
# 3 Industry    Agriculture    931.
# 4 Industry    Industry    124351.
# 5 Industry    Service       6507.
# 6 Service     Agriculture   3781.
# 7 Service     Industry      3506.
# 8 Service     Service     609305.
# devtools::install_github("corybrunson/ggalluvial")

library("ggalluvial")
library(viridis)

## alluvial for broad sectors (3)
tiff('sector_alluv3.tiff', width = 1200, height = 699, res=110, compression = "lzw")
ggplot(dat_fin, aes(y = freq, axis1 = Before, axis2 = After)) +
  geom_alluvium(aes(fill = After, color = After), 
                width = 1/12, alpha = 0.6, knot.pos = 0.3, aes.bind=TRUE) +
  geom_stratum(width = 1/6, absolute = FALSE, color = "grey") +
  # geom_text(stat = "stratum", label.strata = TRUE, size = 3) +
  geom_text(stat = "stratum", aes(label = after_stat(stratum)), size = 5) +
  scale_x_discrete(limits =c("Before COVID-19\noutbreak", "After COVID-19\noutbreak"), expand = c(.05, .05)) +
  # scale_fill_viridis_d() +
  # scale_fill_manual(values  = c("darkorchid1", "darkorange1", "skyblue1")) +
  # scale_color_manual(values = c("darkorchid1", "darkorange1", "skyblue1")) +
  ylab("") +
  theme_void() +
  theme(legend.position = "none",
        panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        title = element_text(size = 20),
        axis.text.y = element_blank(),
        axis.text.x = element_text(size = 15, face = "bold"))
dev.off()

# ==============================================================================
  
## alluvial for more disaggregated sectors
dat_fin2 <- data2 %>%
    group_by(q23, q27_) %>%
    summarise(freq = sum(wt)) %>% # to perform weighted counts change n() ton = n() to n = sum(wt) 
    ungroup()

tiff('sector_alluv2.tiff', width = 1200, height = 699, res=110, compression = "lzw")
g <- ggplot(dat_fin2, aes(y = freq, axis1 = q27_, axis2 = q23)) +
  geom_alluvium(aes(fill = as.factor(q27_), color = as.factor(q27_)), 
                width = 1/12, alpha = 0.6, knot.pos = 0.3, aes.bind=TRUE) +
  geom_stratum(width = 1/6, absolute = FALSE, color = "grey") +
  geom_text(stat = "stratum", aes(label = after_stat(stratum)), size = 5) +
  scale_x_discrete(limits =c("Before COVID-19\noutbreak", "After COVID-19\noutbreak"), expand = c(.05, .05)) +
  scale_fill_viridis_d() +
  ylab("") +
  theme_void() +
  theme(legend.position = "none",
    panel.grid.major = element_blank(), 
    panel.grid.minor = element_blank(),
    title = element_text(size = 20),
    axis.text.y = element_blank(),
    axis.text.x = element_text(size = 15, face = "bold"))
print(g)
dev.off()