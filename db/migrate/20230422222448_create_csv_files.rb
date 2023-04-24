class CreateCsvFiles < ActiveRecord::Migration[7.0]
  def change
    create_table :csv_files do |t|
      t.string :path, null: false
      t.integer :status
      t.text :header
      t.text :mapping, null: false
      t.belongs_to :user

      t.timestamps
    end
  end
end
