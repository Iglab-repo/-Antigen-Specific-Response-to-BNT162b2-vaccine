library(Seurat)
library(dplyr)
library(ggplot2)
library(UpSetR)
library("data.table")

data123 <- fread("/hdd3/nagarajan/corona/5812_covid_vaccine_samples/5812-3_libraseqscorea1_IgAIgG_upsetplotdata_v2.tab")
ag.pos.table<-data.table(data123)
ag.pos.table


upset(ag.pos.table, sets =c("SARS-CoV-2","SARS-CoV","MERS-CoV","HCoV-OC43","HCoV-HKU1","SARS-CoV-2-D614G"), nintersects = NA,  keep.order = T, line.size = 0.7, point.size=2, order.by = "degree", decreasing = F,text.scale = 1.5,
      query.legend = "top", shade.alpha = 0.5, queries = list(
        list(query = function(x) {x["C_CALL"] %in% c("IGHG","IGHA","IGHM","IGHD")}, color = "#55A0FB", active = T, query.name = "IgG"),
        list(query = function(x) {x["C_CALL"] %in% c("IGHA","IGHM","IGHD")}, color = "#000080", active = T, query.name = "IgA"),
        list(query = function(x) {x["C_CALL"] %in% c("IGHM","IGHD")}, color = "#90BFF9", active = T, query.name = "IgM"),
        list(query = function(x) {x["C_CALL"] %in% c("IGHD")}, color = "#C8DEF9", active = T, query.name = "IgD")
        ))
dev.off()

