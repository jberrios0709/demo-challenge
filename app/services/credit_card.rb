class CreditCard
  DEFAULT_VALUES = YAML.safe_load(File.read('app/data/credit_card.yml')).freeze

  def find_by_number(number)
    number = number.to_s
    data = DEFAULT_VALUES['allow'].select do |config|
      next unless config['lengths'].include? number.length

      config['options'].any? do |option|
        option['iin'].include? number[0..(option['length']-1)].to_i
      end
    end

    data.count.positive? ? data.first['name'] : nil
  end
end