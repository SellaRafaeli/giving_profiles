# frozen_string_literal: true

class SearchController < ApplicationController
  def index
    @search_results = PgSearch.multisearch(params[:query])
    @users = @search_results.where(searchable_type: "User")
    @organizations = @search_results.where(searchable_type: "Organization")
  end


end
