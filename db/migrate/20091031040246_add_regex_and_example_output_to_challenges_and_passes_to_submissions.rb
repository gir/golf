class AddRegexAndExampleOutputToChallengesAndPassesToSubmissions < ActiveRecord::Migration
  def self.up
    add_column :challenges, :regex, :string
    add_column :challenges, :example_output, :string
    add_column :submissions, :passes, :boolean, :default => false
  end

  def self.down
    remove_column :challenges, :regex
    remove_column :challenges, :example_output
    remove_column :submissions, :passes
  end
end
