class Book < ApplicationRecord

  AWARDS = {"Nebula" => "Nebula", "Hugo" => "Hugo", "Nebula & Hugo" => "Nebula & Hugo"}
  belongs_to :author
  belongs_to :year

  validates :title, presence: true
  validates :author_id, presence: true
  validates :publisher, presence: true
  validates :description, presence: true
  validates :year_id, presence: true

  def self.to_csv
    attributes = %w(title cover publisher description author_id year_id award)
    CSV.generate( headers: true ) do |csv|
      csv << attributes

      all.each do |book|
        csv << book.attributes.values_at(*attributes)
      end
    end
  end

  def self.search(search)
    where("title ILIKE ? OR publisher ILIKE ? OR description ILIKE ? OR award ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
  end

end
