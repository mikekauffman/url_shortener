require 'sinatra/base'

class App < Sinatra::Application

  STORED_URLS = Array.new

  get '/' do
    erb :index
  end

  post '/urls' do
    new_url = Hash.new
    new_url[:id] = STORED_URLS.length + 1
    new_url[:entered_url] = params[:url_entry]
    STORED_URLS << new_url
    redirect ('/urls')
  end

  get '/urls' do
    urlid = STORED_URLS.length - 1
    erb :results, locals: {urls: STORED_URLS, url_id: urlid }
  end
end