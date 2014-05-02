require 'test/unit'
require '../bin/bot'

class Test_Map < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @bot = Bot.new("B")
  end


  def test_assess_near_when_stratey_pasive_and_one_power_type
    print "\nTest_assess_near_when_stratey_pasive_and_one_power_type\n"
    message = "X,X,X,X,X,X,X,X,X,X,X\nX,_,_,_,V,B,_,_,2,_,X\nX,_,_,_,2,_,L,_,2,L,X\nX,A,_,2,L,L,_,_,#,_,X\nX,_,_,L,_,L,_,_,_,_,X\nX,_,V,L,L,L,L,1,L,_,X\nX,_,_,L,_,L,_,L,_,_,X\nX,C,P,L,L,L,L,L,L,_,X\nX,_,L,L,_,L,_,L,L,_,X\nX,_,_,_,_,_,_,_,_,_,X\nX,X,X,X,X,X,X,X,X,X,X\n"
    @bot.update_map(message)
    @bot.remove_bombs_elements(1)
    @bot.assess_near_elements(1)
    out= @bot.move()
    assert_equal(out,"O")
    map_out=@bot.print_map(@bot.get_map_elements(),true,false,false)

    puts "\nLetter: " + @bot.get_letter()
    puts "Position: #{@bot.get_x()},#{@bot.get_y()}"
    puts message +"\n"
    puts map_out +"\n"
    puts "Move: #{out}\n"
  end

  def test_assess_near_when_stratey_pasive_and_two_power_types
    print "\nTest_assess_near_when_stratey_pasive_and_two_power_types\n"
    message = "X,X,X,X,X,X,X,X,X,X,X\nX,_,_,_,V,B,_,_,2,_,X\nX,_,_,_,2,P,L,_,2,L,X\nX,A,_,2,L,L,_,_,#,_,X\nX,_,_,L,_,L,_,_,_,_,X\nX,_,V,L,L,L,L,1,L,_,X\nX,_,_,L,_,L,_,L,_,_,X\nX,C,P,L,L,L,L,L,L,_,X\nX,_,L,L,_,L,_,L,L,_,X\nX,_,_,_,_,_,_,_,_,_,X\nX,X,X,X,X,X,X,X,X,X,X\n"
    @bot.update_map(message)
    @bot.remove_bombs_elements(1)
    @bot.assess_near_elements(1)
    out= @bot.move()
    assert_equal(out,"S")
    map_out=@bot.print_map(@bot.get_map_elements(),true,false,false)

    puts "\nLetter: " + @bot.get_letter()
    puts "Position: #{@bot.get_x()},#{@bot.get_y()}"
    puts message +"\n"
    puts map_out +"\n"
    puts "Move: #{out}\n"
  end

  def test_assess_near_when_stratey_pasive__blocks_and_powers
    print "\nTest_assess_near_when_stratey_pasive__blocks_and_powers\n"
    message = "X,X,X,X,X,X,X,X,X,X,X\nX,_,_,_,V,B,_,L,2,_,X\nX,_,_,_,2,_,L,_,2,L,X\nX,A,_,2,L,L,_,_,#,_,X\nX,_,_,L,_,L,_,_,_,_,X\nX,_,V,L,L,L,L,1,L,_,X\nX,_,_,L,_,L,_,L,_,_,X\nX,C,P,L,L,L,L,L,L,_,X\nX,_,L,L,_,L,_,L,L,_,X\nX,_,_,_,_,_,_,_,_,_,X\nX,X,X,X,X,X,X,X,X,X,X\n"
    @bot.update_map(message)
    @bot.remove_bombs_elements(1)
    @bot.assess_near_elements(1)
    out= @bot.move()
    assert_equal(out,"O")
    map_out=@bot.print_map(@bot.get_map_elements(),true,false,false)

    puts "\nLetter: " + @bot.get_letter()
    puts "Position: #{@bot.get_x()},#{@bot.get_y()}"
    puts message +"\n"
    puts map_out +"\n"
    puts "Move: #{out}\n"
  end

  def test_assess_near_when_stratey_pasive_only_blocks_between_spaces
    print "\nTest_assess_near_when_stratey_pasive_only_blocks_between_spaces\n"
    message = "X,X,X,X,X,X,X,X,X,X,X\nX,_,_,L,_,B,_,L,2,_,X\nX,_,_,_,2,_,L,_,2,L,X\nX,A,_,2,L,L,_,_,#,_,X\nX,_,_,L,_,L,_,_,_,_,X\nX,_,V,L,L,L,L,1,L,_,X\nX,_,_,L,_,L,_,L,_,_,X\nX,C,P,L,L,L,L,L,L,_,X\nX,_,L,L,_,L,_,L,L,_,X\nX,_,_,_,_,_,_,_,_,_,X\nX,X,X,X,X,X,X,X,X,X,X\n"
    @bot.update_map(message)
    @bot.remove_bombs_elements(1)
    @bot.assess_near_elements(1)
    out= @bot.move()
    assert_equal(out,"BO")
    map_out=@bot.print_map(@bot.get_map_elements(),true,false,false)

    puts "\nLetter: " + @bot.get_letter()
    puts "Position: #{@bot.get_x()},#{@bot.get_y()}"
    puts message +"\n"
    puts map_out +"\n"
    puts "Move: #{out}\n"
  end

  def test_assess_near_when_stratey_pasive_one_block_without_space
    print "\nTest_assess_near_when_stratey_pasive_one_block_without_spaces\n"
    message = "X,X,X,X,X,X,X,X,X,X,X\nX,_,_,L,A,B,_,_,2,_,X\nX,_,_,_,2,_,L,_,2,L,X\nX,A,_,2,L,_,_,_,#,_,X\nX,_,_,L,_,L,_,_,_,_,X\nX,_,V,L,L,L,L,1,L,_,X\nX,_,_,L,_,L,_,L,_,_,X\nX,C,P,L,L,L,L,L,L,_,X\nX,_,L,L,_,L,_,L,L,_,X\nX,_,_,_,_,_,_,_,_,_,X\nX,X,X,X,X,X,X,X,X,X,X\n"
    @bot.update_map(message)
    @bot.remove_bombs_elements(1)
    @bot.assess_near_elements(1)
    out= @bot.move()
    assert_equal(out,"BO")
    map_out=@bot.print_map(@bot.get_map_elements(),true,false,false)

    puts "\nLetter: " + @bot.get_letter()
    puts "Position: #{@bot.get_x()},#{@bot.get_y()}"
    puts message +"\n"
    puts map_out +"\n"
    puts "Move: #{out}\n"
  end

  def test_assess_near_when_stratey_active_one_enemy_south
    print "\nTest_assess_near_when_stratey_active_one_enemy_south\n"
    message = "X,X,X,X,X,X,X,X,X,X,X\nX,_,_,_,_,B,_,_,2,_,X\nX,_,_,_,2,_,L,_,2,L,X\nX,A,_,2,L,A,_,_,#,_,X\nX,_,_,L,_,L,_,_,_,_,X\nX,_,V,L,L,L,L,1,L,_,X\nX,_,_,L,_,L,_,L,_,_,X\nX,C,P,L,L,L,L,L,L,_,X\nX,_,L,L,_,L,_,L,L,_,X\nX,_,_,_,_,_,_,_,_,_,X\nX,X,X,X,X,X,X,X,X,X,X\n"
    @bot.update_map(message)
    @bot.remove_bombs_elements(1)
    @bot.assess_near_elements(2)
    out= @bot.move()
    assert_equal(out,"BS")
    map_out=@bot.print_map(@bot.get_map_elements(),true,false,false)

    puts "\nLetter: " + @bot.get_letter()
    puts "Position: #{@bot.get_x()},#{@bot.get_y()}"
    puts message +"\n"
    puts map_out +"\n"
    puts "Move: #{out}\n"
  end

  def test_assess_near_when_stratey_active_one_enemy_Este_one_power_Oeste
    print "\nTest_assess_near_when_stratey_activeone_enemy_Este_one_power_Oeste\n"
    message = "X,X,X,X,X,X,X,X,X,X,X\nX,_,_,_,P,B,_,D,2,_,X\nX,_,_,_,2,_,L,_,2,L,X\nX,A,_,2,L,_,_,_,#,_,X\nX,_,_,L,_,L,_,_,_,_,X\nX,_,V,L,L,L,L,1,L,_,X\nX,_,_,L,_,L,_,L,_,_,X\nX,C,P,L,L,L,L,L,L,_,X\nX,_,L,L,_,L,_,L,L,_,X\nX,_,_,_,_,_,_,_,_,_,X\nX,X,X,X,X,X,X,X,X,X,X\n"
    @bot.update_map(message)
    @bot.remove_bombs_elements(1)
    @bot.assess_near_elements(2)
    out= @bot.move()
    assert_equal(out,"BE")
    map_out=@bot.print_map(@bot.get_map_elements(),true,false,false)

    puts "\nLetter: " + @bot.get_letter()
    puts "Position: #{@bot.get_x()},#{@bot.get_y()}"
    puts message +"\n"
    puts map_out +"\n"
    puts "Move: #{out}\n"
  end

  def test_assess_near_when_stratey_active_one_enemy_Este_one_power_Oeste_without_scape_position
    print "\nTest_assess_near_when_stratey_active_one_enemy_Este_one_power_Oeste_without_scape_position\n"
    message = "X,X,X,X,X,X,X,X,X,X,X\nX,_,_,_,L,B,_,D,2,_,X\nX,_,_,_,2,L,L,_,2,L,X\nX,A,_,2,L,_,_,_,#,_,X\nX,_,_,L,_,L,_,_,_,_,X\nX,_,V,L,L,L,L,1,L,_,X\nX,_,_,L,_,L,_,L,_,_,X\nX,C,P,L,L,L,L,L,L,_,X\nX,_,L,L,_,L,_,L,L,_,X\nX,_,_,_,_,_,_,_,_,_,X\nX,X,X,X,X,X,X,X,X,X,X\n"
    @bot.update_map(message)
    @bot.remove_bombs_elements(1)
    @bot.assess_near_elements(2)
    out= @bot.move()
    assert_equal(out,"O")
    map_out=@bot.print_map(@bot.get_map_elements(),true,true,false)

    puts "\nLetter: " + @bot.get_letter()
    puts "Position: #{@bot.get_x()},#{@bot.get_y()}"
    puts message +"\n"
    puts map_out +"\n"
    puts "Move: #{out}\n"
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