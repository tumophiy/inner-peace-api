# frozen_string_literal: true

class ContributionsController < ApplicationController
  # def index
  #   contributions = Contribution.recent
  #   render json: serializer.new(contributions), status: :ok
  # end

  # def serializer
  #   ContributionSerializer
  # end
  before_action :contribution, only: %i[show update]
  def index
    contributions = Contribution.where(goal_id: params[:goal_id]).order(created_at: :desc)
    render json: contributions
  end

  def show
    render json: @contribution
  end

  def create
    contribution = Contribution.create(contribution_params)
    render json: contribution
  end

  def destroy
    Contribution.destroy(params[:id])
  end

  def update
    @contribution.update(contribution_params)
    render json: @contribution
  end

  private

  def contribution
    @contribution = Contribution.find(params[:id])
  end

  def contribution_params
    params.permit(:amount, :description, :goal_id)
  end
end
