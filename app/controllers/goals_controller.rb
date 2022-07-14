# frozen_string_literal: true

class GoalsController < ApplicationController
  before_action :goal, only: %i[show update]
  def index
    render_serializered_data(Goal.all)
  end

  def show
    render_serializered_data(@goal)
  end

  def create
    goal = Goal.create(goal_params)
    render_serializered_data(goal)
  end

  def destroy
    Goal.destroy(params[:id])
  end

  def update
    @goal.update(goal_params)
    render_serializered_data(@goal)
  end

  private

  def render_serializered_data(obj)
    render json: GoalSerializer.new(obj), status: :ok
  end

  def goal
    @goal = Goal.find(params[:id])
  end

  def goal_params
    params.permit(:title, :amount, :description, :interest_rate, :deadline)
  end
end
