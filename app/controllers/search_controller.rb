class SearchController < ApplicationController
  def index
    search = SearchService.new(current_user: current_user)

    @objects = search.search params[:term]
  end
end
