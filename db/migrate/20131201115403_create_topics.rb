class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.references :initiative

      t.string :name

      t.timestamps
    end
  end
end
