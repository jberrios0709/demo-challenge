require 'rails_helper'

RSpec.describe CsvFile, type: :model do
  describe 'validations' do
    context 'invalid' do
      let(:contact) { described_class.new(params) }
      let(:user) { User.create(username: 'test@gmail.com', password: 'tetetetete')}
      let(:params) do
        {
          header: 'name,birthdate,phone,address,credit_card_number,email',
          mapping: "{\"name\":\"0\",\"birthdate\":\"1\",\"phone\":\"2\",\"address\":\"3\",\"credit_card_number\":\"4\",\"email\":\"5\"}",
          status: :on_hold,
          path: Rails.root.join('spec', 'fixtures', 'csv', 'all_are_correctly.csv' ),
          user_id: user.id
        }
      end

      context 'when valid path' do
        before do
          params[:path] = nil
          contact.save
        end

        it 'invalid path' do
          expect(contact.valid?).to be_falsey
        end

        it 'return correctly error' do
          expect(contact.errors.first.attribute).to eq :path
        end
      end

      context 'when valid columns mapping' do
        before do
          params[:mapping] = "{\"name\":\"0\",\"birthdate\":\"1\",\"phone\":\"2\",\"address\":\"3\",\"credit_card_number\":\"4\",\"email\":\"1\"}"
          contact.save
        end

        it 'invalid mapping' do
          expect(contact.valid?).to be_falsey
        end

        it 'return correctly error' do
          expect(contact.errors.first.attribute).to eq :mapping
        end
      end
    end
  end
end
