library(tidyverse)
library(dplyr)

#******************************importing Highest movie sales data sets*****************************

highest_mov_Sale_Jan_2022_df <- read.csv("Highest_movie_sales_Jan_2022.csv")

View(highest_mov_Sale_Jan_2022_df)

#**************************************removing columns all x nummeric column**************************** 

rem_x  <- select(highest_mov_Sale_Jan_2022_df, -X)

highest_mov_Sale_Jan_2022_df <- rem_x

view(highest_mov_Sale_Jan_2022_df)


#**************************************remove na data from the highest_mov_sale data frame***************

rem_na <- highest_mov_Sale_Jan_2022_df %>%
            select(everything())  %>%
            na.omit()

highest_mov_Sale_Jan_2022_df <- rem_na
view(highest_mov_Sale_Jan_2022_df)


#*************************************arrange the movie title in alphabatical order*********************

srt_title <- highest_mov_Sale_Jan_2022_df[order(highest_mov_Sale_Jan_2022_df$Title),]

highest_mov_Sale_Jan_2022_df <- srt_title

view(highest_mov_Sale_Jan_2022_df)


#******************************************format date into month, day, year**************************

# change character date to Date format and sort it according to the relase date and convert back to character

# convert date from character to Date format
highest_mov_Sale_Jan_2022_df$Release.Date <- as.Date(highest_mov_Sale_Jan_2022_df$Release.Date, format = "%m/%d/%Y")

# check date data type its in date type
class(highest_mov_Sale_Jan_2022_df$Release.Date)

# change the format date back to character type
highest_mov_Sale_Jan_2022_df$Release.Date <- format(highest_mov_Sale_Jan_2022_df$Release.Date, "%m/%d/%Y")

View(highest_mov_Sale_Jan_2022_df)


#************************************************Taking Average of domestic, international, and world sales*************************
install.packages("scales")
library(scales)

# taking average of domestic sales and put it into new column Avg_Dom_Sales

highest_mov_Sale_Jan_2022_df$Domestic.Sales..in... <- as.numeric(gsub('[$,]', '', highest_mov_Sale_Jan_2022_df$Domestic.Sales..in...))

Avg_Dom_Sales <- dollar_format()(mean(highest_mov_Sale_Jan_2022_df$Domestic.Sales..in...))

Avg_Dom_Sales

highest_mov_Sale_Jan_2022_df$Domestic.Sales..in... <- dollar_format()(highest_mov_Sale_Jan_2022_df$Domestic.Sales..in...)

highest_mov_Sale_Jan_2022_df$Avg_Dome_sales = NA

highest_mov_Sale_Jan_2022_df[1,11] = Avg_Dom_Sales



# taking average of international sales and put it into new column Avg_Int_Sales

highest_mov_Sale_Jan_2022_df$International.Sales..in... <- as.numeric(gsub('[$,]', '', highest_mov_Sale_Jan_2022_df$International.Sales..in...))

Avg_In_Sales <- dollar_format()(mean(highest_mov_Sale_Jan_2022_df$International.Sales..in...))

Avg_In_Sales

highest_mov_Sale_Jan_2022_df$International.Sales..in... <- dollar_format()(highest_mov_Sale_Jan_2022_df$International.Sales..in...)

highest_mov_Sale_Jan_2022_df$Avg_Int_Sales = NA

highest_mov_Sale_Jan_2022_df[1,12] = Avg_In_Sales


# taking average of world sales and put it into new column Avg_Int_Sales

highest_mov_Sale_Jan_2022_df$World.Sales..in... <- as.numeric(gsub('[$,]', '', highest_mov_Sale_Jan_2022_df$World.Sales..in...))

Avg_Wd_Sales <- dollar_format()(mean(highest_mov_Sale_Jan_2022_df$World.Sales..in...))

Avg_Wd_Sales

highest_mov_Sale_Jan_2022_df$World.Sales..in... <- dollar_format()(highest_mov_Sale_Jan_2022_df$World.Sales..in...)

highest_mov_Sale_Jan_2022_df$Avg_Wld_Sales = NA

highest_mov_Sale_Jan_2022_df[1,13] = Avg_Wd_Sales

View(highest_mov_Sale_Jan_2022_df)

write.csv(highest_mov_Sale_Jan_2022_df,"high_mov_sale_2022.csv")


#for write file in xlsx
install.packages("writexl")
library(writexl)
write_xlsx(highest_mov_Sale_Jan_2022_df,"high_mov_sale_2022.xlsx")




