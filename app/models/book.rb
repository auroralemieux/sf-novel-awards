class Book < ApplicationRecord
  belongs_to :author
  belongs_to :year
  has_one :nebula
  has_one :hugo
end
