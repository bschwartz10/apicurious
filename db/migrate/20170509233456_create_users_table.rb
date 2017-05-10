class CreateUsersTable < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :uid
      t.string :name
      t.string :oauth_token
      t.string :oauth_token_secret
    end
  end
end
