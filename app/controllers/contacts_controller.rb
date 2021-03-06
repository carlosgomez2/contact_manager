class ContactsController < ApplicationController
  before_action :find_contact, only: [:edit, :update, :destroy]

  def index
    session[:selected_group_id] = params[:group_id]
    @contacts = current_user.contacts.by_group(params[:group_id]).search(params[:term]).order(created_at: :desc).page(params[:page]).per(5)
  end

  def autocomplete
    @contacts = current_user.contacts.search(params[:term]).order(created_at: :desc).page(params[:page])
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = current_user.contacts.build(contact_params)
    respond_to do |format|
      if @contact.save
        format.html do
          flash[:success] = 'Contact was successfully created.'
          redirect_to contacts_path(previous_query_string)
        end
      else
        format.html do
          flash[:error] = 'Contact failed to be created.'
          render 'new'
        end
      end
    end
  end

  def edit
    authorize @contact
  end

  def update
    authorize @contact
    respond_to do |format|
      if @contact.update(contact_params)
        format.html do
          flash[:success] = 'Contact has been updated successfully.'
          redirect_to contacts_path(previous_query_string)
        end
      else
        format.html do
          flash[:error] = 'Contact failed to be updated.'
          render 'edit'
        end
      end
    end
  end

  def destroy
    @contact.destroy
    respond_to do |format|
      format.html do
        flash[:success] = 'Contact has been deleted.'
        redirect_to contacts_path(previous_query_string)
      end
    end
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
