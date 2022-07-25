# frozen_string_literal: true

module ApiHelpers
  def response_body
    JSON.parse(response.body).deep_symbolize_keys[:data]
  end
end
