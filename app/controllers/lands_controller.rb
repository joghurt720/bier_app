class LandsController < ApplicationController
  def top
  end
  
  def search
    @richtung = params[:richtung]
    @records = search_for(@richtung)
  end

  private
  def search_for(richtung)
    if richtung == 'east'
      Land.where(richtung: "東")
    elsif richtung == 'west'
      Land.where(richtung: "西")
    elsif richtung == 'south'
      Land.where(richtung: "南")
    else
      Land.where(richtung: "北")
    end
  end
end
