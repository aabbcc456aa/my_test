# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_RailsApplication1_session',
  :secret      => '83b4487008fe82773bc587b7d89eb4c691b567430563c0817eb0182b5b27d09131fc069d3bdaa07ba114e5d13fb0d99dcc3291d0c915a396ca997f3b523163ba'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
