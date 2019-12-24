class AddCategoryIdToBusinesses < ActiveRecord::Migration[6.0]
  def change
    add_reference :businesses, :category, index: true,
                  foreign_key: true
  end
end
