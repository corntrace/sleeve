# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_sleeve_session',
  :secret      => 'dc3b511cf4ffc82f0e522922156ea32a0a24896db572d5f28c708e823d1e051d9fa8df6d2925a7249d60e72fd457decf7f44032cc3982082deffce90d450878b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
