class WishesController < ApplicationController
	before_action :authenticate_user!
	before_action	:navigation_type

	def index
		@wishes = Wish.sort(:created_at.desc).all
	end

	def new
		@sassyErrors	= "noError"
		@niceErrors		= "noError"
		@blankErrors	= "noError"
		@sassy 	= SassyWish.new
		@nice 	= NiceWish.new
		@blank 	= BlankWish.new
	end

	def create

		@errors 	= "errors"
		@noError 	= "noError"

		@sassy 	= SassyWish.new
		@nice 	= NiceWish.new
		@blank 	= BlankWish.new
		
		if params[:sassy_wish]
			@wish = SassyWish.new sassy_params
		elsif params[:nice_wish]
			@wish = NiceWish.new nice_params
		elsif params[:blank_wish]
			@wish = BlankWish.new blank_params
		else
			render :new
		end

		if @wish._type == "SassyWish"
			@wishClass		= "gw_active"
			@sassyErrors 	= @errors
			@niceErrors 	= @noError
			@blankErrors 	= @noError
		elsif @wish._type == "NiceWish"
			@wishClass		= "gw_active"
			@niceErrors 	= @errors
			@sassyErrors 	= @noError
			@blankErrors 	= @noError
		elsif @wish._type == "BlankWish"
			@wishClass		= "gw_active"
			@blankErrors 	= @errors
			@sassyErrors 	= @noError
			@niceErrors 	= @noError
		else
			@errors
		end

		@wish.save
		if @wish.errors.any?
			render :new
			@user = current_user
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
