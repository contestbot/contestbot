require 'test/unit'
require '../bin/bot'

class Test_Map < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @bot = Bot.new("B")
  end

  def test_identify_enemies_moves_Case_enemy_moves_left
    print "\ntest_identify_enemies_moves_Case_enemy_moves_left\n"
    first_message = "X,X,X,X,X,X,X,X,X,X,X\nX,_,B,_,_,D,_,_,#,_,X\nX,_,_,_,X,_,X,#,#,#,X\nX,A,_,2,L,L,_,_,#,_,X\nX,_,X,L,X,L,X,_,X,_,X\nX,_,V,L,L,L,L,_,L,_,X\nX,_,X,L,X,L,X,L,X,_,X\nX,C,P,L,L,L,L,L,L,_,X\nX,_,L,L,X,L,X,L,L,_,X\nX,_,_,_,1,_,_,_,_,_,X\nX,X,X,X,X,X,X,X,X,X,X\n"
    second_message ="X,X,X,X,X,X,X,X,X,X,X\nX,_,B,_,D,_,_,_,#,_,X\nX,_,_,_,X,_,X,#,#,#,X\nX,A,_,2,L,L,_,_,#,_,X\nX,_,X,L,X,L,X,_,X,_,X\nX,_,V,L,L,L,L,_,L,_,X\nX,_,X,L,X,L,X,L,X,_,X\nX,C,P,L,L,L,L,L,L,_,X\nX,_,L,L,X,L,X,L,L,_,X\nX,_,_,_,1,_,_,_,_,_,X\nX,X,X,X,X,X,X,X,X,X,X\n"
    @bot.update_map(first_message)
    @bot.update_last_map()
    @bot.update_map(second_message)
#    @bot.identify_enemies_moves()
#    print @bot.print_map(@bot.get_map_elements,false,true,false)
    enemy=@bot.get_map_elements.select{|element|element.get_value()=="D"}
    element = enemy[0].get_enemy_move()
    assert_equal(element,"O")
    puts "\nLetter: " + @bot.get_letter()
    puts "First Map:\n"
    puts "Position: #{@bot.get_x()},#{@bot.get_y()}"
    puts first_message +"\n"
    puts "Second Map:\n"
    puts "Position: #{@bot.get_x()},#{@bot.get_y()}"
    puts second_message +"\n"
    puts "D move:"+ element+"\n"
  end

  def test_identify_enemies_moves_Case_enemy_moves_RIGHT
    print "\ntest_identify_enemies_moves_Case_enemy_moves_RIGHT\n"
    first_message = "X,X,X,X,X,X,X,X,X,X,X\nX,_,B,_,_,D,_,_,#,_,X\nX,_,_,_,X,_,X,#,#,#,X\nX,A,_,2,L,L,_,_,#,_,X\nX,_,X,L,X,L,X,_,X,_,X\nX,_,V,L,L,L,L,_,L,_,X\nX,_,X,L,X,L,X,L,X,_,X\nX,C,P,L,L,L,L,L,L,_,X\nX,_,L,L,X,L,X,L,L,_,X\nX,_,_,_,1,_,_,_,_,_,X\nX,X,X,X,X,X,X,X,X,X,X\n"
    second_message ="X,X,X,X,X,X,X,X,X,X,X\nX,_,B,_,_,_,D,_,#,_,X\nX,_,_,_,X,_,X,#,#,#,X\nX,A,_,2,L,L,_,_,#,_,X\nX,_,X,L,X,L,X,_,X,_,X\nX,_,V,L,L,L,L,_,L,_,X\nX,_,X,L,X,L,X,L,X,_,X\nX,C,P,L,L,L,L,L,L,_,X\nX,_,L,L,X,L,X,L,L,_,X\nX,_,_,_,1,_,_,_,_,_,X\nX,X,X,X,X,X,X,X,X,X,X\n"
    @bot.update_map(first_message)
    @bot.update_last_map()
    @bot.update_map(second_message)
