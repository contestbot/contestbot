class Bot
    @letter = " "
    @x = 0
    @y = 0
    @map = []

    def initialize(letter)
        @letter = letter
    end

    def update_map(mapa)
        puts mapa
        rows = mapa.split('\n')
        map = []
        rows.each_with_index do |row, index|
            map[index] = row.split(",")

        end
        pos = mapa.index(@letter) / 2
        @y = pos / rows.length
        @x = pos % rows.length
    end

    def move

        valueMov = [valueMov("N"),valueMov("E"),valueMov("S"),valueMov("O"),valueMov("P")]
        indexMax = valueMov.index(valueMov.max)

       /* mov = Random.rand(1)
        puts "mov#{mov}"*/
        case indexMax
            when 0
                return "N"
            when 1
                return "E"
            when 2
                return "S"
            when 3
                return "O"
            when 4
                return "P"
        end

    end

    def valueMov (mov)

      newPos = findNewPos(mov)

      if(isValid(newPos)== false)
          return -20;
      end
      
    end

    def findNewPos (mov)

    end

    def isValid(newPos)

    end
end
