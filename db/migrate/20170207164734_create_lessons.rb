class CreateLessons < ActiveRecord::Migration[5.0]
  def change
    create_table :lessons do |t|
      t.column :name, :string
      t.column :number, :integer
      t.column :content, :string

      t.timestamps
    end
  end
end
