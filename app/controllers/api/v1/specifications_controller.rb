class Api::V1::SpecificationsController < ApplicationController
  def index
    specifications = Specification.all
    render json: specifications
  end

  def show
    specification = Specification.find(params[:id])
    render json: specification
  end

  def create
    specification = Specification.new(specification_params)
    if specification.save
      render json: specification, status: :created
    else
      render json: specification.errors, status: :unprocessable_entity
    end
  end

  private

  def specification_params
    params.require(:specification).permit(:name)
  end
end
