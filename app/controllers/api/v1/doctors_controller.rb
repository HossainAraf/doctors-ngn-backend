class Api::V1::DoctorsController < ApplicationController
  def index
    doctors = Doctor.all
    render json: doctors
  end

  def show
    doctor = Doctor.find(params[:id])
    render json: doctor
  end

  def create
    Doctor.new(doctor_params)
    if doctor.save
      render json: doctor, status: :created
    else
      render json: doctor.errors, status: :unprocessable_entity
    end
  end

  # METHOD TO GET DOCTORS BY SPECIFICATION ID
  def by_specification
    # Find doctors with the matching specification_id
    @doctors = Doctor.where(specification_id: params[:specification_id])

    if @doctors.any?
      render json: @doctors
    else
      render json: { error: 'No doctors found with the specified specification' }, status: :not_found
    end
  end

  private

  def doctor_params
    params.require(:doctor).permit(:name, :specification_id)
  end
end
