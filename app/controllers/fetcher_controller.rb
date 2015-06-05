class FetcherController < ApplicationController
	def index
		client = MediawikiApi::Client.new "http://en.wikipedia.org/w/api.php"
		@images = []
		ror = client.query( :list => "allimages", :ailimit => 5, :aifrom => params[:search] ).data["allimages"]
		ror.each do |r|
			d = r["url"]
			@images.push(d)
		end
	end
end
