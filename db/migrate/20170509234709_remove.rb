class Remove < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :oauth_token_secret
  end
end
