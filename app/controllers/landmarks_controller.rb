class LandmarksController < ApplicationController

    get '/' do
      redirect '/landmarks'
    end

    get '/landmarks' do
      @landmarks = Landmark.all
      @figures = Figure.all
      erb :'landmarks/index'
    end

     get '/landmarks/new' do
       erb :'/landmarks/new'
     end

     get '/landmarks/:id' do
       #binding.pry
       puts params
       @landmark = Landmark.find_by_id(params[:id])
        erb :'landmarks/show'
     end

     get '/landmarks/:id/edit' do
       #binding.pry
       @landmark = Landmark.find_by_id(params[:id])
       erb :'landmarks/edit'
     end

     post '/landmarks' do
       @landmark=Landmark.create(params["landmark"])

       if !params["figure"]["name"].empty?
         @landmark.figures << Figure.create(params[:figure])
       end


      @landmark.save
       redirect to "/landmarks/#{@landmark.id}"
     end

     post '/landmarks/:id' do
       @landmark = Landmark.find(params[:id])
       @landmark.update(params[:landmark])

       if !params[:figure][:name].empty?
         @landmark.figures << Figure.create(params[:figure])
       end

       @landmark.save
       redirect to "/landmarks/#{@landmark.id}"
     end


end
