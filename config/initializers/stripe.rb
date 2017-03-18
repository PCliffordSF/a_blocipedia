 Rails.configuration.stripe = {
   publishable_key: ENV['pk_test_YIDeykYK8R0g8RQP0JViDCsT'],
   secret_key: ENV['sk_test_3jypPAJXdBoK0TeWIpXoDKk6']
 }
 
 # Set our app-stored secret key with Stripe
 Stripe.api_key = Rails.configuration.stripe[:secret_key]