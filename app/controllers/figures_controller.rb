class FiguresController < ApplicationController


   get '/figures' do
     #binding.pry
     erb :'/figures/index'
   end

   get '/figures/new' do
     erb :'/figures/new'
   end

   get '/figures/:id' do
     #binding.pry
     puts params
     @figure = Figure.find_by_id(params[:id])
      erb :'figures/show'
   end

   get '/figures/:id/edit' do
     #binding.pry
     @figure = Figure.find_by_id(params[:id])
     erb :'figures/edit'
   end

   post '/figures' do
     @figure=Figure.create(params["figure"])

     if !params["landmark"]["name"].empty?
       @figure.landmarks << Landmark.create(params[:landmark])
     end

     if !params["title"]["name"].empty?
      @figure.titles << Title.create(params[:title])
    end

    @figure.save
     redirect to "/figures/#{@figure.id}"
   end

   post '/figures/:id' do
     @figure = Figure.find(params[:id])
     @figure.update(params[:figure])

     if !params[:landmark][:name].empty?
       @figure.landmarks << Landmark.create(params[:landmark])
     end

     if !params[:title][:name].empty?
       @figure.titles << Title.create(params[:title])
     end

     @figure.save
     redirect to "/figures/#{@figure.id}"
   end

end
