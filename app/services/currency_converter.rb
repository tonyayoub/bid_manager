class CurrencyConverter
  def self.convert_from(amount, currency)
    conversion_rates = {'USD' => 9.0, 'EUR' => 10.0, 'SEK' => 1}
    if conversion_rates.has_key?(currency)
      puts "found currency"
      puts currency
      puts amount
      puts conversion_rates[currency]
      amount * conversion_rates[currency]
    else
      puts "currency not found"
      amount
    end
  end

  def self.convert_to(amount, currency)
    conversion_rates = {'USD' => 9.0, 'EUR' => 10.0, 'SEK' => 1}
    if conversion_rates.has_key?(currency)
      amount / conversion_rates[currency]
    else
      amount
    end
  end
end