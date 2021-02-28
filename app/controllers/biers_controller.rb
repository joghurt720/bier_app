class BiersController < ApplicationController
  def search
    @region = params[:region]
    @records = search_for(@region)
  end

  def search_by_name
    @name = params[:name]
    @records = search_for_by_name(@name)
  end

  def show
    @bier=Bier.find(params[:id])
  end


  private
  def search_for(region)
    Bier.where(area: region)
  end

  def search_for_by_name(word)
    Bier.where('name LIKE ?', '%'+word+'%')
  end

end
