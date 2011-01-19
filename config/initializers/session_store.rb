# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_lifecycle_session',
  :secret      => '853d7dcaf0f3579970dc16b2caff8e0199408a43160709558004b9c50aced5ebef4dc79c9ab1a02e5c7bacbe7ca734de2161b9cfceee16148213ac979c3bb4ef'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
