# frozen_string_literal: true

class ContributionPolicy
  before_action :give_role

  def can_see?
    permission.can_index_goals
  end

  def can_create?
    permission.can_create_goal
  end

  def can_index?
    permission.can_index_goals
  end

  def can_delete?
    permission.can_delete_goal
  end

  private

  def give_role
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

  def permission
    Permission.join(:roles).where(name: @role)
  end
end
