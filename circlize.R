library(reshape)
library(dplyr)
library(circlize)


FA_data_MX<-load("circlizetest.RData")
FA_data_MX$Current_Amount <- gsub('\\,', "",  FA_data_MX$Current.Amount2 )
FA_data_MX$Current_Amount <- gsub('\\$', "",  FA_data_MX$Current.Amount2 )
FA_data_MX$Current_Amount <- gsub('\\ ', "",  FA_data_MX$Current.Amount2 )
FA_data_MX$Current_Amount <- as.numeric (FA_data_MX$Current.Amount2 )
FA_data_MX$Current_Amount[is.na(FA_data_MX$Current_Amount)] <- 0
# FA_data_MX$Funding_Count <- 

circos.par("track.height" = 0.1)
circos.initialize(factors = FA_data_MX$Aid_class, x = FA_data_MX$Current_Amount)

circos.track(factors = FA_data_MX$Aid_class, y = FA_data_MX$Current_Amount,
             panel.fun = function(x, y) {
                circos.text(CELL_META$xcenter, CELL_META$cell.ylim[2] + uy(5, "mm"), 
                           CELL_META$sector.index)
             })


circos.track(factors = FA_data_MX$Funding.Agency.Acronym, y = FA_data_MX$Current.Amount2,
             panel.fun = function(x, y){
                circos.text(CELL_META$xcenter, CELL_META$cell.ylim[2] + uy(5, "mm"),
                                         CELL_META$sector.index)
            })