#    @bot.identify_enemies_moves()
#    print @bot.print_map(@bot.get_map_elements,false,true,false)
    enemy=@bot.get_map_elements.select{|element|element.get_value()=="D"}
    element = enemy[0].get_enemy_move()
    assert_equal(element,"E")
    puts "\nLetter: " + @bot.get_letter()
    puts "First Map:\n"
    puts "Position: #{@bot.get_x()},#{@bot.get_y()}"
    puts first_message +"\n"
    puts "Second Map:\n"
    puts "Position: #{@bot.get_x()},#{@bot.get_y()}"
    puts second_message +"\n"
    puts "D move:"+ element+"\n"
  end

  def test_identify_enemies_moves_Case_enemy_moves_DOWN
    print "\ntest_identify_enemies_moves_Case_enemy_moves_DOWN\n"
    first_message = "X,X,X,X,X,X,X,X,X,X,X\nX,_,B,_,_,D,_,_,#,_,X\nX,_,_,_,X,_,X,#,#,#,X\nX,A,_,2,L,L,_,_,#,_,X\nX,_,X,L,X,L,X,_,X,_,X\nX,_,V,L,L,L,L,_,L,_,X\nX,_,X,L,X,L,X,L,X,_,X\nX,C,P,L,L,L,L,L,L,_,X\nX,_,L,L,X,L,X,L,L,_,X\nX,_,_,_,1,_,_,_,_,_,X\nX,X,X,X,X,X,X,X,X,X,X\n"
    second_message ="X,X,X,X,X,X,X,X,X,X,X\nX,_,B,_,_,_,_,_,#,_,X\nX,_,_,_,X,D,X,#,#,#,X\nX,A,_,2,L,L,_,_,#,_,X\nX,_,X,L,X,L,X,_,X,_,X\nX,_,V,L,L,L,L,_,L,_,X\nX,_,X,L,X,L,X,L,X,_,X\nX,C,P,L,L,L,L,L,L,_,X\nX,_,L,L,X,L,X,L,L,_,X\nX,_,_,_,1,_,_,_,_,_,X\nX,X,X,X,X,X,X,X,X,X,X\n"
    @bot.update_map(first_message)
    @bot.update_last_map()
    @bot.update_map(second_message)
#    @bot.identify_enemies_moves()
#    print @bot.print_map(@bot.get_map_elements,false,true,false)
    enemy=@bot.get_map_elements.select{|element|element.get_value()=="D"}
    element = enemy[0].get_enemy_move()
    assert_equal(element,"S")
    puts "\nLetter: " + @bot.get_letter()
    puts "First Map:\n"
    puts "Position: #{@bot.get_x()},#{@bot.get_y()}"
    puts first_message +"\n"
    puts "Second Map:\n"
    puts "Position: #{@bot.get_x()},#{@bot.get_y()}"
    puts second_message +"\n"
    puts "D move:"+ element+"\n"
  end

  def test_identify_enemies_moves_Case_enemy_moves_DOWN
    print "\ntest_identify_enemies_moves_Case_enemy_moves_DOWN\n"
    first_message = "X,X,X,X,X,X,X,X,X,X,X\nX,_,B,_,_,_,_,_,#,_,X\nX,_,_,_,X,D,X,#,#,#,X\nX,A,_,2,L,L,_,_,#,_,X\nX,_,X,L,X,L,X,_,X,_,X\nX,_,V,L,L,L,L,_,L,_,X\nX,_,X,L,X,L,X,L,X,_,X\nX,C,P,L,L,L,L,L,L,_,X\nX,_,L,L,X,L,X,L,L,_,X\nX,_,_,_,1,_,_,_,_,_,X\nX,X,X,X,X,X,X,X,X,X,X\n"
    second_message ="X,X,X,X,X,X,X,X,X,X,X\nX,_,B,_,_,D,_,_,#,_,X\nX,_,_,_,X,_,X,#,#,#,X\nX,A,_,2,L,L,_,_,#,_,X\nX,_,X,L,X,L,X,_,X,_,X\nX,_,V,L,L,L,L,_,L,_,X\nX,_,X,L,X,L,X,L,X,_,X\nX,C,P,L,L,L,L,L,L,_,X\nX,_,L,L,X,L,X,L,L,_,X\nX,_,_,_,1,_,_,_,_,_,X\nX,X,X,X,X,X,X,X,X,X,X\n"
    @bot.update_map(first_message)
    @bot.update_last_map()
    @bot.update_map(second_message)
