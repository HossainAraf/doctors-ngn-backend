class CreateDoctors < ActiveRecord::Migration[7.1]
  def change
    create_table :doctors do |t|
      t.string :name, limit: 255, null: false
      t.integer :specification_id, null: false
      t.integer :display_order, null: false
      t.string :degree, limit: 255
      t.string :designation, limit: 255
      t.string :chember, limit: 255
      t.string :time, limit: 255
      t.string :contact, limit: 255

      t.timestamps
    end
  end
end
