class SpicesController < ApplicationController

    def index
        spices = Spice.all
        render json: spices
    end

    def create
        spices = Spice.create(spices_params)
        render json:spices, status: :created
    end 

    def destroy
        spice = Spice.find_by(id: params[:id])
        if spice
          spice.destroy
          head :no_content
        else
          render json: { error: 'Spice not found' }, status: :not_found
        end
      end
      

    def update
        spices = Spice.find_by(id: params[:id])
      if spices
        spices.update(spices_params)
        render json:spices, status: :ok
      else
        render json:{error: "spice not found"}, status: :not_found
      end
    end

    

    def spices_params
        params.permit(:title, :image, :description, :notes, :rating)
    
    end
end
