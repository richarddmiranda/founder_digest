class ChangeSubscriptionsToSubscribers < ActiveRecord::Migration[7.1]
  def change
    rename_table :subscriptions, :subscribers
  end
end
