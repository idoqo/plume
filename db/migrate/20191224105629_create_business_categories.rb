class CreateBusinessCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.text :description, default: ""
      t.timestamps null: false
    end

    add_index :categories, :name
  end
end
