class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :url
      t.boolean :read, null: false, default: false
      t.references :user, index: true

      t.timestamps null: false
    end
  end
end
