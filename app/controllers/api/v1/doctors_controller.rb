class Api::V1::DoctorsController < ApplicationController
  def index
    doctors= Doctor.all
    render json: doctors
  end

  def show
    doctor = Doctor.find(params[:id])
    render json: doctor
  end

  def create
    doctors = Doctor.new(doctor_params)
    if doctor.save
      render json: doctor, status: :created
    else
      render json: doctor.errors, status: :unprocessable_entity
    end
  end

    private

    def doctor_params
      params.require(:doctor).permit(:name, :specification_id)
    end
  
end