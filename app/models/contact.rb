class Contact < ApplicationRecord
  validates :name, format: {
                      with: /\A[a-zA-Z0-9-\w]*\z/,
                      message: "Only allows letters and minus (-)" }
  validates :birthdate, format: {
                      with: /([12]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01]))/,
                      message: "only accept two types of ISO 8601 date formats (%Y%m%d ) and (%F)." }
  validate :phone, :valid_telephone
  validates :address, presence: true
  validates :credit_card_network, presence: { message: 'Invalid credit card.' }
  validates :email, uniqueness: { scope: [:email, :user_id],
                                 message: 'Can’t be repeated per associated account.' }
  REGEX_TELEPHONES = [/\(\+\d{2}\)\s\d{3}\s\d{3}\s\d{2}\s\d{2}/, /\(\+\d{2}\)\s\d{3}\-\d{3}\-\d{2}\-\d{2}/]

  belongs_to :user

  def valid_telephone
    unless phone.match?(REGEX_TELEPHONES[0]) || phone.match?(REGEX_TELEPHONES[1])
      errors.add(:telephone, 'Valid phone formats are (+00) 000 000 00 00 00 or (+00) 000-000-00-00')
    end
  end
end
