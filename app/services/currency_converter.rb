class CurrencyConverter
  def self.convert(amount, from_currency)
    conversion_rates = {'USD' => 9.0, 'EUR' => 10.0, 'SEK' => 1}
    if conversion_rates.has_key?(from_currency)
      amount * conversion_rates[from_currency]
    else
      amount # If the currency is not listed, assume it's SEK
    end
  end
end