class AddColToUsers < ActiveRecord::Migration
  def change
    add_column :users, :profile_pic, :string
    add_column :users, :token, :string
  end
end
