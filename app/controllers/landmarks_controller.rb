class LandmarksController < ApplicationController
  # add controller methods
    # index
    get '/landmarks' do
      @landmarks = Landmark.all
      erb :'/landmarks/index'
    end
  
    # new
    get '/landmarks/new' do
      erb :'/landmarks/new'
    end
  
    # create
    post '/landmarks' do
      @landmark = Landmark.create(params[:landmark])
      
      redirect to "/landmarks/#{@landmark.id}"
    end
  
    #show
    get '/landmarks/:id' do
      @landmark = Landmark.find(params[:id])
      erb :'/landmarks/show'
    end
  
    #edit 
    get '/landmarks/:id/edit' do
      @landmark = Landmark.find(params[:id])
      erb :'/landmarks/edit'
    end
  
    #update
    patch '/landmarks/:id' do
      @landmark = Landmark.find(params[:id])
      @landmark.update(params[:landmark])
      redirect to "/landmarks/#{@landmark.id}"
    end
  
    #destroy
    delete '/landmarks/:id' do
      redirect to #
    end
end
