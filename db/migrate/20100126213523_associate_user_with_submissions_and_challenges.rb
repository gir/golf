class AssociateUserWithSubmissionsAndChallenges < ActiveRecord::Migration
  def self.up
    remove_column :submissions, :name
    add_column :submissions, :user_id, :integer

    add_column :challenges, :user_id, :integer
  end

  def self.down
    remove_column :submissions, :user_id
    add_column :submissions, :name, :string

    remove_column :challenges, :user_id
  end
end
