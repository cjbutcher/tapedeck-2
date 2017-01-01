class Collection < ApplicationRecord
  belongs_to :user
  has_many :albums

  after_initialize do
    self.title ||= 'My New Tapedeck'
  end

  validates :title, presence: true

end