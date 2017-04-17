class Award < ApplicationRecord
  belongs_to :year
  belongs_to :book

  validates :award_type, presence: true

end
