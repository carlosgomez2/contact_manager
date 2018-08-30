class ContactsController < ApplicationController
  def index
    @contacts = Contact.page(params[:page]).per(5)
  end
end
