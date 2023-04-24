class ContactsController < ApplicationController
  def index
    @contacts = Contact.where(user: current_user)
  end
end
