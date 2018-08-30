class Contact < ApplicationRecord
  belongs_to :group

  def gravatar
    size = "?s=200"
    default = "?d=robohash"
    hash = Digest::MD5.hexdigest(email.downcase)
    "https://www.gravatar.com/avatar/#{hash}#{size}#{default}"
  end
end
