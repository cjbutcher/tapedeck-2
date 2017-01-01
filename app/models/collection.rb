class Collection < ApplicationRecord
  belongs_to :user
  has_many :albums

  after_initialize do
    self.title ||= 'New Collection'
  end
end