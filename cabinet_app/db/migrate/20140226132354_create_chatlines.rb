class CreateChatlines < ActiveRecord::Migration
  def change
    create_table :chatlines do |t|
      t.string :email
      t.text :message
      t.references :user

      t.timestamps
    end
    add_index :chatlines, :user_id
  end
end
