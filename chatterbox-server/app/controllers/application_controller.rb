class ApplicationController < Sinatra::Base

  set :default_content_type, 'application/json'

  get '/messages' do
    messages = Message.all.order(created_at: :asc)
    messages.to_json
  end
  delete '/messages/:id' do
    message = Message.find(params[:id])
    message.destroy
    message.to_json
  end
  patch '/messages/:id' do
    review = Message.find(params[:id])
    review.update(
      body: params[:body],
    )
    review.to_json
  end  

  post '/messages' do
    review = Message.create(
        body: params[:body],
      username: params[:username],
    )
    review.to_json
  end
end
