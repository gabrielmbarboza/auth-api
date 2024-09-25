class CreateResources < ActiveRecord::Migration[7.2]
  def change
    create_table :resources do |t|
      t.string :User
      t.string :username
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
