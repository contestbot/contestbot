class Element
    @x = 0
    @y = 0
    @value = ""
    @distance=0
    @type=0
    @rank=0
    @weight=0
    @bomb = false
    @created_by = ""
    @enemy_move = ""
    @powerp=1
    @powerv=1

    def initialize(x,y,value,distance)
        @x = x
        @y = y
        @value = value
        @distance=distance
        case @value
          when "a","b","c","d"
            @type=9
            @weight=1
          when "X"
            @type=8
            @weight=0
          when "#"
            @type=7
            @weight=1
          when "L"
            @type=6
            @weight=2
          when "_"
            @type=5
            @weight=3
          when "V"
            @type=4
            @weight=4
          when "P"
            @type=3
            @weight=5
          when "A","B","C","D"
            @type=2
            @weight=1
          when "2"
            @type=1.1
            @weight=-1
          when "1"
            @type=1
            @weight=-2
        end
        @rank=0
        @created_by = ""
        @enemy_move = ""
        @powerp=1
        @powerv=1
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

    def get_bomb()
      return @bomb
    end

    def set_bomb(bomb)
      @bomb=bomb
    end

    def get_created_by()
      return @created_by
    end
    def set_created_by(enemy)
      @created_by=enemy
    end

    def get_enemy_move()
      return @enemy_move
    end
    def set_enemy_move(move)
      @enemy_move=move
    end

    def get_powerp()
      return @powerp
    end
    def set_powerp(value)
      @powerp=value
    end

    def get_powerv()
      return @powerv
    end
    def set_powerv(value)
      @powerv=value
    end
end
