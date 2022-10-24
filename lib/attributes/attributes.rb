module Attributes
  # Module Attribute Basic
  class Basic
    attr_accessor :attribute

    def initialize(**hash)
      hash[:level] = 1 if hash[:level] > 45

      @attribute = {
        attack: calculate_attributes(:attack, hash[:level]),
        defense: calculate_attributes(:defense, hash[:level]),
        agility: calculate_attributes(:agility, hash[:level]),
        luck: calculate_attributes(:luck, hash[:level])
      }
    end

    def calculate_attributes(attr, level)
      case attr
      when :attack
        get_attr(1.2, Math.log(level)) + 1
      when :defense
        get_attr(2, Math.log(level)) + level
      when :agility
        get_attr(2.3, Math.log(level)) * 2
      when :luck
        get_attr(2, Math.log(level)) + 2
      end
    end
    private :calculate_attributes

    def get_attr(arg1, arg2)
      value = Math.exp(arg1) * Math.exp(arg2)
      value.to_i
    end
    private :get_attr
  end

  # Module Attribute Force
  class Force < Basic
    def initialize(**hash)
      super
      hash[:level] = 1 if hash[:level] > 45

      @attribute[:damage] = calculate_forces(:damage, hash[:level])
      @attribute[:armo] = calculate_forces(:armo, hash[:level])
      @attribute[:hp] = calculate_forces(:hp, hash[:level])
      @attribute[:strong] = calculate_forces(:strong, hash[:level])
    end

    def calculate_forces(attr, level)
      case attr
      when :damage
        @attribute[:attack]
      when :armo
        @attribute[:defense]
      when :hp
        @attribute[:hp] || 900 + Math.exp(level).to_i
      when :strong
        @attribute[:strong] || 200 + Math.exp(level).to_i
      end
    end
    private :calculate_forces
  end
end
