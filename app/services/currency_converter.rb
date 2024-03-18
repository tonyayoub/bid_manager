# app/services/currency_converter_service.rb

require 'net/http'
require 'uri'
require 'json'

class CurrencyConverterService
  API_KEY = "cur_live_s5SVKiCFWA42paPxK2SkFT01PRUtIRSRy4Rd1Wif".freeze
  URL = "https://api.currencyapi.com/v3/latest".freeze

  # Initialize the cache with hardcoded values
  @@cached_rates = {'USD' => 9.0, 'EUR' => 10.0, 'SEK' => 1}

  def self.fetch_rates(currencies = "SEK,EUR,USD")
    uri = URI("#{URL}?apikey=#{API_KEY}&currencies=#{currencies}")
    response = Net::HTTP.get(uri)
    data = JSON.parse(response)["data"]

    if data.nil?
      return @@cached_rates
    end

    # SEK value against USD
    sek_value = data["SEK"]["value"]

    conversion_rates = data.transform_values do |currency|
      if currency["code"] == "USD"
        sek_value
      else
        (1 / currency["value"]) * sek_value
      end
    end

    @@cached_rates = conversion_rates.merge("USD" => 1 / sek_value)

    @@cached_rates
  rescue => e
    puts "Error fetching new rates: #{e.message}"
    @@cached_rates
  end
end

class CurrencyConverter
  # Define conversion rates as a constant within the class
  # CONVERSION_RATES = {'USD' => 9.0, 'EUR' => 10.0, 'SEK' => 1}

  def self.convert_from(amount, currency)
    actual_rates = CurrencyConverterService.fetch_rates()
    if amount && actual_rates.has_key?(currency)
      amount * actual_rates[currency]
    else
      amount
    end
  end

  def self.convert_to(amount, currency)
    actual_rates = CurrencyConverterService.fetch_rates()
    if amount && actual_rates.has_key?(currency)
      amount / actual_rates[currency]
    else
      amount
    end
  end
end
