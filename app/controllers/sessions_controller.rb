class SessionsController < ApplicationController

	def index
		if current_user
		 	@nav = "shared/friendNav"
		 	@user = current_user
		else
			@nav = "shared/nonFriendNav"
		end
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
		@bWish = BlankWish.all.count
		@sWish = SassyWish.all.count
		@nWish = NiceWish.all.count
		@types = Array.new

		@types << {name: "Blank Wish", count: @bWish}
		@types <<	{name: "Sassy Wish", count: @sWish}
		@types << {name: "Nice Wish",  count: @nWish}

		respond_to do |format|
		  format.json { render json: @types }
		end
	end

	def egg
		@wishes = Wish.all

		@bWish = BlankWish.all.count
		@sWish = SassyWish.all.count
		@nWish = NiceWish.all.count
		
		@types = Array.new

		@types << {name: "Blank Wish", count: @bWish}
		@types <<	{name: "Sassy Wish", count: @sWish}
		@types << {name: "Nice Wish",  count: @nWish}
	end

end
