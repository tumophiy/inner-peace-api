# frozen_string_literal: true

module GoalPolicy
  def can_see?
    permission(role).can_index_goals
  end

  def can_create?
    permission(role).can_create_goal
  end

  def can_index?
    permission(role).can_index_goals
  end

  def can_update?
    permission(role).can_update_goal
  end

  def can_delete?
    permission(role).can_delete_goal
  end

  private

  def role
    if current_user.is_admin
      @role = 'admin'
    elsif !@goal.nil?
      return @role = 'creator' if @goal.user_id == current_user.id

      return @role = 'donator' if donator?
    else
      @role = 'viewer'
    end
  end

  def donator?
    Contribution.where(goal_id: @goal.id, user_id: current_user.id).count >= 1
  end

  def permission(role)
    Permission.join(:roles).where(name: role)
  end
end
