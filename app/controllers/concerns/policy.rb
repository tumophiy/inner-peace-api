# frozen_string_literal: true

module Policy
  def can?
    if current_user.is_admin
      # binding.pry
      admin_permissions
    elsif !@goal.nil?
      return if creator?
      return if donator?
    else
      viewer_permissions
    end
  end

  private

  def admin_permissions
    Permission.find_by(role_id: Role.find_by(name: 'admin').id)
  end

  def viewer_permissions
    Permission.find_by(role_id: Role.find_by(name: 'viewer').id)
  end

  def creator?
    Permission.find_by(role_id: Role.find_by(name: 'creator').id) if @goal.user_id == current_user.id
  end

  def donator?
    if Contribution.where(goal_id: @goal.id, user_id: current_user.id).count >= 1
      Permission.find_by(role_id: Role.find_by(name: 'donator').id)
    end
  end
end
