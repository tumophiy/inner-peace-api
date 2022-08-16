# frozen_string_literal: true

class GoalsController < ApplicationController
  include GoalPolicy

  before_action :authenticate_user!
  before_action :goal, only: %i[show update]
  def index
    return render_serializered_data(Goal.recent, :ok) if GoalPolicy.can_index?

    render json: { data: ['You don\'t have rights to do that'] }, status: :unprocessable_entity
  end

  def show
    return render_serializered_data(@goal, :ok) if GoalPolicy.can_see?

    render json: { data: ['You don\'t have rights to do that'] }, status: :unprocessable_entity
  end

  def create
    goal = Goal.create(goal_params)
    if GoalPolicy.can_create?
      if goal.valid?
        render_serializered_data(goal, :created)
      else
        render json: goal.errors, status: :unprocessable_entity
      end
    else
      render json: { data: ['You don\'t have rights to do that'] }, status: :unprocessable_entity
    end
  end

  def destroy
    if GoalPolicy.can_delete?
      Goal.destroy(params[:id])
      render json: {}, status: 204
    else
      render json: { data: ['You don\'t have rights to do that'] }, status: :unprocessable_entity
    end
    end
  end

  def update
    if GoalPolicy.can_update?
      if @goal.update(goal_params)
        render_serializered_data(@goal, :ok)
      else
        render json: @goal.errors, status: :unprocessable_entity
      end
    else
      render json: { data: ['You don\'t have rights to do that'] }, status: :unprocessable_entity
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
    params.require(:goal).permit(:title, :amount, :description, :interest_rate, :deadline, :user_id)
  end
end
