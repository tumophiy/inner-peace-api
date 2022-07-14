# frozen_string_literal: true

class ContributionsController < ApplicationController
  before_action :contribution, only: %i[show update]
  def index
    contributions = Contribution.where(goal_id: params[:goal_id]).order(created_at: :desc)
    render_serializered_data(contributions)
  end

  def show
    render_serializered_data(@contribution)
  end

  def create
    contribution = Contribution.create(contribution_params)
    render_serializered_data(contribution)
  end

  def destroy
    Contribution.destroy(params[:id])
  end

  def update
    @contribution.update(contribution_params)
    render_serializered_data(@contribution)
  end

  private

  def render_serializered_data(obj)
    render json: ContributionSerializer.new(obj), status: :ok
  end

  def contribution
    @contribution = Contribution.find(params[:id])
  end

  def contribution_params
    params.permit(:amount, :description, :goal_id)
  end
end
