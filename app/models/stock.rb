class Stock < ApplicationRecord

  def self.new_from_lookup(ticker_symbol)
    begin
      looked_up_stock = StockQuote::Stock.quote(ticker_symbol)

      # Strip out coman from last price
      price = strip_commas(looked_up_stock.l)

      # Create new stock object and return to caller
      new(name: looked_up_stock.name, ticker: looked_up_stock.symbol, last_price: price)
    rescue Exception => e
      return nil
    end
  end
  
  def self.strip_commas(number)
    number.gsub(",", "")
  end
end
