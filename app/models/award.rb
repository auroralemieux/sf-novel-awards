class Award < ApplicationRecord
  belongs_to :year
  belongs_to :book

  default_scope { joins(:year).order('year ASC') }

  scope :award_book, -> { joins("left join awards on book_id = books.id").order("books.title") }

  validates :award_type, presence: true
  AWARDS = {"Nebula" => "Nebula", "Hugo" => "Hugo", "Aurora" => "Aurora"}

  def self.to_csv
    attributes = %w(award_type year_id book_id)
    CSV.generate( headers: true ) do |csv|
      csv << attributes

      all.each do |award|
        csv << award.attributes.values_at(*attributes)
      end
    end
  end


end
