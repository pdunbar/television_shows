class CharactersController < ApplicationController
  def create
    @character = Character.new(character_params)

    if @character.save
      flash[:notice] = "Success!"
      redirect_to '/television_show'
    else
       flash[:notice] = "Your character couldn't be saved!"
       render :new
    end
  end

  def character_params
    params.require(:character).permit(:actor, :character)
  end

end
