class CreateSavedItems < ActiveRecord::Migration[6.1]
  def change
    create_table :saved_items do |t|
      t.references :item, polymorphic: true, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :saved_items, [:item_type, :item_id, :user_id]
  end
end
