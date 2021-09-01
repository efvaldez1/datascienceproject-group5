wd <- paste(getwd(), "/data/Data.csv", sep = "")
## Create data folder containing Data.csv in the same level
## of this R Script
data <- read.csv(wd, header = TRUE)

# Duplicate the dataset with NA
data2 <- data
#------------------------------------------------------------------------------------------------------------------------------------------------

# install.packages("foreign")
# install.packages("tidyr")
# install.packages("questionr")
# install.packages("ggplot2")
# install.packages("scales")
# install.packages("dplyr")
# install.packages("Hmisc")
# install.packages("plyr")
library(foreign)
library(tidyr)
library(questionr)
library(ggplot2)
library(scales)
library(dplyr)
library(Hmisc)
library(plyr)
#---------------------------------------------------------------------------------------------------------------

assist<-cbind.data.frame(data2$q35_1, data2$q35_2, data2$q35_3, data2$q35_4, data2$q35_5, 
                          data2$q35_6, data2$q35_7, data2$q35_8, data2$q35_9, data2$quint)
colnames(assist) <- c("assist.1", "assist.2", "assist.3", "assist.4",
                       "assist.5", "assist.6", "assist.7", "assist.8", "assist.9")
assistdf <- tidyr::gather(assist, "Assistance", "Response", assist.1:assist.9)
assistdf <- filter(assistdf, Response == 1)
assist_table <- table(assistdf$Assistance)

assist_temp <- as.data.frame(assist_table)
colnames(assist_temp)<-c("Assistance", "Freq")

assist_proptable_g <- assist_temp %>% 
  summarise(Assistance, Freq) %>%
  mutate(Perc = (Freq / 1986)) # total respondents are 1986

subset_to_order = subset(assist_proptable_g) 
subset_to_order$Assistance = with(subset_to_order, reorder(Assistance, Freq))
assist_proptable_g$Assistance = factor(assist_proptable_g$Assistance, levels = levels(subset_to_order$Assistance))

tiff('assist_types.tiff', width = 1200, height = 699, res=110)
assist <- ggplot(data=assist_proptable_g, aes(x=Perc, y=Assistance, width=0.7)) +
  geom_bar(position = 'dodge', stat = "identity", width = 0.5, colour="black") + 
  geom_text(aes(label=paste0(round(Perc, 4) * 100, "%")), size = 4.5, hjust = -0.5, position=position_dodge(width=0.7), colour="black") +
  scale_y_discrete(breaks=c("assist.1","assist.2","assist.3","assist.4","assist.5",
                            "assist.6","assist.7","assist.8","assist.9"),
                   labels=c("GEL 200 for job loss (6 months)",
                            "Income tax exemptions",
                            "GEL 300 for the self-employed who lost income",
                            "GEL 200 payment for school supplies/children",
                            "Increase in monthly social vulnerability status",
                            "Loan (mortgages) subsidies",
                            "Subsidies on utility payments",
                            "Relief on loan payments",
                            "Other form of assistance")) +
  scale_x_continuous(expand = expansion(mult = c(0, .19))) +
  # guides(fill = guide_legend(reverse = TRUE)) +
  theme_minimal()
assist_2 <- assist + theme(plot.margin = margin(0.2, 0.2, 0.2, 0.2, "cm"),
                                    panel.background = element_blank(),
                                    panel.grid = element_blank() ,
                                    axis.title = element_blank(),
                                    axis.text.y = element_text(size=14),
                                    axis.text.x=element_blank(),
                                    axis.ticks.x = element_blank(),
                                    legend.title=element_blank()) 

print(assist_2)
dev.off()

############################################################################
## Has any member of your household received any type of assistance (q34)
## by INCOME
assistrec_table <- table(data2$quint, data2$areatype, data2$q34)


assistrec_proptable <- round(100*prop.table(assistrec_table, 1),2)
assistrec_temp<-as.data.frame(assistrec_proptable)
colnames(assistrec_temp)<-c("Income","Response","Perc")
assistrec_temp <- filter(assistrec_temp, Response == 1)

tiff('assistrecvd.tiff', width = 1200, height = 699, res=100, compression = "lzw")
assistrec <- ggplot(data=assistrec_temp, aes(x=Income, y=Perc, fill = Income, width=0.5)) +
  geom_bar(position = 'dodge', stat = "identity", width = 0.5) + 
  geom_text(aes(label=round(Perc, 1)), size = 5, vjust = -0.5, position=position_dodge(width=0.5), colour="black") +
  scale_fill_viridis_d() +
  ylab("% of households)") +
  xlab("Income groups") +
  ylim(0,100) +
  scale_x_discrete(breaks=c(1:5),
                   labels=c("Quintile 1", "Quintile 2", "Quintile 3", "Quintile 4", "Quintile 5")) +
  theme_minimal() +
  # ggtitle("Concern for Finances") +
  theme(legend.position="bottom")
assistrec2 <- assistrec + theme(panel.grid.major.x = element_blank(),
                                plot.title = element_text(size = 18, face = "bold", hjust = 0.5),
                                plot.margin = margin(1, 1, 1, 1.5, "cm"),
                                axis.text=element_text(size=15),
                                axis.title=element_text(size=15),
                                plot.caption = element_text(hjust=0.5),
                                legend.position = "none")
print(assistrec2)
dev.off()

############################################################################
## Has any member of your household received any type of assistance (q34)
## by INCOME and TYPE OF AREA

assistincurb_table <- table(data2$quint, data2$areatype2, data2$q34)
assistincurb_temp<-as.data.frame(assistincurb_table)
colnames(assistincurb_temp)<-c("Income","Area","Response","Freq")

assistincurb_temp <- assistincurb_temp %>%
  group_by(Income, Area) %>%
  mutate(Perc = 100*(Freq / sum(Freq)))

assistincurb_temp <- filter(assistincurb_temp, Response == 1)
assistincurb_temp$Income <- factor(assistincurb_temp$Income)
assistincurb_temp$Area <- factor(assistincurb_temp$Area, levels = c(1:2),
                                         labels = c("Urban", "Rural"))

tiff('assistincurb2.tiff', width = 1200, height = 699, res=100, compression = "lzw")
assistincurb <- ggplot(data=assistincurb_temp, aes(x=Income, y=Perc, fill = Area, width=0.5)) +
  geom_bar(position = 'dodge', stat = "identity", width = 0.7, alpha = 0.9) + 
  geom_text(aes(label=round(Perc, 1)), size = 5, vjust = -0.5, position=position_dodge(width=0.5), colour="black") +
  scale_fill_viridis_d() +
  ylab("% of households)") +
  xlab("") +
  ylim(0,100) +
  scale_x_discrete(breaks=c(1:5),
                   labels=c("Quintile 1", "Quintile 2", "Quintile 3", "Quintile 4", "Quintile 5")) +
  theme_minimal() +
  # ggtitle("Concern for Finances") +
  theme(legend.position="bottom",
        panel.grid.major.x = element_blank(),
        plot.title = element_text(size = 18, face = "bold", hjust = 0.5),
        plot.margin = margin(1, 1, 1, 1.5, "cm"),
        axis.text=element_text(size=15),
        axis.title=element_text(size=15),
        legend.text = element_text(size=13),
        legend.title = element_blank(),
        plot.caption = element_text(hjust=0.5))
print(assistincurb)
dev.off()