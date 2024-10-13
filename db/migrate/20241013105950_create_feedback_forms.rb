class CreateFeedbackForms < ActiveRecord::Migration[7.1]
  def change
    create_table :feedback_forms do |t|
      t.string :feedback
      t.string :name
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
