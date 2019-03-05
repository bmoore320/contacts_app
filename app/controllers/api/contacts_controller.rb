class Api::ContactsController < ApplicationController
  def index
    # get a contact from the db
    @contacts = Contact.all
    render 'index.json.jbuilder'
  end
 
   def show
    the_id = params[:id]
    @contact = Contact.find_by(id: the_id)
    render 'show.json.jbuilder'
  end   

  def create
    @contact = Contact.new(
      name: params[:name],
      phone_number: params[:phone_number],
      address: params[:address]       
      )
    @contact.save
    render 'show.json.jbuilder'
  end   

  def update
    the_id = params[:id]
    @contact = Contact.find_by(id: the_id)
    @contact.name = params[:name]
    @contact.phone_number = params[:phone_number]
    @contact.address = params[:address]
    @contact.save   
    render 'show.json.jbuilder'
  end

  def destroy
    the_id = params[:id]
    @contact = Contact.find_by(id: the_id)
    @contact.destroy
    render 'destroy.json.jbuilder'
  end
end
    