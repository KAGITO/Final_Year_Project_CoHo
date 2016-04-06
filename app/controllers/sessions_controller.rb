class SessionsController < ApplicationController
	def new
	end

    def create
        user = User.find_by_email(params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
          remember user
          redirect_to user
     #  NEW LINE
        else 
          flash.now[:error] = 'Invalid email/password combination'
          render 'new'
        end
      end

      def destroy
        log_out if logged_in?
        redirect_to root_url
          session[:thirduser_id]  = nil
        session[:omniauth] = nil
      end 

      def createthird
    auth = request.env["omniauth.auth"]
    session[:omniauth] = auth.except('extra')
    thirduser = Thirduser.sign_in_from_omniauth(auth)
    session[:thirduser_id] = thirduser.id

    redirect_to root_url, notice: "Signed In Successfully!"
   end 
end
