class AddStarredFollowingFollowersToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :following_url, :string
    add_column :users, :followers_url, :string
    add_column :users, :starred_url, :string
  end
end
