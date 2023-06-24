class UpdateForeignKeyForNotes < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :notes, :todos
    add_foreign_key :notes, :todos, on_delete: :cascade
  end
end
