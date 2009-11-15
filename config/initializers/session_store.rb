# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_photoblog_session',
  :secret      => '3107e967dbbc136c31c3d6594dadb1d0b4cecb332be46e1da9fa743c02dc5cf76975dc9120ebae3a4d97a52b3222800ad292533a91ef907c95e11eeaab48ddcb'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
