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

  def self.search(search)
    where("first_name ILIKE ? OR last_name ILIKE ? OR birth_year ILIKE ? OR death_year ILIKE ? OR birth_place ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
    
    joins(:books).where("title ILIKE ? OR award ILIKE ?", "%#{search}%", "%#{search}%")
  end

  def prev
    Author.unscoped.where('last_name < ?', last_name).order('last_name ASC').last

  end

  def next
    Author.unscoped.where('last_name > ?', last_name).order('last_name ASC').first
  end

  def total_awards
    total = 0
    self.books.each do |book|
      if book.award == "Hugo" || book.award == "Nebula"
        total += 1
      else
        total += 2
      end
    end
    return total
  end

end
