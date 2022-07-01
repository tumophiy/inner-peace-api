class ContributionsController < ApplicationController
  def index
    contributions = Contribution.all
    render json: serializer.new(contributions), status: :ok
  end

  def serializer
    ContributionSerializer
  end
end
