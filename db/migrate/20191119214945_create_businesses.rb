class CreateBusinesses < ActiveRecord::Migration[6.0]
  def change
    create_table :businesses do |t|
      t.string :name, null: false, default: ""
      t.string :logo
      t.belongs_to :user
      t.text :description, default: ""
      t.text :main_address, default: ""
      t.timestamps null: false
    end

    add_index :businesses, :name
  end
end
