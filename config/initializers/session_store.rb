# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_beelbank_opdracht1_session',
  :secret      => '6bdb7510c501502532c9c584ddde4b24f4f9a2ee93b488a0ea5c2416e3db88e7184dabd76174214eea107dfc37eb204018d0966704f3a796f17c56b0f8bc832d'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
