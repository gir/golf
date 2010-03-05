class AddNameToAdmin < ActiveRecord::Migration
  def self.up
    user = User.find_by_login("admin")
    user.name = APP_CONFIG['settings']['admin_name']
    user.save(false)
  end

  def self.down
    user = User.find_by_login("admin")
    # Should have been blank before.
    user.name = ''
    user.save(false)
  end
end
