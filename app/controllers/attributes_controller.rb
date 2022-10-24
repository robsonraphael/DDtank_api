#
require_relative '../../lib/attributes/attributes'
#
class AttributesController < ApplicationController
  def basic
    @attribute_basic = Attributes::Basic.new(level: params[:level].to_i)
    render json: @attribute_basic
  end

  def force
    @attribute_force = Attributes::Force.new(level: params[:level].to_i)
    render json: @attribute_force
  end
end
