class FiguresController < ApplicationController
  # add controller methods

  # index
  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  # new
  get '/figures/new' do
    @landmarks = Landmark.all 
    @titles = Title.all
    erb :'/figures/new'
  end

  # create
  post '/figures' do
    @figure = Figure.create(params[:figure])

    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end

    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end


    redirect to "/figures/#{@figure.id}"
  end

  #show
  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  #edit 
  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @landmarks = Landmark.all
    @titles = Title.all

    erb :'/figures/edit'
  end

  #update
  patch '/figures/:id' do

    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])

    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end

    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    redirect to "/figures/#{@figure.id}"
  end

  #destroy
  delete '/figures/:id' do
    redirect to #
  end
end
