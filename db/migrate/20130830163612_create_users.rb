class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :password_hashed
      t.string :email_hashed
      t.timestamps
    end
  end
end
