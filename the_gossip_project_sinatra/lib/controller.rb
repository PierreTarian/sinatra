require 'gossip'


class ApplicationController < Sinatra::Base

  get '/' do
      erb :index, locals: {gossips: Gossip.all}
  end

  

  post '/gossips/new/' do
    Gossip.new(params["gossip_author"],params["gossip_content"]).save
    redirect '/'
  end

  get '/gossips/new' do
    erb :new_gossip
  end

  get '/gossips/:id' do
    @id = params["id"].to_i
    @gossip = Gossip.find(@id)
    erb :show
  end

  get '/gossips/:id/edit' do
    erb :edit
  end

  post '/gossips/:id/edit' do
    puts ""
    @id = params[:id].to_i
    puts params['gossip_content']
    Gossip.update(@id, params["gossip_content"])
    puts "update des données du formulaire mise à jour du CSV"
    redirect '/'
  end
  
end