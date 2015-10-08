require 'sinatra/base'
require 'tilt/erb'
require 'pry'

class App < Sinatra::Base
  attr_accessor :captions

  def initialize
    super()
    self.captions = []
  end

  get '/' do
    erb :index, locals: { caption: self.captions.sample }
  end

  post '/captions' do
    self.captions.push(params[:caption])
    redirect to('/')
  end
end

App.run!

#require 'sinatra'
#require 'tilt/erb'
#require 'pry'

#captions = []

#get '/' do
#  erb :index, locals: { caption: captions.sample }
#end

#post '/captions' do
#  captions.push(params[:caption])
#  redirect to('/')
#end
