class AddNavToPages < ActiveRecord::Migration
  def change
  	add_column :pages, :nav, :string
  end
end
