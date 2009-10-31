class CreateDefaultLanguages < ActiveRecord::Migration
  def self.up
    ['Lua', 'Perl', 'Python', 'Ruby'].each do |language|
      Language.create(:name => language)
    end
  end

  def self.down
  end
end
