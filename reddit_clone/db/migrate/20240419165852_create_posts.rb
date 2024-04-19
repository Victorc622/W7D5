class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :url
      t.text :content
      t.references :author, foreign_key: { to_table: :users}
      t.references :sub, null: false, foreign_key: true 
    
      t.timestamps
    end
  end
end
