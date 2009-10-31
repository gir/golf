# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_golf_session',
  :secret      => 'cd98a5f2fbb51d7e6d81f9a13704cb20789e86c03ec07269f0f4bd55b76c20c555f45acc1eff143df5b818957dab71e0d5d7f25f520188b616c5524acf663abc'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
