class ContactMailer < ActionMailer::BASE

    default to: 'teepan.nanthakumar@gmail.com'

    def contact_email(name, email, body)
       
       @name = name
       @email = email
       @body = body
       
       mail(from: email, subject: 'Contact Form MEssage')
    end
end