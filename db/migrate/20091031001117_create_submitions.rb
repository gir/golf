class CreateSubmitions < ActiveRecord::Migration
  def self.up
    create_table :submitions do |t|
      t.string :name
      t.text :code
      t.text :comment
      t.integer :score
      t.references :language
      t.references :challenge

      t.timestamps
    end
  end

  def self.down
    drop_table :submitions
  end
end
