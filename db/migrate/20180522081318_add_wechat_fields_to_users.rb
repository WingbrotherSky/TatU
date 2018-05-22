class AddWechatFieldsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :avatarUrl, :string
    add_column :users, :city, :string
    add_column :users, :country, :string
    add_column :users, :gender, :integer
    add_column :users, :language, :string
    add_column :users, :nickName, :string
    add_column :users, :province, :string
  end
end
