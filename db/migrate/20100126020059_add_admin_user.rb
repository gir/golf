class AddAdminUser < ActiveRecord::Migration
  def self.up
    user = User.new
    user.login = "admin"
    user.email = APP_CONFIG['settings']['admin_email']
    user.password = APP_CONFIG['settings']['admin_password']
    user.password_confirmation = APP_CONFIG['settings']['admin_password']
    user.save(false)

    role = Role.new
    role.name = "admin"
    role.save
    admin_user = User.find_by_login("admin")
    admin_role = Role.find_by_name("admin")
    admin_user.activated_at = Time.now.utc
    admin_user.roles << admin_role
    admin_user.save(false)    
  end
 
  def self.down
    admin_user = User.find_by_login("admin")
    admin_role = Role.find_by_name("admin")
    admin_user.roles = []
    admin_user.save
    admin_user.destroy
    admin_role.destroy
  end
end
