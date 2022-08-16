# frozen_string_literal: true

class ContributionsController < ApplicationController
  include ContributionPolicy

  before_action :authenticate_user!
  before_action :contribution, only: %i[show]
  def index
    contributions = Contribution.where(goal_id: params[:goal_id]).order(created_at: :desc)
    render_serializered_data(contributions, :ok) if ContributionPolicy.can_index?
  end

  def show
    render_serializered_data(@contribution, :ok) if ContributionPolicy.can_see?
  end

  def create
    if ContributionPolicy.can_create?
      contribution = Contribution.create(contribution_params)
      if contribution.valid?
        render_serializered_data(contribution, :created)
      else
        render json: contribution.errors, status: :unprocessable_entity
      end
    end
  end

  def destroy
    if ContributionPolicy.can_delete?
      Contribution.destroy(params[:id])
      render json: {}, status: 204
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
    params.require(:contribution).permit(:amount, :description, :goal_id, :user_id)
  end
end
