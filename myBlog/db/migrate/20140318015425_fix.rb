class Fix < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :entry

      t.timestamps
    end
    
    
    add_column :posts, :use, :user

  end
end
