class CsvFile < ApplicationRecord
  validates :path, presence: true, uniqueness: { case_sensitive: false }
  validates :mapping, presence: true
  validate :mapping, :valid_mapping

  belongs_to :user

  enum status: { on_hold: 0, processing: 1, failed: 2, finished: 3}

  def valid_mapping
    temp = JSON.parse(mapping)
    if !(temp.values.uniq.count == temp.values.count)
      errors.add(:mapping, 'There are columns repeated')
    end
  end
end
