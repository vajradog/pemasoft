class AddMoreInfoToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :phone_number, :string, limit: 50
  	add_column :users, :address, :string
  	add_column :users, :city, :string
  	add_column :users, :state, :string
  	add_column :users, :zip_code, :string
  end
end
