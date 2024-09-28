class AddForeignKeyToDoctors < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :doctors, :specifications
  end
end
