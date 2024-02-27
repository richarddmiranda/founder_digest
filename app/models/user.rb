class User < ApplicationRecord
  include Signupable
  include Onboardable
  include Billable

  scope :subscribed, -> { where.not(stripe_subscription_id: [nil, '']) }

  has_many :projects
  has_many :subscriptions
  has_many :stakeholder_updates, through: :projects

end
