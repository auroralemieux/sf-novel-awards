class Nebula < ApplicationRecord
  belongs_to :book
  belongs_to :year
  belongs_to :author
end
