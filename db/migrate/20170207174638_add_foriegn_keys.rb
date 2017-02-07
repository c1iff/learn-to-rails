class AddForiegnKeys < ActiveRecord::Migration[5.0]
  def change
    add_column :sections, :chapter_id, :integer
    add_column :lessons, :section_id, :integer
  end
end
