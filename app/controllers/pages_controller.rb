class PagesController < ApplicationController

    def home
        @basic_plan = Plan.find(1) #THis referes to our plans table and brings out the item with id 1
        @pro_plan = Plan.find(3)
    end
    
    def about
    end
    
end

