class User < ApplicationRecord

  has_many :collections

  devise :database_authenticatable,
         :validatable, :omniauthable, omniauth_providers: [:facebook]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.username = auth.info.name
    end
  end

  def can_edit_collection?(collection)
    collection.user == self
  end
end
