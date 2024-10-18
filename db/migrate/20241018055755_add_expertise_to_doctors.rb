class AddExpertiseToDoctors < ActiveRecord::Migration[7.1]
  def change
    add_column :doctors, :Expertise, :string
  end
end
