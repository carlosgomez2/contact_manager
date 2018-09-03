class ContactsController < ApplicationController
  before_action :find_contact, only: [:edit, :update, :destroy]

  def index
    session[:selected_group_id] = params[:group_id]
    @contacts = Contact.by_group(params[:group_id]).search(params[:term]).order(created_at: :desc).page(params[:page]).per(5)
  end

  def autocomplete
    @contacts = Contact.search(params[:term]).order(created_at: :desc).page(params[:page])
    # render json: @contacts.map { |contact| { id: contact.id, value: contact.name } }
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:success] = 'Contact was successfully created!'
      redirect_to contacts_path(previous_query_string)
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @contact.update(contact_params)
      flash[:success] = 'Contact has been updated successfully!'
      redirect_to contacts_path(previous_query_string)
    else
      render 'edit'
    end
  end

  def destroy
    @contact.destroy
    flash[:success] = 'Contact has been deleted.'
    redirect_to contacts_path
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :company, :address, :phone, :group_id, :avatar)
  end

  def find_contact
    @contact = Contact.find(params[:id])
  end

  def previous_query_string
    session[:selected_group_id] ? { group_id: session[:selected_group_id] } : {}
  end
end
