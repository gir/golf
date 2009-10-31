class CreateChallenges < ActiveRecord::Migration
  def self.up
    create_table :challenges do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :challenges
  end
end
