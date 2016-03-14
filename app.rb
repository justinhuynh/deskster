require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/reloader'
require 'pry'

configure do
  set :views, 'app/views'
  set :environment, :development
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
  erb :'items/index'
end

post '/items' do
  item = Item.new(params[:item])
  item.save
  redirect '/'
end

get '/items/:id' do
  @item = Item.find(params[:id])
  @reviews = @item.reviews
  erb :'items/show'
end

post '/items/:id/reviews' do
  item = Item.find(params[:id])
  review = Review.new(params[:review])
  review.item_id = params[:id].to_i
  review.save
  redirect "/items/#{item.id}"
end
