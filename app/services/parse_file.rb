require 'csv'
class ParseFile
  def initialize(csv_file)
    @csv_file = csv_file
  end

  def call
    status = :failed
    @csv_file.update status: :processing
    CSV.foreach(@csv_file.path) do |row|
      contact = Contact.new(match_mapping_with_row(row))
      if contact.save
        status = :finished
      else
        ErrorLog.create(csv_file: @csv_file, message: contact.errors.full_messages, row: row)
      end
    end
    @csv_file.update status: status
  end

  private

  def mapping
    @mapping ||= parse_mapping
  end

  def parse_mapping
    temp = JSON.parse @csv_file.mapping
    temp.keys.each { |m| temp[m] = temp[m].to_i}
    temp
  end

  def match_mapping_with_row(row)
    {
      name: row[mapping['name']],
      birthdate: row[mapping['birthdate']],
      phone: row[mapping['phone']],
      address: row[mapping['address']],
      credit_card_number: row[mapping['credit_card_number']],
      email: row[mapping['email']],
      credit_card_network: CreditCard.new.find_by_number(row[mapping['credit_card_number']]),
      user_id: @csv_file.user.id
    }
  end
end