require '../bin/element'
class Bot
    @letter = " "
    @x = 0
    @y = 0
    @powers=[]  #A,B,C,D P=1,V=2,PV=3
    @map_elements=[]
    @last_map_elements=[]

    def initialize(letter)
        @letter = letter
        @powers=[0,0,0,0]  #A,B,C,D P=1,V=2,PV=3
        @map_elements=[]
        @last_map_elements=[]
    end

    def get_map_elements
      return @map_elements
    end

    def get_powers
      return @powers
    end

    def get_x
      return @x
    end

    def get_letter
      return @letter
    end

    def get_y
      return @y
    end

    def update_map(mapa)
      rows = mapa.split("\n")
      map = []
      rows.each_with_index do |row, index|
        map[index] = row.split(",")

      end
      pos = mapa.index(@letter) / 2
      @y = pos / rows.length
      @x = pos % rows.length
# puts "Position: #@x,#@y"
      creates_elements_map(map)
# print print_map(@map_elements,true,false,true)
#       remove_bombs_elements(1)
#     print_map(@map_elements,true,false,true)
      identify_powers()
#print "\nPowers:\n"
#@powers.each{|x| print x," "}
#print_map(@last_map_elements,true,false,false)

    end

    def creates_elements_map(map)
     map.each_with_index do |row, j|
       row.each_with_index do |item, i|
         if((i>0 and i<row.length-1) and (j>0 and j<row.length-1)) then
           if(item!="X")
             @map_elements.push(Element.new(i,j,item,Math.sqrt((@x-i)**2+(@y-j)**2)))
           end
         end
     ##  puts "#{i},#{j}:#{item}"
       end
     end

     @mapbydistance=@map_elements.sort_by{ |element| [ element.get_distance(),element.get_value()] }
     @mapbydistance=@map_elements.sort_by{ |element| [ element.get_value(),element.get_value()] }
     @mapbydistance=@map_elements.sort_by{ |element| [ element.get_y(),element.get_x()] }
     @mapbydistance=@map_elements.sort_by{ |element| [ element.get_distance(),element.get_type()] }
     @mapbydistance=@map_elements.sort_by{ |element| [ element.get_type(),element.get_y(),element.get_x()] }

     ## puts @mapbydistance[0].get_distance()
    end

    def move
      map_neighbors_distance_1=neighbors(@map_elements,@x,@y,1)
      position=map_neighbors_distance_1.max_by do |element|
        element.get_rank()
      end
      difx=@x-position.get_x()
      dify=@y-position.get_y()
        case (difx)
          when 0
            case(dify)
              when 1
                if(position.get_bomb )
                  return "NB"
                end
                return "N"
              when -1
                if(position.get_bomb )
                  return "SB"
                end
                return "S"
            end
          when 1
            if(position.get_bomb )
              return "OB"
            end
            return  "O"  #Izquierda
          when -1
            if(position.get_bomb )
              return "EB"
            end
            return "E"
        end
    end

   def remove_bombs_elements(influence)
     map_bombs=@map_elements.select{|element| element.get_type()==1}
     map_bombs.each_with_index do |item, i|
       x=item.get_x()
       y=item.get_y()
       @map_elements.delete_if{ |element| ((x-influence)<=element.get_x() && element.get_x()<=(x+influence)  && element.get_y()==y) ||  (((y-influence)<=element.get_y() && element.get_y()<=(y+influence))  && element.get_x()==x) }
     end
   end

    def identify_powers
      powers_map=@last_map_elements.select{|element| element.get_type()==3 || element.get_type()==4}
      players_map=@map_elements.select{|element|element.get_type()==2}
      powers_map.each{|power|
        players_map.each{|player|
          if (power.get_x()==player.get_x() && power.get_y()==player.get_y())
            case(power.get_value())
              when "P"
                pvalue=1
              when "V"
                pvalue=2
            end
            case (player.get_value())
              when "A"
                @powers[0]=@powers[0]+pvalue
              when "B"
                @powers[1]=@powers[1]+pvalue
              when "C"
                @powers[2]=@powers[2]+pvalue
              when "D"
                @powers[3]=@powers[3]+pvalue
            end
          end
        }
      }

    end

    def update_last_map
      @last_map_elements=@map_elements
    end

    def distance_two_elements(elementA,elementB)
        x=elementA.get_x()
        y=elementA.get_y()
        xp=elementB.get_x()
        yp=elementB.get_y()
        return Math.sqrt((x-xp)**2+(y-yp)**2)
    end

    def print_map(map,graphic_map,elements_list,size_list)
      if (elements_list==true)
        map=map.sort_by{ |element| [ element.get_y(),element.get_x()] }
        map.each {|x|print  x.get_value()," : ",x.get_x(),",",x.get_y(),",",x.get_distance(),"\t",x.inspect , "\n" }
      end
      if (size_list==true)
        puts "Size: #{map.size()}"
      end
      if (graphic_map==true)
        out=""
        for i in 1..9 do
          j=1
          mapt=map
          mapt=mapt.select{|element| element.get_y()==i }
          mapt.each{|x|
            dif=x.get_x()-j
            for k in 1..dif+1 do
              dif=x.get_x()-j
              if(dif==0)
                out= out + x.get_value()+","
              else
                out=out+ "?,"
              end
              j=j+1
            end
          }
          while(j<10)
            out=out+ "?,"
            j=j+1
          end
          out=out+ "\n"
        end
        out=out+ "\n"
        return out


      end
    end


  def escape_boms(x,y)
      tmp_map=@map_elements
      map_escape=neighbors(tmp_map,x,y)
        tmp_map.delete_if{ |element|element.get_x()==x && element.get_y()==y }
        print print_map(tmp_map,true,false,true)
        map_escape.each{|position|
          map_neighbors=neighbors(tmp_map,position.get_x(),position.get_y())
          map_neighbors.each{|neighbor|
            update_element=@map_elements.select{|element|  element.get_x()==position.get_x() && element.get_y()==position.get_y()}
            update_element[0].set_rank(update_element[0].get_rank()+neighbor.get_weight())
#           if(distance_two_elements(@map_elements.select{|element|  element.get_value()==@letter},position)>3)
#           end
          }

        }
  end

    def put_bombs()
      players_map=@map_elements.select{|element|element.get_type()==2}
      for i in 0..players_map.length()-1 do
        puts players_map[i].get_y()
        if (@y-players_map[i].get_y() == 0 && @x-players_map[i].get_x()< 2 )
          players_map[i].set_rank(players_map[i].get_rank()+1)
          players_map[i].set_bomb(true)
        end
        if (@y-players_map[i].get_y() < 2 && @x-players_map[i].get_x()==0 )
          players_map[i].set_rank(players_map[i].get_rank()+1)
          players_map[i].set_bomb(true)
        end
        if (@y-players_map[i].get_y() < 2 && @x-players_map[i].get_x()<2 )
          players_map[i].set_rank(players_map[i].get_rank()+1)
          players_map[i].set_bomb(true)
        end

      end
    end

  def neighbors(map,position_x,position_y,distance=1)
     return map_neighbors=map.select{|element| ((element.get_x()==position_x-distance ||element.get_x()==position_x+distance)&& element.get_y()==position_y) ||
                                         ((element.get_y()==position_y-distance || element.get_y()==position_y+distance)&& element.get_x()==position_x)}
  end

  def take_decision()
    if(assess_risk()==1)
      print "I'm at risk, I have to escape the influence of bombs: 1\n"
      escape_boms(@x,@y)
      strategy=0
    else
      print "I'm not at risk, I have to decide an strategy: 0\n"
      strategy = defineStrategy()
      if(strategy == 1)
        puts "pasiva"
        assess_near_elements(1)
      else (strategy == 2)
      puts "activa"
      assess_near_elements(2)
      end
    end
    search_best_position(@x,@y,3)
    move()
    return strategy
  end

  def assess_risk()
    remove_bombs_elements(1)
    my_position=@map_elements.select{|element| element.get_value()==@letter}
    if(my_position.size()==0)
      return 1
    else
      return 0
    end
  end

  def takes_powers(map_neighbors_distance_1)
    map_powers=map_neighbors_distance_1.select{|element| element.get_type==3 || element.get_type==4}
    map_powers.each{|power|
      power.set_rank(power.get_rank()+power.get_weight())
    }
    print print_map(map_powers,true,false,true)
  end

  def destroy_blocks(map_neighbors_distance_1,map_neighbors_distance_2)
    map_blocks=map_neighbors_distance_2.select{|element| element.get_type==6}
    map_posible_boms=map_neighbors_distance_1.select{|element| element.get_type==9 || element.get_type==7 || element.get_type==5} ##Posibles ubicaciones bombas
    map_blocks.each{|block|
      map_posible_boms.each{|position|
        distance=distance_two_elements(position,block)
        if(distance==1 && map_posible_boms.size()>=2)
          position.set_rank(position.get_rank()+position.get_weight())
          position.set_bomb(true)
        end
      }
    }
      print print_map(map_blocks,true,false,true)
  end

    def destroy_enemies(map_neighbors_distance_1,map_neighbors_distance_2)
      map_enemies=map_neighbors_distance_2.select{|element| element.get_type==2}
      map_posible_boms=map_neighbors_distance_1.select{|element| element.get_type==9 || element.get_type==7 || element.get_type==5} ##Posibles ubicaciones bombas
      map_enemies.each{|enemies|
        map_posible_boms.each{|position|
          distance=distance_two_elements(position,enemies)
          if(distance==1 && map_posible_boms.size()>=2)
            position.set_rank(position.get_rank()+position.get_weight())
            position.set_bomb(true)
          end
        }
      }
      print print_map(map_enemies,true,false,true)
    end

  def assess_near_elements(strategy=1)
      map_neighbors_distance_2=neighbors(@map_elements,@x,@y,2)
      map_neighbors_distance_1=neighbors(@map_elements,@x,@y,1)
        if(strategy==1)
          takes_powers(map_neighbors_distance_1)
          destroy_blocks(map_neighbors_distance_1,map_neighbors_distance_2)
       elsif(strategy==2)
         destroy_enemies(map_neighbors_distance_1,map_neighbors_distance_2)
      end
      print print_map(map_neighbors_distance_2,true,false,true)
  end

  def search_best_position(x,y,depth)

    aux_y = y
    aux_x = x

    for i in 0..depth do
      if(aux_x>=0 && aux_y>=0 && aux_x< @map_elements.length() && aux_y<@map_elements.length() )
        neighbors=neighbors(@map_elements,aux_x,aux_y,1)
        neighbors.each{|position|
          position.set_rank(position.get_rank()+position.get_weight())
        }
        aux_x=aux_x+1
      end
    end

    aux_y =y
    aux_x= x
    for i in 0..depth do
      if(aux_x>=0 && aux_y>=0 && aux_x< @map_elements.length() && aux_y<@map_elements.length() )
        neighbors=neighbors(@map_elements,aux_x,aux_y,1)
        neighbors.each{|position|
          position.set_rank(position.get_rank()+position.get_weight())
        }
        aux_x=aux_x-1
      end
    end

    aux_y =y
    aux_x= x

    for i in 0..depth do
      if(aux_x>=0 && aux_y>=0 && aux_x< @map_elements.length() && aux_y<@map_elements.length() )
        neighbors=neighbors(@map_elements,aux_x,aux_y,1)
        neighbors.each{|position|
          position.set_rank(position.get_rank()+position.get_weight())
        }
        aux_y=aux_y-1
      end
    end

    aux_y =y
    aux_x= x

    for i in 0..depth do
      if(aux_x>=0 && aux_y>=0 && aux_x< @map_elements.length() && aux_y<@map_elements.length() )
        neighbors=neighbors(@map_elements,aux_x,aux_y,1)
        neighbors.each{|position|
          position.set_rank(position.get_rank()+position.get_weight())
        }
        aux_y=aux_y+1
      end
    end

  end


  def defineStrategy()
    players_map=@map_elements.select{|element|element.get_type()==2}
    if(players_map.length > 2 )
      return 1 ##pasiva
    end
    if(players_map.length == 2 )
      return 2 ##activa
    end
    return 3 ## random
  end
end
