class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.belongs_to :author
      t.belongs_to :category
      t.timestamps
    end
  end
end
