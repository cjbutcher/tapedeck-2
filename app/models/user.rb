class User < ApplicationRecord

  has_many :collections
  has_many :albums, through: :collections

  devise :database_authenticatable, :omniauthable, omniauth_providers: [:facebook, :twitter]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email.present? ? auth.info.email : "user-#{auth.uid}@tapedeck.io"
      user.password = Devise.friendly_token[0,20]
      user.username = auth.info.name
    end
  end

  def can_edit_collection?(collection)
    collection.user == self
  end
end
