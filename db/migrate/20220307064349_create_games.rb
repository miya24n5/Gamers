class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|

      t.string :title
      t.text :body
      t.integer :user_id
      t.float :star

      t.timestamps
    end
  end
end
