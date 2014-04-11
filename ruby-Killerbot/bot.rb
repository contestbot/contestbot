class Bot
    @letter = " "
    @x = 0
    @y = 0
    @map = []

    def initialize(letter)
        @letter = letter
    end

    def update_map(mapa)

        rows = mapa.split("\n")
        map = []

        rows.each_with_index.map do |row, index|
            map[index] = row.split(",")

        end


       #puts map[1][1]


        pos = mapa.index(@letter) / 2
        @y = pos / 11
        @x = pos % 11


        valueMov("O",map)

    end

    #def move
    #
    #    #valueMov = [valueMov("N"),valueMov("E"),valueMov("S"),valueMov("O"),valueMov("P")]
    #    indexMax = valueMov.index(valueMov.max)
    #
    #   /* mov = Random.rand(1)
    #    puts "mov#{mov}"*/
    #    case indexMax
    #        when 0
    #            return "N"
    #        when 1
    #            return "E"
    #        when 2
    #            return "S"
    #        when 3
    #            return "O"
    #        when 4
    #            return "P"
    #    end
    #
    #end

    def valueMov (mov,map)

      newX= findPosX(mov)
      newY=findPosY(mov)
      if(isValid(newX,newY,map)== false)
          return -20;
      end
      
    end


    def findPosX(mov)

      #if mov == "E"
      #  return @x-1
      #end
      #
      #if mov == "O"
      #  return @x+1
      #end

      case mov
        when "E"
          return @x-2
        when "O"
          return @x
      end
      return @x
    end

    def findPosY(mov)

      #if mov =="N"
      #  return @y-1
      #end
      #
      #if mov =="S"
      #  return @y+1
      #end

      case mov
        when "N"
          return @y-2
        when "S"
          return @y
      end

      return @y
    end

    def isValid(nX,nY,map)

      puts nY
      puts nX
      value = map[nX][nY]

      puts value

    end
end
