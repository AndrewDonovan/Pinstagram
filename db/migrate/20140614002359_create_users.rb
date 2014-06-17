class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

      t.timestamps
      t.string :uid
      t.string :provider
      t.string :name
      t.string :nickname
      t.string :access_token
    end
  end
end
