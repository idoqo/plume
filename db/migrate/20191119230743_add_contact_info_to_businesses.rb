class AddContactInfoToBusinesses < ActiveRecord::Migration[6.0]
  def change
    add_column :businesses, :phone, :string, after: :description
    add_column :businesses, :email, :string, after: :phone
    add_column :businesses, :whatsapp_phone, :string, after: :email
    add_column :businesses, :twitter, :string, after: :whatsapp_phone
    add_column :businesses, :instagram, :string, after: :twitter
  end
end
