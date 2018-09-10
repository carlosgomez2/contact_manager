class Contact < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  belongs_to :group
  belongs_to :user

  validates :name, :email, :group_id, presence: true
  validates :name, length: { minimum: 2 }

  def gravatar
    size = "?s=200"
    default = "?d=robohash"
    hash = Digest::MD5.hexdigest(email.downcase)
    "https://www.gravatar.com/avatar/#{hash}#{size}#{default}"
  end

  scope :search, -> (term) { where('LOWER(name) LIKE :find OR LOWER(company) LIKE :find OR LOWER(email) LIKE :find OR LOWER(address) LIKE :find OR LOWER(phone) LIKE :find', find: "%#{term.downcase}%") if term.present? }

  scope :by_group, -> (group_id) { where(group_id: group_id) if group_id.present? }

end