#    @bot.identify_enemies_moves()
#    print @bot.print_map(@bot.get_map_elements,false,true,false)
    enemy=@bot.get_map_elements.select{|element|element.get_value()=="D"}
    element = enemy[0].get_enemy_move()
    assert_equal(element,"N")
    puts "\nLetter: " + @bot.get_letter()
    puts "First Map:\n"
    puts "Position: #{@bot.get_x()},#{@bot.get_y()}"
    puts first_message +"\n"
    puts "Second Map:\n"
    puts "Position: #{@bot.get_x()},#{@bot.get_y()}"
    puts second_message +"\n"
    puts "D move:"+ element+"\n"
  end

  def test_identify_enemies_moves_Case_enemy_moves_NO_MOVE
    print "\ntest_identify_enemies_moves_Case_enemy_moves_NO_MOVE\n"
    first_message = "X,X,X,X,X,X,X,X,X,X,X\nX,_,B,_,_,D,_,_,#,_,X\nX,_,_,_,X,_,X,#,#,#,X\nX,A,_,2,L,L,_,_,#,_,X\nX,_,X,L,X,L,X,_,X,_,X\nX,_,V,L,L,L,L,_,L,_,X\nX,_,X,L,X,L,X,L,X,_,X\nX,C,P,L,L,L,L,L,L,_,X\nX,_,L,L,X,L,X,L,L,_,X\nX,_,_,_,1,_,_,_,_,_,X\nX,X,X,X,X,X,X,X,X,X,X\n"
    second_message ="X,X,X,X,X,X,X,X,X,X,X\nX,_,B,_,_,D,_,_,#,_,X\nX,_,_,_,X,_,X,#,#,#,X\nX,A,_,2,L,L,_,_,#,_,X\nX,_,X,L,X,L,X,_,X,_,X\nX,_,V,L,L,L,L,_,L,_,X\nX,_,X,L,X,L,X,L,X,_,X\nX,C,P,L,L,L,L,L,L,_,X\nX,_,L,L,X,L,X,L,L,_,X\nX,_,_,_,1,_,_,_,_,_,X\nX,X,X,X,X,X,X,X,X,X,X\n"
    @bot.update_map(first_message)
    @bot.update_last_map()
    @bot.update_map(second_message)
#    @bot.identify_enemies_moves()
#    print @bot.print_map(@bot.get_map_elements,false,true,false)
    enemy=@bot.get_map_elements.select{|element|element.get_value()=="D"}
    element = enemy[0].get_enemy_move()
    assert_equal(element,"P")
    puts "\nLetter: " + @bot.get_letter()
    puts "First Map:\n"
    puts "Position: #{@bot.get_x()},#{@bot.get_y()}"
    puts first_message +"\n"
    puts "Second Map:\n"
    puts "Position: #{@bot.get_x()},#{@bot.get_y()}"
    puts second_message +"\n"
    puts "D move:"+ element+"\n"
  end


  def test_identify_enemies_moves_Case_enemy_puts_bomb_left
    print "\ntest_identify_enemies_moves_Case_enemy_puts_bomb_left\n"
    first_message = "X,X,X,X,X,X,X,X,X,X,X\nX,_,B,_,_,D,_,_,#,_,X\nX,_,_,_,X,_,X,#,#,#,X\nX,A,_,2,L,L,_,_,#,_,X\nX,_,X,L,X,L,X,_,X,_,X\nX,_,V,L,L,L,L,_,L,_,X\nX,_,X,L,X,L,X,L,X,_,X\nX,C,P,L,L,L,L,L,L,_,X\nX,_,L,L,X,L,X,L,L,_,X\nX,_,_,_,1,_,_,_,_,_,X\nX,X,X,X,X,X,X,X,X,X,X\n"
    second_message ="X,X,X,X,X,X,X,X,X,X,X\nX,_,B,_,2,D,_,_,#,_,X\nX,_,_,_,X,_,X,#,#,#,X\nX,A,_,2,L,L,_,_,#,_,X\nX,_,X,L,X,L,X,_,X,_,X\nX,_,V,L,L,L,L,_,L,_,X\nX,_,X,L,X,L,X,L,X,_,X\nX,C,P,L,L,L,L,L,L,_,X\nX,_,L,L,X,L,X,L,L,_,X\nX,_,_,_,1,_,_,_,_,_,X\nX,X,X,X,X,X,X,X,X,X,X\n"
    @bot.update_map(first_message)
    @bot.update_last_map()
    @bot.update_map(second_message)
