# frozen_string_literal: true

class SearchUsersController < ApplicationController
  def show
    @response = SearchGithubUsersService.call(search_params[:q])
  end

  private

  def search_params
    params.require(:github_user).permit(:q)
  end
end
