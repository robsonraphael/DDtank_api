#
require_relative '../../lib/equipaments/equipaments'
#
class EquipamentsController < ApplicationController
  def basic
    @equipament = Equipaments::Basic.new(
      level: params[:level].to_i,
      name: params[:name],
      type: params[:type],
      genre: params[:genre]
    )

    render json: @equipament
  end

  def weapon
    @weapon = Equipaments::Weapon.new(
      level: params[:level].to_i,
      name: params[:name],
      type: params[:type],
      class: params[:class]
    )

    render json: @weapon
  end
end
