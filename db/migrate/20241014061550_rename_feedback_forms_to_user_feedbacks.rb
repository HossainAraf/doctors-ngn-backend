class RenameFeedbackFormsToUserFeedbacks < ActiveRecord::Migration[7.1]
  def change
    rename_table :feedback_forms, :user_feedbacks
  end
end
