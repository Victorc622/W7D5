class CreateSubs < ActiveRecord::Migration[7.1]
  def change
    create_table :subs do |t|
      t.string :title, null: false
      t.text :description
      t.references :moderator, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
