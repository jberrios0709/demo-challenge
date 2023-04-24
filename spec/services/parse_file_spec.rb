require 'rails_helper'

RSpec.describe ParseFile do
  subject(:parse_file) { described_class.new(csv_file).call }

  context 'when all contacts are ok' do
    let(:user) { User.create(username: 'test@gmail.com', password: 'testets')}
    let(:csv_file) do
      CsvFile.create(
        header: 'name,birthdate,phone,address,credit_card_number,email',
        mapping: "{\"name\":\"0\",\"birthdate\":\"1\",\"phone\":\"2\",\"address\":\"3\",\"credit_card_number\":\"4\",\"email\":\"5\"}",
        status: :on_hold,
        path: Rails.root.join('spec', 'fixtures', 'csv', 'all_are_correctly.csv' ),
        user: user
      )
    end

    it 'process ok' do
      expect(parse_file).to eq true
    end

    it 'create 6 contact' do
      expect {parse_file}.to change(Contact, :count).from(0).to 6
    end
  end
end