#    @bot.identify_enemies_moves()
#    print @bot.print_map(@bot.get_map_elements,false,true,false)
    enemy=@bot.get_map_elements.select{|element|element.get_value()=="D"}
    element = enemy[0].get_enemy_move()
    assert_equal(element,"BO")
    puts "\nLetter: " + @bot.get_letter()
    puts "First Map:\n"
    puts "Position: #{@bot.get_x()},#{@bot.get_y()}"
    puts first_message +"\n"
    puts "Second Map:\n"
    puts "Position: #{@bot.get_x()},#{@bot.get_y()}"
    puts second_message +"\n"
    puts "D move:"+ element+"\n"
  end

  def test_identify_enemies_moves_Case_enemy_puts_bomb_right
    print "\ntest_identify_enemies_moves_Case_enemy_puts_bomb_right\n"
    first_message = "X,X,X,X,X,X,X,X,X,X,X\nX,_,B,_,_,D,_,_,#,_,X\nX,_,_,_,X,_,X,#,#,#,X\nX,A,_,2,L,L,_,_,#,_,X\nX,_,X,L,X,L,X,_,X,_,X\nX,_,V,L,L,L,L,_,L,_,X\nX,_,X,L,X,L,X,L,X,_,X\nX,C,P,L,L,L,L,L,L,_,X\nX,_,L,L,X,L,X,L,L,_,X\nX,_,_,_,1,_,_,_,_,_,X\nX,X,X,X,X,X,X,X,X,X,X\n"
    second_message ="X,X,X,X,X,X,X,X,X,X,X\nX,_,B,_,_,D,2,_,#,_,X\nX,_,_,_,X,_,X,#,#,#,X\nX,A,_,2,L,L,_,_,#,_,X\nX,_,X,L,X,L,X,_,X,_,X\nX,_,V,L,L,L,L,_,L,_,X\nX,_,X,L,X,L,X,L,X,_,X\nX,C,P,L,L,L,L,L,L,_,X\nX,_,L,L,X,L,X,L,L,_,X\nX,_,_,_,1,_,_,_,_,_,X\nX,X,X,X,X,X,X,X,X,X,X\n"
    @bot.update_map(first_message)
    @bot.update_last_map()
    @bot.update_map(second_message)
#    @bot.identify_enemies_moves()
#    print @bot.print_map(@bot.get_map_elements,false,true,false)
    enemy=@bot.get_map_elements.select{|element|element.get_value()=="D"}
    element = enemy[0].get_enemy_move()
    assert_equal(element,"BE")
    puts "\nLetter: " + @bot.get_letter()
    puts "First Map:\n"
    puts "Position: #{@bot.get_x()},#{@bot.get_y()}"
    puts first_message +"\n"
    puts "Second Map:\n"
    puts "Position: #{@bot.get_x()},#{@bot.get_y()}"
    puts second_message +"\n"
    puts "D move:"+ element+"\n"
  end

  def test_identify_enemies_moves_Case_enemy_puts_bomb_down
    print "\ntest_identify_enemies_moves_Case_enemy_puts_bomb_down\n"
    first_message = "X,X,X,X,X,X,X,X,X,X,X\nX,_,B,_,_,D,_,_,#,_,X\nX,_,_,_,X,_,X,#,#,#,X\nX,A,_,2,L,L,_,_,#,_,X\nX,_,X,L,X,L,X,_,X,_,X\nX,_,V,L,L,L,L,_,L,_,X\nX,_,X,L,X,L,X,L,X,_,X\nX,C,P,L,L,L,L,L,L,_,X\nX,_,L,L,X,L,X,L,L,_,X\nX,_,_,_,1,_,_,_,_,_,X\nX,X,X,X,X,X,X,X,X,X,X\n"
    second_message ="X,X,X,X,X,X,X,X,X,X,X\nX,_,B,_,_,D,_,_,#,_,X\nX,_,_,_,X,2,X,#,#,#,X\nX,A,_,2,L,L,_,_,#,_,X\nX,_,X,L,X,L,X,_,X,_,X\nX,_,V,L,L,L,L,_,L,_,X\nX,_,X,L,X,L,X,L,X,_,X\nX,C,P,L,L,L,L,L,L,_,X\nX,_,L,L,X,L,X,L,L,_,X\nX,_,_,_,1,_,_,_,_,_,X\nX,X,X,X,X,X,X,X,X,X,X\n"
    @bot.update_map(first_message)
    @bot.update_last_map()
    @bot.update_map(second_message)
