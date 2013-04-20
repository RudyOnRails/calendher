class PagesController < ApplicationController

	def home
		render :layout => "landing"
	end

end