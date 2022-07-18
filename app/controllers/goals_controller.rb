# frozen_string_literal: true

class GoalsController < ApplicationController
  before_action :authenticate_user!
  before_action :goal, only: %i[show update]
  def index
    render_serializered_data(Goal.recent, :ok)
  end

  def show
    render_serializered_data(@goal, :ok)
  end

  def create
    if Goal.create(goal_params)
      render_serializered_data(goal, :created)
    else
      render json: goal.errors, status: :unprocessable_entity
    end
  end

  def destroy
    Goal.destroy(params[:id])
    render json: {}, status: 204
  end

  def update
    if @goal.update(goal_params)
      render_serializered_data(@goal, :ok)
    else
      render json: @goal.errors, status: :unprocessable_entity
    end
  end

  private

  def render_serializered_data(obj, status)
    render json: GoalSerializer.new(obj), status: status
  end

  def goal
    @goal = Goal.find(params[:id])
  end

  def goal_params
    params.require(:goal).permit(:title, :amount, :description, :interest_rate, :deadline)
  end
end
