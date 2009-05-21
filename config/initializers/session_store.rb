# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_IndiaISD_session',
  :secret      => '19021d1355e2e10c3aea40fb791a0d83b8ff975893a55a7a972bd31405b9d633317a2559facf29692edd1499a5dd1d1a7f00fcf36632a91bcc0f003e76f999bb'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
