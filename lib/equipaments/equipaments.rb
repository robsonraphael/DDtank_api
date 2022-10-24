require_relative '../attributes/attributes'

#
module Equipaments
  #
  class Basic < Attributes::Basic
    def initialize(**hash)
      @name = hash[:name]
      @type = hash[:type]
      @genre = hash[:genre] unless hash[:genre].nil?
      @class = hash[:class] unless hash[:class].nil?
      super
    end
  end

  #
  class Weapon < Basic
    def initialize(**hash)
      super
      @detect = 1
    end
  end
end
