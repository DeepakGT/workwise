class AddFieldsToUser < ActiveRecord::Migration[6.1]
  def change
    change_table :users do |t|
      t.string :provider
      t.string :uid
    end
  end
end
