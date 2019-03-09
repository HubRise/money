RSpec.describe HubriseMoney::Money do
  describe '.from_string' do
    it 'parses the value' do
      value_m = HubriseMoney::Money.from_string('100.50 EUR')
      expect(value_m.cents).to    eq(10050)
      expect(value_m.currency).to eq('EUR')
    end

    it 'parses the value' do
      value_m = HubriseMoney::Money.from_string('100.00 EUR')
      expect(value_m.cents).to    eq(10000)
      expect(value_m.currency).to eq('EUR')
    end

    it 'parses negative value' do
      value_m = HubriseMoney::Money.from_string('-100.00 EUR')
      expect(value_m.cents).to    eq(-10000)
      expect(value_m.currency).to eq('EUR')
    end

    it 'should fail' do
      expect { HubriseMoney::Money.from_string('100') }.to            raise_error(HubriseMoney::Money::Error)
      expect { HubriseMoney::Money.from_string('100 EUR') }.to        raise_error(HubriseMoney::Money::Error)
      expect { HubriseMoney::Money.from_string('100.5 EUR') }.to      raise_error(HubriseMoney::Money::Error)
      expect { HubriseMoney::Money.from_string('100.100 EUR') }.to    raise_error(HubriseMoney::Money::Error)
      expect { HubriseMoney::Money.from_string('+ 100.50 EUR') }.to   raise_error(HubriseMoney::Money::Error)
    end
  end

  describe ".country_to_currency" do
    it "returns currency" do
      expect(HubriseMoney::Money.country_to_currency("TW")).to eq("TWD")
    end
  end

  describe ".currency_to_symbol" do
    it "returns symbol" do
      expect(HubriseMoney::Money.currency_to_symbol("TWD")).to eq("$")
    end
  end
end
