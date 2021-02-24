class RegionsController < ApplicationController
  def search
    @region = params[:region]
    @records = search_for(@region)
  end

  private
  def search_for(region)
    Region.where(region: region)
  end
end
