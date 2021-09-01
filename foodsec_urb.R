wd <- paste(getwd(), "/data/Data.csv", sep = "")
## Create data folder containing Data.csv in the same level
## of this R Script
data <- read.csv(wd, header = TRUE)

# library(viridis)
# library (naniar)
## replace -2, and -1 with NA
data2 <- data2 %>% replace_with_na(replace = list(q31 = c(-2,-1)))
foodsecurb_table <- table(data2$areatype, data2$q31)
foodsecurb_proptable <- round(100*prop.table(foodsecurb_table, 1),2)

foodsecurb_temp<-as.data.frame(foodsecurb_proptable)
colnames(foodsecurb_temp)<-c("Area", "Response","Perc")
foodsecurb_temp$Response<-factor(foodsecurb_temp$Response)

tiff('foodsec_urb.tiff', width = 1200, height = 699, res=110)
foodsecurb <- ggplot(data=foodsecurb_temp, aes(x=Area, y=Perc, fill=Response)) +
  geom_bar(stat = "identity", width = 0.6, alpha = 0.9) +
  geom_text(aes(label=round(Perc, 1)), size=4.5,  position=position_stack(vjust = 0.5), colour="black") +
  ylab("% of households") +
  guides(fill = guide_legend(reverse = TRUE)) +
  theme_bw() +
  scale_y_continuous(breaks = seq(0, 100, by=20), limits=c(0,101)) +
  # scale_fill_brewer(name = "Response", labels = c("Every day","Several times a week","Once a week","Less often", "Never"), palette="Blue") +
  scale_fill_viridis_d(name = "Response", labels = c("Every day","Several times a week","Once a week","Less often", "Never")) +
  scale_x_discrete(breaks=c(1:3),
                   labels=c("Capital", "Urban", "Rural")) +
  theme(panel.grid.major.x = element_blank(),
        axis.title.x = element_blank(),
        plot.margin = margin(0.75, 0.75, 0.75, 0.75, "cm"), #para may enough margins      axis.text=element_text(size=11), #para tama ang size ng labels
        axis.text=element_text(size=14), #para tama ang size ng labels
        axis.title=element_text(size=14),
        legend.position = "bottom",
        legend.text=element_text(size=13),
        legend.title = element_text(size=13),
        strip.text.x = element_text(size = 14))

print(foodsecurb)    
dev.off()

# END