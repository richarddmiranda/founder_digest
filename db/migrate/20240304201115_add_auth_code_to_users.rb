class AddAuthCodeToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :auth_code, :string
  end
end
