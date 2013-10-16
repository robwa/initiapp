class CreateInitiatives < ActiveRecord::Migration
  def change
    create_table :initiatives do |t|
      t.string :name
      t.string :slug
    end
    add_index :initiatives, :slug, unique: true
  end
end
