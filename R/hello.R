#' Dummy function printing hello world
#' @export
hello <- function() {
  print("Hello, world!")
}

#' @export
get_bitcoin_price <- function(retried = 0) {
  tryCatch( binance_coins_prices() [symbol == 'BTC', usd],
            error= function(e) {
              ## exponential backoff retries
              Sys.sleep(1 + retried^2)
              get_bitcoin_price(retried = retried + 1)
            })
}

get_bitcoin_price()

#' @export
forint <-  function(x) {
  dollar(x, prefix = '', suffix = 'Ft')
}

