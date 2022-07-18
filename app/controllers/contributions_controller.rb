# frozen_string_literal: true

class ContributionsController < ApplicationController
  before_action :authenticate_user!
  before_action :contribution, only: %i[show update]
  def index
    contributions = Contribution.where(goal_id: params[:goal_id]).order(created_at: :desc)
    render_serializered_data(contributions, :ok)
  end

  def show
    render_serializered_data(@contribution, :ok)
  end

  def create
    if Contribution.create(contribution_params)
      render_serializered_data(contribution, :created)
    else
      render json: contribution.errors, status: :unprocessable_entity
    end
  end

  def destroy
    Contribution.destroy(params[:id])
    render json: {}, status: 204
  end

  def update
    if @contribution.update(contribution_params)
      render_serializered_data(@contribution, :ok)
    else
      render json: @contribution.errors, status: :unprocessable_entity
    end
  end

  private

  def render_serializered_data(obj, status)
    render json: ContributionSerializer.new(obj), status: status
  end

  def contribution
    @contribution = Contribution.find(params[:id])
  end

  def contribution_params
    params.require(:contribution).permit(:amount, :description, :goal_id)
  end
end
