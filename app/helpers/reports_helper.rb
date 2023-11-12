module ReportsHelper

  def operation_sum(arr)
    arr.map {|el| el[1]}.sum
  end

  def exchange_rates(currency)
    case currency
    when 'UAH'
      'ua.jpeg'
    when 'USD'
      'usd.png'
    when 'EUR'
      'eur.jpeg'
    when 'PLN'
      'pln.png'
    when 'GBP'
      'gbr.png'
    end
  end
  def today_currency
    fx = OpenExchangeRates::Rates.new
    [
      {currency: fx.convert(1, from: 'PLN', to: 'UAH'), desc: 'Польського злотого', sign: 'zł'},
      {currency: fx.convert(1, from: 'USD', to: 'UAH'), desc: 'Американського доллара', sign: '$'},
      {currency: fx.convert(1, from: 'EUR', to: 'UAH'), desc: 'Євро', sign: '€'},
      {currency: fx.convert(1, from: 'GBP', to: 'UAH'), desc: 'Англійського фунта', sign: '£'}
    ]
  end
end
