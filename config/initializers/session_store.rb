# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_skeleton_session',
  :secret      => 'b17e6e3f6b45b18eb0686456f607c018a5f0b2eff116b25cb2caf24690c9abdd9552dd0a3a19dcc3cf52aaef989c024dd4606fe53973219f2ab4bc40786c855a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
