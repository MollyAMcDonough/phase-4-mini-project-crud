class SpicesController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

#GET /spices
def index
    render json: Spice.all
end
#POST /spices
def create
    spice = Spice.create(approved_params)
    render json: spice, status: :created
end
    
#PATCH /spices/:id
def update
    spice = Spice.find(params[:id])
    spice.update(approved_params)
    render json: spice
end
#DELETE /spices/:id
def destroy
    spice = Spice.find(params[:id])
    spice.destroy
    head :not_found
end

private
def approved_params
    params.permit(:title, :image, :description, :notes, :rating)
end

def render_not_found_response
    render json: {error: "Spice not found"}, status: :not_found
end
end
