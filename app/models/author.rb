class Author < ApplicationRecord
  has_many :books

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birth_year, presence: true, numericality: true
  validates :birth_place, presence: true

  def self.to_csv
    attributes = %w(first_name last_name birth_year death_year birth_place full_name )
    CSV.generate( headers: true ) do |csv|
      csv << attributes

      all.each do |author|
        csv << author.attributes.values_at(*attributes)
      end
    end
  end

end
