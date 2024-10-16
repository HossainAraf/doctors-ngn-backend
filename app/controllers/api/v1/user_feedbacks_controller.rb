class Api::V1::UserFeedbacksController < ApplicationController
  def index
    user_feedbacks= UserFeedback.all
    render json: user_feedbacks
  end

  def create
    user_feedback = UserFeedback.new(user_feedback_params)
    if user_feedback.save
      render json: user_feedback, status: :created
    else
      render json: user_feedback.errors, status: :unprocessable_entity
    end
  end

  def update
  end

  def destroy
    user_feedback = UserFeedback.find_by(id: params[:id])
    if user_feedback
      user_feedback.destroy
      head :no_content  # This responds with 204 
    else
      render json: { error: 'User feedback not found' }, status: :not_found
    end
  end
  

end

private
def user_feedback_params
  params.require(:user_feedback).permit(:name, :email, :feedback, :phone)
end