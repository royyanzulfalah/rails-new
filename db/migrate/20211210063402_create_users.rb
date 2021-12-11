class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :email
      t.string :password_digest
      t.string :phone
      t.date :birthdate
      t.string :gender
      t.string :ktpid
      t.string :profile_picture
      t.string :address
     
      
      t.timestamps
    end
  end
end
