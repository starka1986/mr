#' Get exchange rates between two currencies in a given time frame
#'
#' Hitting the exchangerates.io API to get historical exchange rate from today to "user defined" days prior
#' @export
#' @param base Currency to convert FROM
#' @param symbol Currency to convert TO
#' @param days From how many days before
#' @importFrom httr GET
#' @importFrom httr content
#' @import data.table

convert_currency <- function(base, symbol, days){
  data <- GET(
    'https://api.exchangeratesapi.io/history',
    query = list(
      start_at = Sys.Date() - days,
      end_at   = Sys.Date(),
      base     = base,
      symbols  = symbol
    ))

  data <- content(data)
  data <- data$rates # extract from JSON

  data <- data.table(
    date = as.Date(names(data)),
    rate = as.numeric(unlist(data)))

  setorder(data, date)

  return(data)
}
