class Ai::PlanGenerator
  def initialize(user)
    @user = user
  end

  def call
    safety_result = Ai::SafetyChecker.new(@user).call

    unless safety_result.safe
      raise "No se puede generar automáticamente el plan."
    end

    # Próximamente:
    #
    # 1. Recopilar perfil
    # 2. Calcular necesidades
    # 3. Construir prompt
    # 4. Llamar a OpenAI
    # 5. Validar JSON
    # 6. Crear Plan
    # 7. Crear Workouts
    # 8. Crear MealPlan
  end
end