#    @bot.identify_enemies_moves()
    print @bot.print_map(@bot.get_map_elements,false,true,false)
    enemy=@bot.get_map_elements.select{|element|element.get_value()=="D"}
    element = enemy[0].get_enemy_move()
    assert_equal(element,"BS")
    puts "\nLetter: " + @bot.get_letter()
    puts "First Map:\n"
    puts "Position: #{@bot.get_x()},#{@bot.get_y()}"
    puts first_message +"\n"
    puts "Second Map:\n"
    puts "Position: #{@bot.get_x()},#{@bot.get_y()}"
    puts second_message +"\n"
    puts "D move:"+ element+"\n"
  end

  def test_identify_enemies_moves_Case_enemy_puts_bomb_up
    print "\ntest_identify_enemies_moves_Case_enemy_puts_bomb_up\n"
    first_message = "X,X,X,X,X,X,X,X,X,X,X\nX,_,B,_,_,_,_,_,#,_,X\nX,_,_,_,X,D,X,#,#,#,X\nX,A,_,2,L,L,_,_,#,_,X\nX,_,X,L,X,L,X,_,X,_,X\nX,_,V,L,L,L,L,_,L,_,X\nX,_,X,L,X,L,X,L,X,_,X\nX,C,P,L,L,L,L,L,L,_,X\nX,_,L,L,X,L,X,L,L,_,X\nX,_,_,_,1,_,_,_,_,_,X\nX,X,X,X,X,X,X,X,X,X,X\n"
    second_message ="X,X,X,X,X,X,X,X,X,X,X\nX,_,B,_,_,2,_,_,#,_,X\nX,_,_,_,X,D,X,#,#,#,X\nX,A,_,2,L,L,_,_,#,_,X\nX,_,X,L,X,L,X,_,X,_,X\nX,_,V,L,L,L,L,_,L,_,X\nX,_,X,L,X,L,X,L,X,_,X\nX,C,P,L,L,L,L,L,L,_,X\nX,_,L,L,X,L,X,L,L,_,X\nX,_,_,_,1,_,_,_,_,_,X\nX,X,X,X,X,X,X,X,X,X,X\n"
    @bot.update_map(first_message)
    @bot.update_last_map()
    @bot.update_map(second_message)
#    @bot.identify_enemies_moves()
#    print @bot.print_map(@bot.get_map_elements,false,true,false)
    enemy=@bot.get_map_elements.select{|element|element.get_value()=="D"}
    element = enemy[0].get_enemy_move()
    assert_equal(element,"BN")
    puts "\nLetter: " + @bot.get_letter()
    puts "First Map:\n"
    puts "Position: #{@bot.get_x()},#{@bot.get_y()}"
    puts first_message +"\n"
    puts "Second Map:\n"
    puts "Position: #{@bot.get_x()},#{@bot.get_y()}"
    puts second_message +"\n"
    puts "D move:"+ element+"\n"
  end

  def test_identify_enemies_moves_Case_enemy_takes_power_P_left
    print "\ntest_identify_enemies_moves_Case_enemy_takes_power_P_left\n"
    first_message = "X,X,X,X,X,X,X,X,X,X,X\nX,_,B,_,P,D,_,_,#,_,X\nX,_,_,_,X,_,X,#,#,#,X\nX,A,_,2,L,L,_,_,#,_,X\nX,_,X,L,X,L,X,_,X,_,X\nX,_,V,L,L,L,L,_,L,_,X\nX,_,X,L,X,L,X,L,X,_,X\nX,C,P,L,L,L,L,L,L,_,X\nX,_,L,L,X,L,X,L,L,_,X\nX,_,_,_,1,_,_,_,_,_,X\nX,X,X,X,X,X,X,X,X,X,X\n"
    second_message ="X,X,X,X,X,X,X,X,X,X,X\nX,_,B,_,D,_,_,_,#,_,X\nX,_,_,_,X,_,X,#,#,#,X\nX,A,_,2,L,L,_,_,#,_,X\nX,_,X,L,X,L,X,_,X,_,X\nX,_,V,L,L,L,L,_,L,_,X\nX,_,X,L,X,L,X,L,X,_,X\nX,C,P,L,L,L,L,L,L,_,X\nX,_,L,L,X,L,X,L,L,_,X\nX,_,_,_,1,_,_,_,_,_,X\nX,X,X,X,X,X,X,X,X,X,X\n"
    @bot.update_map(first_message)
    @bot.update_last_map()
    @bot.update_map(second_message)
