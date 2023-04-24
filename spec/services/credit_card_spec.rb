require 'rails_helper'

RSpec.describe CreditCard do
  subject(:credit_card) { described_class.new.find_by_number(number) }

  context 'when is american express' do
    let(:number) { '371449635398431' }

    it 'return correctly data' do
      expect(credit_card).to eq 'American Express'
    end
  end

  context 'when is diners club' do
    let(:number) { '36569309025904' }

    it 'return correctly data' do
      expect(credit_card).to eq 'Diners Club'
    end
  end

  context 'when is Discover' do
    let(:number) { '6011111111111117' }

    it 'return correctly data' do
      expect(credit_card).to eq 'Discover'
    end
  end

  context 'when is JCB' do
    let(:number) { '3530111333300000' }

    it 'return correctly data' do
      expect(credit_card).to eq 'JCB'
    end
  end

  context 'when is MasterCard' do
    let(:number) { '5555555555554444' }

    it 'return correctly data' do
      expect(credit_card).to eq 'MasterCard'
    end
  end

  context 'when is visa' do
    let(:number) { '4111111111111111' }

    it 'return correctly data' do
      expect(credit_card).to eq 'Visa'
    end
  end
end
