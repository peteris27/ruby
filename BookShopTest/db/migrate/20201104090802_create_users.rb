class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.string :username
      t.string :email
      t.string :password_digest
      #t.string :re_password
    end
  end
end
