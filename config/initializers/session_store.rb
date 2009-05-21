# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_blog_driven_development_session',
  :secret      => 'e2de15b95489bcf90ce6b32cb1f2f3c1c274fddb1084837870b19d5ccda567a2b62b81811d702441c8fe5281be2029a67bd2032c2331cc000cd5048cd00a9f74'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
