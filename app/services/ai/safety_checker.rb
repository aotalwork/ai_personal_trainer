class Ai::SafetyChecker
  Result = Data.define(:safe, :alerts)

  def initialize(user)
    @user = user
  end

  def call
    alerts = []

    health_profile = @user.health_profile
    profile = @user.profile

    if health_profile
      alerts << "Existen condiciones médicas declaradas." if health_profile.medical_conditions.present?
      alerts << "Existen lesiones declaradas." if health_profile.injuries.present?
      alerts << "Existen restricciones profesionales." if health_profile.professional_restrictions.present?
    end

    alerts << "El perfil no tiene peso registrado." if profile&.weight_kg.blank?
    alerts << "El perfil no tiene altura registrada." if profile&.height_cm.blank?

    Result.new(
      safe: alerts.empty?,
      alerts: alerts
    )
  end
end