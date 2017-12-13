 # Store the environment variables on the Rails.configuration object
 Rails.configuration.stripe = {
   publishable_key: 'pk_test_Ed6HnhzRVLK1fWSBQSKXVak7',
   secret_key: 'sk_test_kqtqd1zbBjksUfpexBGLPvyA'
 }
 
 # Set our app-stored secret key with Stripe
 Stripe.api_key = Rails.configuration.stripe[:secret_key]