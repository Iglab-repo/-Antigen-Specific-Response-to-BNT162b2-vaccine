library(data.table)
library(plotly)
library(ggplot2)
library(gridExtra)
library(ggfortify)
library(ggpubr)


IgG <- fread("/hdd3/nagarajan/corona/5812_covid_vaccine_samples/linchart_IGHG.txt",header=TRUE)
ag.igg<-data.table(IgG)
IgM <- fread("/hdd3/nagarajan/corona/5812_covid_vaccine_samples/linchart_IGHM.txt",header=TRUE)
ag.igm<-data.table(IgM)
IgA <- fread("/hdd3/nagarajan/corona/5812_covid_vaccine_samples/linchart_IGHA.txt",header=TRUE)
ag.iga<-data.table(IgA)


Order_time<-c("Pre","Day 8","Day 14","Day 42")

p1<-ggplot(data=ag.igg, aes(x=factor(Timepoint, level = Order_time), y=Count, group=Antigen)) +ggtitle("IgG")+theme(plot.title = element_text(hjust = 0.5))+
  geom_line(aes(color=Antigen), size=1.2)+guides(colour = guide_legend(reverse=T))+xlab("Timepoint")+ylab("Number of B cells")+scale_color_manual(values=c("#007a7a", "#FFC68C", "#ED5FA3","#CC82FD","#6F60F9"))+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),panel.background = element_blank(), axis.line = element_line(colour = "black"))
p1<-p1+labs(color = "Antigen cross-reactivity")

p2<-ggplot(data=ag.igm, aes(x=factor(Timepoint, level = Order_time), y=Count, group=Antigen)) + ggtitle("IgM")+theme(plot.title = element_text(hjust = 0.5))+
  geom_line(aes(color=Antigen), size=1.2)+guides(colour = guide_legend(reverse=T))+xlab("Timepoint")+ylab("Number of B cells")+scale_color_manual(values=c("#007a7a", "#FFC68C", "#ED5FA3","#CC82FD","#6F60F9"))+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),panel.background = element_blank(),axis.line = element_line(colour = "black"))
p2<-p2+labs(color = "Antigen cross-reactivity")
p3<-ggplot(data=ag.iga, aes(x=factor(Timepoint, level = Order_time), y=Count, group=Antigen)) + ggtitle("IgA")+theme(plot.title = element_text(hjust = 0.5))+
  geom_line(aes(color=Antigen), size=1.2)+guides(colour = guide_legend(reverse=T))+xlab("Timepoint")+ylab("Number of B cells")+scale_color_manual(values=c("#007a7a", "#FFC68C", "#ED5FA3","#CC82FD","#6F60F9"))+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),panel.background = element_blank(),axis.line = element_line(colour = "black"))

p3<-p3+labs(color = "Antigen cross-reactivity")
#tiff("/hdd3/nagarajan/test.tiff", units="in", width=12, height=3, res=600)
ggarrange(p1, p2, p3, ncol=3, nrow=1, common.legend = TRUE, legend="right")+ theme_set(theme(legend.key=element_blank()))
dev.off()