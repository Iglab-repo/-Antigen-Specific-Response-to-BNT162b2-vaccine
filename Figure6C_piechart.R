library(data.table)
library(plotly)
library(ggplot2)
library(gridExtra)


get_legend<-function(myggplot){
  tmp <- ggplot_gtable(ggplot_build(myggplot))
  leg <- which(sapply(tmp$grobs, function(x) x$name) == "guide-box")
  legend <- tmp$grobs[[leg]]
  return(legend)
}

#Igd=#C8DEF9
#igm=#93F7DF
#igg=#55A0FB
#iga=#000080


# Create Data
data_pre <- data.frame(Isotype=c("IgG","IgA","IgM","IgD"),value=c(7.97546012269939,3.68098159509202,85.2760736196319,2.45398773006135))
data_day8 <- data.frame(Isotype=c("IgG","IgA","IgM","IgD"),value=c(9.83606557377049,4.91803278688525,82.7868852459016,2.45901639344262))
data_day14 <- data.frame(Isotype=c("IgG","IgA","IgM","IgD"),value=c(38.28125,18.75,42.1875,0.78125))
data_day42 <- data.frame(Isotype=c("IgG","IgA","IgM","IgD"),value=c(34.7222222222222,8.33333333333333,56.9444444444444,0))

p1<-ggplot(data_pre, aes(x="", y=value, fill=Isotype))+ scale_fill_manual(values=c("#000080","#C8DEF9", "#55A0FB", "#93F7DF"))+geom_bar(stat="identity", width=1, color="white") +  coord_polar("y", start=0) +theme_void() +theme(legend.position="none")
p2<-ggplot(data_day8, aes(x="", y=value, fill=Isotype)) + scale_fill_manual(values=c("#000080","#C8DEF9", "#55A0FB", "#93F7DF"))+ geom_bar(stat="identity", width=1, color="white") +  coord_polar("y", start=0) +theme_void() +theme(legend.position="none")
p3<-ggplot(data_day14, aes(x="", y=value, fill=Isotype)) + scale_fill_manual(values=c("#000080","#C8DEF9", "#55A0FB", "#93F7DF"))+ geom_bar(stat="identity", width=1, color="white") +  coord_polar("y", start=0) +theme_void() +theme(legend.position="none")
p4<-ggplot(data_day42, aes(x="", y=value, fill=Isotype)) + scale_fill_manual(values=c("#000080","#C8DEF9", "#55A0FB", "#93F7DF"))+ geom_bar(stat="identity", width=1, color="white") +  coord_polar("y", start=0) +theme_void()
p1<-p1+labs(title="Pre")+theme(plot.title = element_text(color="black", size=12, face="bold", hjust = 0.5))
p2<-p2+labs(title="Day 8")+theme(plot.title = element_text(color="black", size=12, face="bold", hjust = 0.5))
p3<-p3+labs(title="Day 14")+theme(plot.title = element_text(color="black", size=12, face="bold", hjust = 0.5))
p4<-p4+labs(title="Day 42")+theme(plot.title = element_text(color="black", size=12, face="bold", hjust = 0.5))
legend <- get_legend(p4)
p4=p4+theme(legend.position="none")
tiff("/hdd3/nagarajan/test.tiff", units="in", width=10, height=10, res=600)
grid.arrange(p1,p2,p3,p4,legend, nrow=1, ncol=5)
dev.off()

###########SARS2-only
#Pre,13.0434782608696,8.69565217391304,78.2608695652174,0
#Day_8,17.6470588235294,5.88235294117647,76.4705882352941,0
#Day_14,38.28125,18.75,42.1875,0.78125
#Day_42,49.0566037735849,7.54716981132075,35.8490566037736,7.54716981132075

##############SARS2-cross reactive
#Timepoint,IgG,IgA,IgM,IgD
#Pre,7.97546012269939,3.68098159509202,85.2760736196319,2.45398773006135
#Day_8,9.83606557377049,4.91803278688525,82.7868852459016,2.45901639344262
#Day_14,28.9855072463768,42.0289855072464,28.2608695652174,0.72463768115942
#Day_42,34.7222222222222,8.33333333333333,56.9444444444444,0


