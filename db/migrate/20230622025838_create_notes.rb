class CreateNotes < ActiveRecord::Migration[7.0]
  def change
    create_table :notes do |t|
      t.text :content
      t.references :todo, null: false, foreign_key: true

      t.timestamps
    end
  end
end
