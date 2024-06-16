class CreateViews < ActiveRecord::Migration[6.1]
  def change
    create_table :views do |t|
      t.references :viewable, polymorphic: true, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
