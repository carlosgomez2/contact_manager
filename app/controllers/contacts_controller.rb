class ContactsController < ApplicationController
  def index
    if params[:group_id] && !params[:group_id].empty?
      @contacts = Contact.where(group_id: params[:group_id]).page(params[:page]).per(5)
    else
      @contacts = Contact.page(params[:page]).per(5)
    end
  end
end
