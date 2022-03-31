library(Seurat)
library(dplyr)
library(ggplot2)
library(UpSetR)
library("data.table")

data123 <- fread("/hdd3/nagarajan/corona/5812_covid_vaccine_samples/unique-shared_clonotypes_upsetplot_v2_20May2021.txt")
ag.pos.table<-data.table(data123)
ag.pos.table

tiff("/hdd3/nagarajan/corona/5812_covid_vaccine_samples/figures/Clonotypebased.tiff", units="in", width=10, height=5, res=600)
upset(ag.pos.table, sets = c("PRE","DAY8","DAY14","DAY42"), nintersects = NA,  keep.order = T, line.size = 0.7, point.size=2, order.by = "degree", decreasing = F,text.scale=1.5,
      query.legend = "top", shade.alpha = 0.5, queries = list(
        list(query = function(x) {x["C_CALL"] %in% c("IGHG","IGHA","IGHM","IGHD","Multi")}, color = "#55A0FB", active = T, query.name = "IgG"),
        list(query = function(x) {x["C_CALL"] %in% c("IGHA","IGHM","IGHD","Multi")}, color = "#000080", active = T, query.name = "IgA"),
        list(query = function(x) {x["C_CALL"] %in% c("IGHM","IGHD","Multi")}, color = "#93F7DF", active = T, query.name = "IgM"),
        list(query = function(x) {x["C_CALL"] %in% c("IGHD","Multi")}, color = "#C8DEF9", active = T, query.name = "IgD"),
        list(query = function(x) {x["C_CALL"] %in% c("Multi")}, color = "#9f9fed", active = T, query.name = "Multi")))
dev.off()

#for 2iso and 3isotypes inclusion
#upset(ag.pos.table, sets = c("PRE","DAY8","DAY14","DAY42"), nintersects = NA,  keep.order = T, line.size = 0.7, point.size=2, order.by = "degree", decreasing = F,
 # query.legend = "top", shade.alpha = 0.5, queries = list(
  #  list(query = function(x) {x["C_CALL.H"] %in% c("IGHG","IGHA","IGHM","IGHD","2ISO","3ISO")}, color = "purple", active = T, query.name = "IgG"),
   # list(query = function(x) {x["C_CALL.H"] %in% c("IGHA","IGHM","IGHD","2ISO","3ISO")}, color = "tan", active = T, query.name = "IgA"),
    #list(query = function(x) {x["C_CALL.H"] %in% c("IGHM","IGHD","2ISO","3ISO")}, color = "black", active = T, query.name = "IgM"),
    #list(query = function(x) {x["C_CALL.H"] %in% c("IGHD","2ISO","3ISO")}, color = "grey", active = T, query.name = "IgD"),
    #list(query = function(x) {x["C_CALL.H"] %in% c("2ISO","3ISO")}, color = "red", active = T, query.name = "2-isotypes"),
    #list(query = function(x) {x["C_CALL.H"] %in% c("3ISO")}, color = "cyan", active = T, query.name = "3-isotypes")
    #))



















#*************************useful commands and parameters


#dev.off()
#, scale.intersections = "log10", show.numbers = "no"

#scale.intersections = "log10"
#set_sizes=(upset_set_size() + theme(axis.text.x=element_text(angle=90)) + scale_y_continuous(trans=reverse_log_trans())),


#reverse_log_trans(base = 10)


#reverse_log_trans = function(base=10) {
#  trans_new(
#    paste0('reverselog-', base),
#    preserve_infinite(function(x) -log(x, base)),
#    preserve_infinite(function(x) base^-x),
#    log_breaks(base=base),
#    domain=c(1e-100, Inf)
#  )
#}


#base_annotations=list(
 # 'Intersection size'=intersection_size(counts=FALSE)
#),