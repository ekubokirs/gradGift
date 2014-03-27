class SessionsController < ApplicationController
	before_action :authenticate_user!, only: [:egg]
	before_action	:navigation_type, only: [:index, :thanks, :egg]

	def index
	
	end

	def new
	  redirect_to '/auth/facebook'
	end
	# def create
 #    user = User.from_omniauth(env["omniauth.auth"])
 #    session[:user_id] = user.id
 #    redirect_to root_url
 #  end

	def create
	  auth = request.env["omniauth.auth"]
	  user = User.where(:provider => auth['provider'],
	                    :uid => auth['uid']).first || User.create_with_omniauth(auth)
	  session[:user_id] = user.id
	  redirect_to root_url, :notice => "Signed in!"
	end

  # def destroy
  #   session[:user_id] = nil
  #   redirect_to root_url
  # end
  
	def destroy
	  reset_session
	  redirect_to root_url, :notice => 'Signed out!'
	end

	def failure
	  redirect_to root_url, :alert => "Authentication error: #{params[:message].humanize}"
	end

	def stats

		@b = BlankWish.all.count
		@s = SassyWish.all.count
		@n = NiceWish.all.count

		respond_to do |format|
 		  format.json { render json: @b }
 		end 
	end

	def thanks
	
	end

	def egg
		@b = BlankWish.all.count
		@s = SassyWish.all.count
		@n = NiceWish.all.count

		@types 	= Array.new
		@wishes = Wish.all

		@blank = BlankWish.all
		@blank.each do |wish|
			@types.push(wish._type)
		end

		@sassy = SassyWish.all
		@sassy.each do |wish|
			@types.push(wish._type)
		end

		@nice = NiceWish.all
		@nice.each do |wish|
			@types.push(wish._type)
		end
	end

end
