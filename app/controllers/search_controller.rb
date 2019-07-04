# frozen_string_literal: true

class SearchController < ApplicationController
  def index
    search_results = PgSearch.multisearch(params[:query]).includes(:searchable).group_by(&:searchable_type)

    @users = search_results["User"].first(4)
    @organizations = search_results["Organization"].first(6)
  end
end
