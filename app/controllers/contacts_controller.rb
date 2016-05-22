class ContactsController < ApplicationController

    def new
        @contact = Contact.new
    end
    
    def create
        @contact = Contact.new(contact_params)
        
        if @contact.save
            
            #This is part of the hash syntax, when ever you submit a form we
            #send query string paramaters as part of th URL.
            #THIS IS HOW YOU ACCESS QUERY STRING PARAMTERS, because [:conact] is 
            # the key to the paramters, and then inside there we use the key [:name]
            # to access the name. the "params" in red tells ruby you are trying
            # to refernce the query string paramters
            name = params[:contact][:name]
            email = params[:contact][:email]
            body = params[:contact][:comments]
            
            
            # This is how you call the mailer
            ContactMailer.contact_email(name,email,body).deliver
            
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
