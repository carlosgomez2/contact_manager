class Contact < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  belongs_to :group

  validates :name, :email, :group_id, presence: true
  validates :name, length: { minimum: 2 }

  def gravatar
    size = "?s=200"
    default = "?d=robohash"
    hash = Digest::MD5.hexdigest(email.downcase)
    "https://www.gravatar.com/avatar/#{hash}#{size}#{default}"
  end
end
