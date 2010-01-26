# Email settings
ActionMailer::Base.delivery_method = APP_CONFIG['mail']['delivery_method']
ActionMailer::Base.sendmail_settings = {
  :location => APP_CONFIG['mail']['location'],
  :arguments => APP_CONFIG['mail']['arguments']
}
ActionMailer::Base.smtp_settings = {
  :address => APP_CONFIG['mail']['address'],
  :port => APP_CONFIG['mail']['port'],
  :domain => APP_CONFIG['mail']['domain'],
  :authentication => APP_CONFIG['mail']['authentication'],
  :user_name => APP_CONFIG['mail']['user_name'],
  :password => APP_CONFIG['mail']['password']  
}
