# frozen_string_literal: true

class ContributionsController < ApplicationController
  def index
    contributions = Contribution.recent
    render json: serializer.new(contributions), status: :ok
  end

  def serializer
    ContributionSerializer
  end
end
