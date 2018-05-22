class ChangeAuthKeyToBeStringInUsers < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :auth_key, :string
  end
end
