class CreateErrorLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :error_logs do |t|
      t.text :message
      t.text :row
      t.belongs_to :csv_file
      t.timestamps
    end
  end
end
