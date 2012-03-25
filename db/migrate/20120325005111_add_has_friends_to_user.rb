class AddHasFriendsToUser < ActiveRecord::Migration
  def change
    add_column :users, :has_friends, :boolean, :default => false
  end
end
