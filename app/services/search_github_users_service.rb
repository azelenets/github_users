# frozen_string_literal: true

require "net/http"

class SearchGithubUsersService < ApplicationService
  def initialize(keyword)
    @keyword = keyword
  end

  def call
    uri = URI("https://api.github.com/search/users")
    params = { q: keyword }
    uri.query = URI.encode_www_form(params)
    response = Net::HTTP.get_response(uri)
    if response.is_a?(Net::HTTPSuccess)
      JSON.parse(response.body) # TODO: Add pagination
    else
      raise StandardError # TODO: handle invalid responses
    end
  end

  private

  attr_reader :keyword
end
