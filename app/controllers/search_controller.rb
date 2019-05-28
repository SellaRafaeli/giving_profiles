# frozen_string_literal: true

class SearchController < ApplicationController
  def index
    @search_results = PgSearch.multisearch(params[:query])
  end


end
