require 'sinatra'
require 'faker'
require_relative 'contact'
require_relative 'rolodex'

$rolodex= Rolodex.new

get '/' do
  @crm_app_name = "JJ's CRM"
  @page_name= "Main"
  erb :index
end

get "/contacts" do
  @page_name="All Contacts"
  erb :contacts
end

get '/contacts/new' do
  @page_name= "New Contact"
  erb :new_contact
end

post '/contacts' do
  new_contact = Contact.new(params[:first_name], params[:last_name], params[:email], params[:note])
  $rolodex.add(new_contact)
  redirect to('/contacts')
end

get '/display_contact' do
  @page_name="Display Contact"
	erb :display_contact
end

post '/display_contact' do
	id=params[:id]
	erb :display_contact_id
end
	


