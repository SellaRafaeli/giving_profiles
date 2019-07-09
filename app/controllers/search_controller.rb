# frozen_string_literal: true

class SearchController < ApplicationController
  def index
    search_results = PgSearch.multisearch(params[:query]).includes(:searchable)

    @users = search_results.where(searchable_type: "User").limit(4)
    @organizations = search_results.where(searchable_type: "Organization").limit(6)
  end
end
