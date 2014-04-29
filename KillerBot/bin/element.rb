class Element
    @x = 0
    @y = 0
    @value = ""
    @distance=0
    @type=0
    @rank=0
    @weight=0

    def initialize(x,y,value,distance)
        @x = x
        @y = y
        @value = value
        @distance=distance
        case @value
          when "a","b","c","d"
            @type=9
            @weight=0
          when "X"
            @type=8
            @weight=0
          when "#"
            @type=7
            @weight=0
          when "L"
            @type=6
            @weight=2
          when "_"
            @type=5
            @weight=1
          when "V"
            @type=4
            @weight=3
          when "P"
            @type=3
            @weight=3
          when "A","B","C","D"
            @type=2
            @weight=4
          when "2"
            @type=1.1
            @weight=-1
          when "1"
            @type=1
            @weight=-2
        end
        @rank=0
    end

    def get_x()
     return @x
    end
    def get_y()
      return @y
    end
    def get_value()
      return @value
    end
    def get_distance()
      return @distance
    end
    def get_type()
      return @type
    end
    def get_rank()
      return @rank
    end
    def get_weight()
      return @weight
    end
    def set_rank(rank)
      @rank=rank
    end
end
