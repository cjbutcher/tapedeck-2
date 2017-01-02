class Album < ApplicationRecord
  belongs_to :collection

  validates :name, :artist, :year, presence: true
end