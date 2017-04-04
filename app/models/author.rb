class Author < ApplicationRecord
  has_many :books

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birth_year, presence: true, numericality: true
  validates :birth_place, presence: true

end
