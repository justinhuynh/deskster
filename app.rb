require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/reloader'

configure :development, :test do
  require 'pry'
end

configure do
  set :views, 'app/views'
end

Dir[File.join(File.dirname(__FILE__), 'app', '**', '*.rb')].each do |file|
  require file
  also_reload file
end

get '/' do
  redirect '/items'
end

get '/items' do
  @items = Item.all
  erb :index
end

get '/items/:id' do
  @item = Item.find(params[:id])
  @reviews = @item.reviews
  erb :show
end

post '/items/:id/reviews' do
  id = params[:id]
  review = Review.new(params[:review])
  review.item_id = id.to_i
  review.save
  redirect "/items/#{id}"
end
