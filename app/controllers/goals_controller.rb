# frozen_string_literal: true

class GoalsController < ApplicationController
  before_action :set_goal, only: %i[show update]
  def index
    render json: Goal.all
  end

  def show
    render json: @goal
  end

  def create
    goal = Goal.create(goal_params)
    render json: goal
  end

  def destroy
    Goal.destroy(params[:id])
  end

  def update
    @goal.update(goal_params)
    render json: @goal
  end

  private

  def set_goal
    @goal = Goal.find(params[:id])
  end

  def goal_params
    params.permit(:title, :amount, :description, :interest_rate, :deadline)
  end
end
