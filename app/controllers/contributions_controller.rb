class ContributionsController < ApplicationController
  def index
    render json: Contribution.all, status: :ok
  end
end
