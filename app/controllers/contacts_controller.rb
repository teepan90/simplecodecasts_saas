class ContactsController < ApplicationController

    def new
        @contact = Contact.new
    end
    
    def create
        @contact = Contact.new(contact_params)
        
        if @contact.save
            # A flash is part of rails to display messages, its a key value pair so basically a hash
            flash[:success] = 'Message sent'
            redirect_to new_contact_path
        else
            flash[:danger] = 'Error occured, message has not been sent'
            redirect_to new_contact_path
        end
    end
    

    private
    def contact_params
        params.require(:contact).permit(:name, :email, :comments)
    end
    
end
