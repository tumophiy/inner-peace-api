# frozen_string_literal: true

class GoalMailer < ApplicationMailer
  def changed_goal(donators, old_goal, new_goal)
    donators.each do
      |donator| mail(to: donator.email, subject: 'Goal that you contributed to has been changed')
    end
  end
end
