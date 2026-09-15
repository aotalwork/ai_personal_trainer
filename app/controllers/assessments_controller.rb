class AssessmentsController < ApplicationController
  before_action :require_authentication

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

  def new
    @step = params[:step].presence_in(STEPS) || "personal"

    @profile = Current.user.profile ||
               Current.user.build_profile

    @health_profile = Current.user.health_profile ||
                      Current.user.build_health_profile

    load_step_data
  end

  def create
    @step = params[:step].presence_in(STEPS) || "personal"

    @profile = Current.user.profile ||
               Current.user.build_profile

    @health_profile = Current.user.health_profile ||
                      Current.user.build_health_profile

    case @step
    when "personal"
      save_personal_data
    when "goal"
      save_goal_data
    when "nutrition"
      save_nutrition_data
    when "allergies"
      save_allergy_data
    when "training"
      save_training_data
    when "equipment"
      save_equipment_data
    when "availability"
      save_availability_data
    when "health"
      save_health_data
    when "summary"
      finish_assessment
    end
  end

  private

  def load_step_data
    @allergies = Allergy.order(:name)
    @intolerances = Intolerance.order(:name)
    @equipment = Equipment.order(:category, :name)
  end

  def save_personal_data
    if @profile.update(personal_params)
      redirect_to new_assessment_path(step: "goal")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def save_goal_data
    if @profile.update(goal_params)
      redirect_to new_assessment_path(step: "nutrition")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def save_nutrition_data
    if @profile.update(nutrition_params)
      redirect_to new_assessment_path(step: "allergies")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def save_allergy_data
    ActiveRecord::Base.transaction do
      Current.user.user_allergies.destroy_all
      Current.user.user_intolerances.destroy_all

      allergy_ids = params.dig(:allergies, :allergy_ids)&.reject(&:blank?) || []
      intolerance_ids = params.dig(:allergies, :intolerance_ids)&.reject(&:blank?) || []

      allergy_ids.each do |allergy_id|
        Current.user.user_allergies.create!(
          allergy_id: allergy_id
        )
      end

      intolerance_ids.each do |intolerance_id|
        Current.user.user_intolerances.create!(
          intolerance_id: intolerance_id
        )
      end
    end

    redirect_to new_assessment_path(step: "training")
  rescue ActiveRecord::RecordInvalid
    @allergies = Allergy.order(:name)
    @intolerances = Intolerance.order(:name)

    flash.now[:alert] = "No se pudieron guardar las restricciones."

    render :new, status: :unprocessable_entity
  end

  def save_training_data
    if @profile.update(training_params)
      redirect_to new_assessment_path(step: "equipment")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def save_equipment_data
    redirect_to new_assessment_path(step: "availability")
  end

  def save_availability_data
    redirect_to new_assessment_path(step: "health")
  end

  def save_health_data
    if @health_profile.update(health_params)
      redirect_to new_assessment_path(step: "summary")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def finish_assessment
    redirect_to dashboard_path
  end

  def personal_params
    params.require(:profile).permit(
      :first_name,
      :last_name,
      :birth_date,
      :sex,
      :height_cm,
      :weight_kg,
      :location
    )
  end

  def goal_params
    params.require(:profile).permit(
      :goal,
      :activity_level
    )
  end

  def nutrition_params
    params.require(:profile).permit(
      :diet_type,
      :meals_per_day,
      :food_preferences,
      :disliked_foods,
      :budget_level
    )
  end

  def training_params
    params.require(:profile).permit(
      :training_location,
      :training_experience
    )
  end

  def health_params
    params.require(:health_profile).permit(
      :injuries,
      :medical_conditions,
      :medications,
      :physical_limitations,
      :professional_restrictions,
      :has_current_pain,
      :pain_description,
      :has_injury
    )
  end
end