class FiguresController < ApplicationController
   get '/figures/new' do
     erb :'/figures/new'
   end

   get '/figures' do
     erb :index
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
    redirect to '/figures'
   end

end
