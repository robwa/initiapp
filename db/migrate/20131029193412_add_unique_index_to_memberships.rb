class AddUniqueIndexToMemberships < ActiveRecord::Migration
  def change
    add_index :memberships, [:user_id, :initiative_id], unique: true
  end
end
