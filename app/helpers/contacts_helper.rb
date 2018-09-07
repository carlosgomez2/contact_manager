module ContactsHelper

  def contact_image(contact)
    @contact = contact
    if @contact.avatar.present?
      @contact.avatar.url(:avatar)
    elsif @contact.email.present? 
      @contact.gravatar
    else
      "https://imgplaceholder.com/200x200?text=No+Image&font-family=OpenSans_Bold_Italic"
    end
  end

end
