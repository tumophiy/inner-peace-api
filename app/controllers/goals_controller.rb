# frozen_string_literal: true

class GoalsController < ApplicationController
  before_action :authenticate_user!
  before_action :give_role
  before_action :goal, only: %i[show update]
  def index
    render_serializered_data(Goal.recent, :ok)
  end

  def show
    if can?(show)
      render_serializered_data(@goal, :ok)
    else
      render json: 'no'
    end
  end

  def create
    goal = Goal.create(goal_params)
    if goal.valid?
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
    params.require(:goal).permit(:title, :amount, :description, :interest_rate, :deadline, :user_id)
  end

  def give_role
    @role = if current_user.is_admin
              'admin'
            elsif @goal.user_id == current_user.id
              'owner'
            elsif Contribution.where(goal_id: @goal.id).any? { |id| id == current_user.id }
              'contributor'
            else
              'viewer'
            end
  end

  def can?(method_name)
    'here should be some kind of a join usin Role, RolePermissoins, Permissions and look wheather near method_name is true or false'
  end
end
