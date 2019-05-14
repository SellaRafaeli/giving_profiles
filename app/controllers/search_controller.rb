# frozen_string_literal: true

class SearchController < ApplicationController
  def multisearch
    @search_results = PgSearch.multisearch(params[:query])
  end


end
