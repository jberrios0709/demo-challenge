require 'rails_helper'

RSpec.describe Contact, type: :model do
  describe 'validations' do
    context 'invalid' do
      let(:contact) { Contact.new(params) }
      let(:user) { User.create(username: 'test@gmail.com', password: 'tetetetete')}
      let(:params) do
        {
          name: 'Jose-',
          birthdate: '2022-03-03',
          phone: '(+57) 320 432 05 09',
          address: 'test address',
          user_id: user.id,
          email: 'test@gmail.com',
          credit_card_network: 'visa'
        }
      end

      context 'when valid name' do
        before do
          params[:name] = 'Jose#$'
          contact.save
        end

        it 'invalid name' do
          expect(contact.valid?).to be_falsey
        end

        it 'return correctly error' do
          expect(contact.errors.first.attribute).to eq :name
        end
      end

      context 'when valid birthdate' do
        before do
          params[:birthdate] = '02-02-2023'
          contact.save
        end

        it 'invalid birthdate' do
          expect(contact.valid?).to be_falsey
        end

        it 'return correctly error' do
          expect(contact.errors.first.attribute).to eq :birthdate
        end
      end

      context 'when valid phone' do
        before do
          contact[:phone] = '(+57)3204320509'
          contact.save
        end

        it 'invalid telephone' do
          expect(contact.valid?).to be_falsey
        end

        it 'return correctly error' do
          expect(contact.errors.first.attribute).to eq :telephone
        end
      end

      context 'when valid address' do
        before do
          contact[:address] = nil
          contact.save
        end

        it 'invalid address' do
          expect(contact.valid?).to be_falsey
        end

        it 'return correctly error' do
          expect(contact.errors.first.attribute).to eq :address
        end
      end

      context 'when valid address' do
        before do
          Contact.create({
              name: 'Jose-',
              birthdate: '2022-03-03',
              phone: '(+57) 320 432 05 09',
              address: 'test address',
              user_id: user.id,
              email: 'repeated@gmail.com',
              credit_card_network: 'visa'
            })

          contact[:email] = 'repeated@gmail.com'
          contact.save
        end

        it 'invalid address' do
          expect(contact.valid?).to be_falsey
        end

        it 'return correctly error' do
          expect(contact.errors.first.attribute).to eq :email
        end
      end
    end
  end
end
