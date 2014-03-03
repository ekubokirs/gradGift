class WishesController < ApplicationController

	before_action :authenticate_user!

	def index
		@wishes = Wish.sort(:created_at.desc).all
		if current_user
		 	@nav = "shared/friendNav"
		 	@user = current_user
		else
			@nav = "shared/nonFriendNav"
		end
	end

	def new
		if current_user
		 	@nav = "shared/friendNav"
		 	@user = current_user
		else
			@nav = "shared/nonFriendNav"
		end
		
		@sassy 	= SassyWish.new
		@nice 	= NiceWish.new
		@blank 	= BlankWish.new
	end

	def create
		if params[:sassy_wish]
			@wish = SassyWish.new sassy_params
		elsif params[:nice_wish]
			@wish = NiceWish.new nice_params
		elsif params[:blank_wish]
			@wish = BlankWish.new blank_params
		else
			render :new
		end

		@wish.save!
		if @wish.errors.any?
			render :new
		else
			redirect_to wishes_url
		end
	end

	private
		def sassy_params
			params.require(:sassy_wish).permit(
				:nickname,
  			:time,
				:relationship,
  			:embarrassing,
  			:good_advice,
  			:bad_things,
  			:luck,
  			:closing,
  			:friend,
  			:ps,
				)
		end

		def nice_params
			params.require(:nice_wish).permit(
				:nickname,
				:time,
				:nice_one,
				:advice,
				:thought,
				:hope,
				:closing,
				:friend,
				:ps)
		end

		def blank_params
			params.require(:blank_wish).permit(
				:blank_wish)
		end
		
end
