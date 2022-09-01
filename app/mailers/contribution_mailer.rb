# frozen_string_literal: true

class ContributionMailer < ApplicationMailer
  def notification(owner, amount, goal)
    @goal = goal
    @amount = amount
    @sum = Contribution.where(goal_id: goal.id).sum
    mail(to: owner.email, subject: 'New contribution')
  end
end
