class Author < ApplicationRecord
  has_many :books
  has_many :hugos
  has_many :nebulas
end
