wd <- paste(getwd(), "/data/Data.csv", sep = "")
## Create data folder containing Data.csv in the same level
## of this R Script
data <- read.csv(wd, header = TRUE)

# library(ggplot2)
# library(viridis)
# library (naniar)
## replace -2, and -1 with NA
data2 <- data2 %>% replace_with_na(replace = list(q39 = c(-9,-2,-1)))
futurefinstate_table <- table(data2$quint, data2$q39)
futurefinstate_proptable <- round(100*prop.table(futurefinstate_table, 1),2)

futurefinstate_temp<-as.data.frame(futurefinstate_proptable)
colnames(futurefinstate_temp)<-c("Income", "Response","Perc")

futurefinstate_temp$Response<-factor(futurefinstate_temp$Response)

tiff('futurefinstate.tiff', width = 1200, height = 699, res=110)
futurefinstate <- ggplot(data=futurefinstate_temp, aes(x=Income, y=Perc, fill=Response)) +
  geom_bar(stat = "identity", width = 0.8) +
  geom_text(aes(label=round(Perc, 1)), size=4,  position=position_stack(vjust = 0.5), colour="black") +
  ylab("% of Households") +
  guides(fill = guide_legend(reverse = TRUE)) +
  theme_bw() +
  scale_y_continuous(breaks = seq(0, 100, by=20), limits=c(0,101)) +
  scale_fill_viridis_d(name = "Response", labels = c("Improved very much","Improved slightly","Same as now","Worsened slightly","Worsened very much")) +
  scale_x_discrete(breaks=c(1:5),
                   labels=c("Quantile 1", "Quantile 2", "Quantile 3", "Quantile 4", "Quantile 5")) +
  theme(panel.grid.major.x = element_blank(),
        axis.title.x = element_blank(),
        plot.margin = margin(0.75, 0.75, 0.75, 0.75, "cm"), #para may enough margins      axis.text=element_text(size=11), #para tama ang size ng labels
        axis.text=element_text(size=14), #para tama ang size ng labels
        axis.title=element_text(size=14),
        legend.position = "bottom",
        legend.text=element_text(size=13),
        legend.title = element_text(size=13),
        strip.text.x = element_text(size = 14))

print(futurefinstate)    
dev.off()