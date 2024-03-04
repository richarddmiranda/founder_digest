module Onboardable
  extend ActiveSupport::Concern


  def finished_onboarding?
    stripe_subscription_id?
  end

  # handle_asynchronously :send_welcome_email
end
