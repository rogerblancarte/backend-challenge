class CreateHeadings < ActiveRecord::Migration[5.2]
  def change
    create_table :headings do |t|
      t.text :content
      t.references :website, foreign_key: true

      t.timestamps
    end
  end
end
