class StartController < ApplicationController

    def index

       # if user_signed_in?
       #  redirect_to   organizations_path 
        
          if user_signed_in?
              
              if current_user.admin?
                 redirect_to   organizations_path
               else   
                   redirect_to assign_user_path
               end    
          else
            redirect_to new_user_session_path
          end

         # if current_user.admin?
         #       redirect_to   organizations_path
         #  end

         
    end

    def setAdmin
      @user=User.all
      #debugger

    end


    def some
      @user = User.find(params[:user_id])
       if  @user.admin==true
          @user.admin=false
          @user.save
          redirect_to setAdmin_path
        else
          @user.admin=true
          @user.save
          redirect_to setAdmin_path
        end

    end

    def nouser
      
        @organization = Organization.find(params[:organization_id])

    end

    

end
