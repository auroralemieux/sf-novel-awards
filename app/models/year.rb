class Year < ApplicationRecord
  has_many :awards

  validates :year, presence: true

  def self.to_csv
    attributes = %w(year)
    CSV.generate( headers: true ) do |csv|
      csv << attributes

      all.each do |user|
        csv << user.attributes.values_at(*attributes)
      end
    end
  end

  def self.search(search)
    where("year ILIKE ?", "%#{search}%")
  end

end
