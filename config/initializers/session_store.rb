# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_kievsub_session',
  :secret      => '64d08fd1da5ed5edd7b92307189077188c567cae227199e46e9024bb7b5840109b32bfbaf36f5801b3f751a303975720e8ef23a301de5acaa7a436639b6b6cc5'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
