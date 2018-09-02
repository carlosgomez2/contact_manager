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

  def self.search(term)
    term = "%#{term}%"
    if term && !term.empty?
      where('name LIKE :find OR company LIKE :find OR email LIKE :find OR address LIKE :find OR phone LIKE :find', find: term)
    else
      all
    end
  end

  def self.by_group(group_id)
    if group_id && !group_id.empty?
      where(group_id: group_id)
    else
      all
    end
  end
end
