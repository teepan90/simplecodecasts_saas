class Users::RegistrationsController < Devis::RegistrationsController

    def create
        
        super do |resource|
            if params[:plan]
                resource.plan_id = paramsp[:plan] #User.first.plan_id = 1 or 3
                if resource.plan_id == 2
                    resource.save_with_payment
                else
                    resource.save_with_paymentend
                end
            end
    
        end
    end
    
end
