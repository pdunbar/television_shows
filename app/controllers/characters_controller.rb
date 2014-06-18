class CharactersController < ApplicationController

  def create
    @character = Character.new(character_params)
    @character.television_show_id = params[:television_show_id]
    @television_show = TelevisionShow.find(params[:television_show_id])
    if @character.save
      flash[:notice] = "Success!"
      redirect_to @television_show
    else
       flash[:notice] = "Your character couldn't be saved!"
       render 'television_shows/show'
    end
  end


  def character_params
    params.require(:character).permit(:actor, :character, :description)
  end

end
