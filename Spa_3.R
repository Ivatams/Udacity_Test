library(xml2)
library(tidyverse)
library(rvest)
library(magrittr)

  Apartments <- data.frame()
  for (Pages_result in seq(from = 1, to = 6, by = 1)) {
  Beauty_Spa <- paste0("https://www.propertypro.ng/property-for-short-let/in/rivers/port-harcourt",Pages_result,"&page")
  pages <- read_html(Beauty_Spa) # Read object into pages
  HostName <- pages %>% html_nodes("h4") %>% html_text() # extract product name CSS Code from website
  PhoneNumber <- pages %>% html_nodes(".phone-icon") %>% html_text()
  #HostAddress <- pages %>% html_nodes(".voffset-bottom-10 strong") %>%  html_text()
  Description <- pages %>% html_nodes("h4") %>%  html_text()
  DateListed <- pages %>% html_nodes("h5") %>% html_text()
  Price <- pages %>% html_nodes(".featured-text") %>% html_text()
  #Email_Address <- pages %>% html_nodes(".price") %>% html_text()
  Apartments <- rbind(Apartments,data.frame(Description,HostName,PhoneNumber,DateListed,Price,stringsAsFactors = FALSE))
  #write.csv(Apartments,"5Bedrooms")
  print(paste("Page:",Pages_result))
}
view(Apartments)
#write.csv(Apartments,"Port-Harcourt")