#    @bot.identify_enemies_moves()
#    print @bot.print_map(@bot.get_map_elements,false,true,false)
    enemy=@bot.get_map_elements.select{|element|element.get_value()=="D"}
    element = enemy[0].get_enemy_move()
    power=enemy[0].get_powerp()
    assert_equal(element,"O")
    assert_equal(power,2)
    puts "\nLetter: " + @bot.get_letter()
    puts "First Map:\n"
    puts "Position: #{@bot.get_x()},#{@bot.get_y()}"
    puts first_message +"\n"
    puts "Second Map:\n"
    puts "Position: #{@bot.get_x()},#{@bot.get_y()}"
    puts second_message +"\n"
    puts "D move: "+ element+"\n"
    print "D Power P: ", power,"\n"
  end

  def test_identify_enemies_moves_Case_enemy_takes_power_V_right
    print "\ntest_identify_enemies_moves_Case_enemy_takes_power_V_right\n"
    first_message = "X,X,X,X,X,X,X,X,X,X,X\nX,_,B,_,_,D,V,_,#,_,X\nX,_,_,_,X,_,X,#,#,#,X\nX,A,_,2,L,L,_,_,#,_,X\nX,_,X,L,X,L,X,_,X,_,X\nX,_,V,L,L,L,L,_,L,_,X\nX,_,X,L,X,L,X,L,X,_,X\nX,C,P,L,L,L,L,L,L,_,X\nX,_,L,L,X,L,X,L,L,_,X\nX,_,_,_,1,_,_,_,_,_,X\nX,X,X,X,X,X,X,X,X,X,X\n"
    second_message ="X,X,X,X,X,X,X,X,X,X,X\nX,_,B,_,_,_,D,_,#,_,X\nX,_,_,_,X,_,X,#,#,#,X\nX,A,_,2,L,L,_,_,#,_,X\nX,_,X,L,X,L,X,_,X,_,X\nX,_,V,L,L,L,L,_,L,_,X\nX,_,X,L,X,L,X,L,X,_,X\nX,C,P,L,L,L,L,L,L,_,X\nX,_,L,L,X,L,X,L,L,_,X\nX,_,_,_,1,_,_,_,_,_,X\nX,X,X,X,X,X,X,X,X,X,X\n"
    @bot.update_map(first_message)
    @bot.update_last_map()
    @bot.update_map(second_message)
#    @bot.identify_enemies_moves()
#    print @bot.print_map(@bot.get_map_elements,false,true,false)
    enemy=@bot.get_map_elements.select{|element|element.get_value()=="D"}
    element = enemy[0].get_enemy_move()
    power=enemy[0].get_powerv()
    assert_equal(element,"E")
    assert_equal(power,2)
    puts "\nLetter: " + @bot.get_letter()
    puts "First Map:\n"
    puts "Position: #{@bot.get_x()},#{@bot.get_y()}"
    puts first_message +"\n"
    puts "Second Map:\n"
    puts "Position: #{@bot.get_x()},#{@bot.get_y()}"
    puts second_message +"\n"
    puts "D move: "+ element+"\n"
    print "D Power V: ", power,"\n"
  end

  def test_identify_enemies_moves_Case_enemy_puts_bomb_two_enemies_between_one_bomb_one_enemy_moves
    print "\ntest_identify_enemies_moves_Case_enemy_puts_bomb_two_enemies_between_one_bomb_one_bomb_one_enemy_moves\n"
    first_message = "X,X,X,X,X,X,X,X,X,X,X\nX,_,B,_,D,_,_,A,#,_,X\nX,_,_,_,X,_,X,#,#,#,X\nX,A,_,2,L,L,_,_,#,_,X\nX,_,X,L,X,L,X,_,X,_,X\nX,_,V,L,L,L,L,_,L,_,X\nX,_,X,L,X,L,X,L,X,_,X\nX,C,P,L,L,L,L,L,L,_,X\nX,_,L,L,X,L,X,L,L,_,X\nX,_,_,_,1,_,_,_,_,_,X\nX,X,X,X,X,X,X,X,X,X,X\n"
    second_message ="X,X,X,X,X,X,X,X,X,X,X\nX,_,B,_,_,D,2,A,#,_,X\nX,_,_,_,X,_,X,#,#,#,X\nX,_,_,2,L,L,_,_,#,_,X\nX,_,X,L,X,L,X,_,X,_,X\nX,_,V,L,L,L,L,_,L,_,X\nX,_,X,L,X,L,X,L,X,_,X\nX,C,P,L,L,L,L,L,L,_,X\nX,_,L,L,X,L,X,L,L,_,X\nX,_,_,_,1,_,_,_,_,_,X\nX,X,X,X,X,X,X,X,X,X,X\n"
    @bot.update_map(first_message)
    @bot.update_last_map()
    @bot.update_map(second_message)
