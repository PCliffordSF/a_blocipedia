 Rails.configuration.stripe = {
   publishable_key: ENV['publishable_key'],
   secret_key: ENV['secret_key']
 }
 
 # Set our app-stored secret key with Stripe
 Stripe.api_key = Rails.configuration.stripe[:secret_key]