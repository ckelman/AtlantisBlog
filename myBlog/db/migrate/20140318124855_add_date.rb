class AddDate < ActiveRecord::Migration
  def change
    add_column :posts, :dat, :date
  end
end
