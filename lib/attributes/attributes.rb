module Attributes
  # Module Attribute Basic
  class Basic
    attr_accessor :attribute

    def initialize(**hash)
      @attribute = {
        attack: update(:attack, hash[:level]),
        defense: update(:defense, hash[:level]),
        agility: update(:agility, hash[:level]),
        luck: update(:luck, hash[:level])
      }
    end

    def update(attr, level)
      case attr
      when :attack
        1 + level
      when :defense
        2 + level
      when :agility
        2 + level
      when :luck
        3 + level
      end
    end
  end

  # Module Attribute Force
  class Force < Basic
    def initialize(**hash)
      super
      @attribute[:damage] = update_attribute_by_level(:damage, hash[:level])
      @attribute[:armo] = update_attribute_by_level(:armo, hash[:level])
      @attribute[:hp] = update_attribute_by_level(:hp, hash[:level])
      @attribute[:strong] = update_attribute_by_level(:strong, hash[:level])
    end

    def update_attribute_by_level(attr, level)
      case attr
      when :damage
        @attribute[:attack] + Math.log(level).to_i
      when :armo
        @attribute[:defense] + Math.log(level).to_i
      when :hp
        level + (@attribute[:hp] || 900)
      when :strong
        level + (@attribute[:strong] || 200)
      end
    end
  end
end
