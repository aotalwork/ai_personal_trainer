module AssessmentsHelper
  STEPS = %w[
    personal
    goal
    nutrition
    allergies
    training
    equipment
    availability
    health
    summary
  ].freeze

  def step_number(step)
    STEPS.index(step).to_i + 1
  end

  def step_percentage(step)
    ((step_number(step).to_f / STEPS.length) * 100).round
  end
end