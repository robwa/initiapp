class CreateTexts < ActiveRecord::Migration
  def change
    create_table :texts do |t|
      t.references :initiative
      t.references :author

      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
