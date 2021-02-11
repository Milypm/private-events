class RemoveTitleFromEvents < ActiveRecord::Migration[6.1]
  def change
    remove_column :events, :title, :string
  end
end
