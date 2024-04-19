class ChangeUsers < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :sesstion_token, :session_token
  end
end
