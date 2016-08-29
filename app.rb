require 'sinatra'

get '/' do
  erb :index
end

get '/items/new' do
  erb :new
end

post '/items/new' do
  @title = params['title']
  @url = params['url']
  @description = params['description']
  CSV.open('foods.csv', 'a') do |csv|
    csv << [@title, @url, @description]
  end
  redirect '/articles'
end
