class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
    	t.string :name 
    	t.string :date 
    	t.string :venue
    	t.decimal :price, :precision => 8, :scale => 2
    	t.text :description
    	t.integer :user_id

      t.timestamps
    end
  end
end
