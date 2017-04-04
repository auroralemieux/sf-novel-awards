class Year < ApplicationRecord
  has_many :books

  validates :year, presence: true

end
