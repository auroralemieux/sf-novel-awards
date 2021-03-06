class Book < ApplicationRecord

  # AWARDS = {"Nebula" => "Nebula", "Hugo" => "Hugo", "Nebula & Hugo" => "Nebula & Hugo"}
  has_and_belongs_to_many :authors
  has_many :awards
  # belongs_to :year

  validates :title, presence: true
  # validates :author_id, presence: true
  validates :publisher, presence: true
  validates :description, presence: true
  # validates :year_id, presence: true

  def self.to_csv
    attributes = %w(title cover publisher description author_ids)
    CSV.generate( headers: true ) do |csv|
      csv << attributes

      all.each do |book|
        csv << book.attributes.values_at(*attributes)
      end
    end
  end

  def self.search_description(search)
    where("description ILIKE ?", "%#{search}%")
  end

  def self.main_search(search)
    where("title ILIKE ?", "%#{search}%")
  end


  def prev
    Book.unscoped.where('title < ?', title).order('title ASC').last
  end

  def next
    Book.unscoped.where('title > ?', title).order('title ASC').first
  end


end
