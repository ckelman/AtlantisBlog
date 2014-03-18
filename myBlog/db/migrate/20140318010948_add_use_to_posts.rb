class AddUseToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :use, :user
  end
end
