class GeneratePlanJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    user = User.find(user_id)

    Ai::PlanGenerator
      .new(user)
      .call
  end
end