#    @bot.identify_enemies_moves()
    print @bot.print_map(@bot.get_map_elements,false,true,false)
    enemy=@bot.get_map_elements.select{|element|element.get_value()=="D"}
    element = enemy[0].get_enemy_move()
    enemy=@bot.get_map_elements.select{|element|element.get_value()=="A"}
    elementA = enemy[0].get_enemy_move()
    enemy=@bot.get_map_elements.select{|element|element.get_x()==6 &&element.get_y()==1}
    bomb = enemy[0].get_created_by()
    assert_equal(element,"E")
    assert_equal(elementA,"BO")
    assert_equal(elementA,"BO")
    puts "\nLetter: " + @bot.get_letter()
    puts "First Map:\n"
    puts "Position: #{@bot.get_x()},#{@bot.get_y()}"
    puts first_message +"\n"
    puts "Second Map:\n"
    puts "Position: #{@bot.get_x()},#{@bot.get_y()}"
    puts second_message +"\n"
    puts "D move: "+ element+"\n"
    print "A move: ", elementA,"\n"
    print "bomb created by ", bomb,"\n"
  end

  def test_identify_enemies_moves_Case_enemy_puts_bomb_two_enemies_between_one_bomb_neither_moves
    print "\ntest_identify_enemies_moves_Case_enemy_puts_bomb_two_enemies_between_one_bomb_neither_moves\n"
    first_message = "X,X,X,X,X,X,X,X,X,X,X\nX,_,B,_,_,D,_,A,#,_,X\nX,_,_,_,X,_,X,#,#,#,X\nX,A,_,2,L,L,_,_,#,_,X\nX,_,X,L,X,L,X,_,X,_,X\nX,_,V,L,L,L,L,_,L,_,X\nX,_,X,L,X,L,X,L,X,_,X\nX,C,P,L,L,L,L,L,L,_,X\nX,_,L,L,X,L,X,L,L,_,X\nX,_,_,_,1,_,_,_,_,_,X\nX,X,X,X,X,X,X,X,X,X,X\n"
    second_message ="X,X,X,X,X,X,X,X,X,X,X\nX,_,B,_,_,D,2,A,#,_,X\nX,_,_,_,X,_,X,#,#,#,X\nX,_,_,2,L,L,_,_,#,_,X\nX,_,X,L,X,L,X,_,X,_,X\nX,_,V,L,L,L,L,_,L,_,X\nX,_,X,L,X,L,X,L,X,_,X\nX,C,P,L,L,L,L,L,L,_,X\nX,_,L,L,X,L,X,L,L,_,X\nX,_,_,_,1,_,_,_,_,_,X\nX,X,X,X,X,X,X,X,X,X,X\n"
    @bot.update_map(first_message)
    @bot.update_last_map()
    @bot.update_map(second_message)
    @bot.identify_enemies_moves()
    print @bot.print_map(@bot.get_map_elements,false,true,false)
    enemy=@bot.get_map_elements.select{|element|element.get_value()=="D"}
    element = enemy[0].get_enemy_move()
    enemy=@bot.get_map_elements.select{|element|element.get_value()=="A"}
    elementA = enemy[0].get_enemy_move()
    # assert_equal(element,"BE")
    # assert_equal(elementA,"P")

    puts "\nLetter: " + @bot.get_letter()
    puts "First Map:\n"
    puts "Position: #{@bot.get_x()},#{@bot.get_y()}"
    puts first_message +"\n"
    puts "Second Map:\n"
    puts "Position: #{@bot.get_x()},#{@bot.get_y()}"
    puts second_message +"\n"
    puts "D move: "+ element+"\n"
    print "A move: ", elementA,"\n"
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end


  # Fake test
  def test_fail

    # fail('Not implemented')
  end

end