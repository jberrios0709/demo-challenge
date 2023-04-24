class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :birthdate
      t.string :phone
      t.string :address
      t.string :credit_card_number
      t.string :credit_card_network
      t.string :email
      t.belongs_to :user

      t.timestamps
    end
  end
end
