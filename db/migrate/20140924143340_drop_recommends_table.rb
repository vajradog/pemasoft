class DropRecommendsTable < ActiveRecord::Migration
  def change
  	drop_table :recommends
  end
end
