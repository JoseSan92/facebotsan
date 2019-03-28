class CallbackController < ApplicationController
	protect_from_forgery with: :null_session  


  def index
  	if params["hub.verify_token"] == "facebot"
  		render plain: params["hub.challenge"]
  	end
  end

  def recivied
  	therequest = request.body.read
  	data = JSON.parse(therequest)
  	enteries = data["entry"]
  	enteries.each do |entry|
  		entry["messaging"].each do |messaging|
  			sender = messaging["sender"]["id"]
  			text = messaging["message"]["text"]
  			mysjson = {
  						"recipient": {"id": "#{sender}"}, 
  						"message": {"text": "hello, world!"}}
  			puts HTTP.post(url, json: mysjson)
  		end
  	end
  	render "recivied"
  end

  def url
  	"https://graph.facebook.com/v2.6/me/messages?access_token=EAAOP56oZCGOQBABr4HIIbupXeIhxwrhZAEB7nej53jKMMF47SD3PRlZCm4bcr1DvqCTDHRZB7CXZAyzQJmBHrsrRZCuMWP9HDgKTZAJZAVxZARwQl2Xbwvl2rBJATsQk52FnfuDAeeASlDLCt8SiZBQZAM2sb1BsqCA5oIEx1ZCvv18yf7HQMeMsrZAyD"
  end
end
