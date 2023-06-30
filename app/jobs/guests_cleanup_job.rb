class GuestsCleanupJob < ApplicationJob
  queue_as :default

  def perform(*args)
    User.find_each do |user|
      UserMailer.with(user: user, fact: CatfactServices::Catfact.new.daily_fact).daily_catfact.deliver_now
    end
  end
end
