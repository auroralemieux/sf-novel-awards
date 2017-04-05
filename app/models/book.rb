class Book < ApplicationRecord

  AWARDS = {Nebula: "Nebula", Hugo: "Hugo"}
  belongs_to :author
  belongs_to :year

  validates :title, presence: true
  validates :author_id, presence: true
  validates :publisher, presence: true
  validates :description, presence: true
  validates :year_id, presence: true



end
