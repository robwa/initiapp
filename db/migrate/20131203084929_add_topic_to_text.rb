class AddTopicToText < ActiveRecord::Migration
  def change
    add_reference :texts, :topic, index: true
    remove_reference :texts, :initiative
    remove_column :texts, :title, :string
  end
end
