class CreateResources < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :username, :null => false, index: { unique: true, name: 'unique_username' }
      t.string :email, :null => false, index: { unique: true, name: 'unique_email' }
      t.string :password_digest, :null => false
      t.index ["username"], name: "unique_username", unique: true
      t.index ["email"], name: "unique_email", unique: true

      t.timestamps
    end
  end
end
