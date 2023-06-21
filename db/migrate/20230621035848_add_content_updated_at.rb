class AddContentUpdatedAt < ActiveRecord::Migration[7.0]
  def change
    add_column :todos, :content_updated_at, :datetime
  end
end
