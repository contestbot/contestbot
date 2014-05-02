require 'test/unit'
require '../bin/bot'

class Test_Map < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @bot = Bot.new("B")
  end

  def test_update_last_powers_take_one_P
    print "\ntest_update_last_powers_take_one_P\n"
    first_message = "X,X,X,X,X,X,X,X,X,X,X\nX,P,B,_,_,D,_,_,#,_,X\nX,_,_,_,X,_,X,#,#,#,X\nX,A,_,2,L,L,_,_,#,_,X\nX,_,X,L,X,L,X,_,X,_,X\nX,_,V,L,L,L,L,_,L,_,X\nX,_,X,L,X,L,X,L,X,_,X\nX,C,P,L,L,L,L,L,L,_,X\nX,_,L,L,X,L,X,L,L,_,X\nX,_,_,_,1,_,_,_,_,_,X\nX,X,X,X,X,X,X,X,X,X,X\n"
    second_message = "X,X,X,X,X,X,X,X,X,X,X\nX,B,_,_,_,D,_,_,_,_,X\nX,_,_,_,_,_,_,_,2,_,X\nX,A,_,1,L,L,_,_,#,_,X\nX,_,_,L,_,L,_,_,_,_,X\nX,_,V,L,L,L,L,1,L,_,X\nX,_,_,L,_,L,_,L,_,_,X\nX,C,P,L,L,L,L,L,L,_,X\nX,_,L,L,_,L,_,L,L,_,X\nX,_,_,_,_,_,_,_,_,_,X\nX,X,X,X,X,X,X,X,X,X,X\n"
    third_message = "X,X,X,X,X,X,X,X,X,X,X\nX,_,B,_,_,D,_,_,_,_,X\nX,_,_,_,_,_,_,_,2,_,X\nX,A,_,1,L,L,_,_,#,_,X\nX,_,_,L,_,L,_,_,_,_,X\nX,_,V,L,L,L,L,1,L,_,X\nX,_,_,L,_,L,_,L,_,_,X\nX,C,P,L,L,L,L,L,L,_,X\nX,_,L,L,_,L,_,L,L,_,X\nX,_,_,_,_,_,_,_,_,_,X\nX,X,X,X,X,X,X,X,X,X,X\n"
    @bot.update_map(first_message)
    first_out=@bot.print_map(@bot.get_map_elements,true,true,false)
    @bot.update_last_map()
    @bot.update_map(second_message)
    second_out=@bot.print_map(@bot.get_map_elements,true,false,false)
    second_element=@bot.get_map_elements.select{|element|element.get_value()=="B"}
    @bot.update_last_map()
    @bot.update_map(third_message)
    third_out=@bot.print_map(@bot.get_map_elements,true,true,false)
    third_element=@bot.get_map_elements.select{|element|element.get_value()=="B"}
    assert_equal(second_element[0].get_powerp,2)
    assert_equal(third_element[0].get_powerp,2)
    puts "\nLetter: " + @bot.get_letter()
    puts "First Map:\n"
    puts "Position: #{@bot.get_x()},#{@bot.get_y()}"
    puts first_message +"\n"
    puts "Second Map:\n"
    puts "Position: #{@bot.get_x()},#{@bot.get_y()}"
    puts second_message +"\n"
    print "Power Enemy: ",second_element[0].get_value() +"\n"
    puts "Third Map:\n"
    puts "Position: #{@bot.get_x()},#{@bot.get_y()}"
    puts third_message +"\n"
    print "Power Enemy: ",third_element[0].get_value() +"\n"
  end

  def test_update_last_powers_take_one_V
    print "\ntest_update_last_powers_take_one_V\n"
    first_message = "X,X,X,X,X,X,X,X,X,X,X\nX,_,B,V,_,D,_,_,#,_,X\nX,_,_,_,X,_,X,#,#,#,X\nX,A,_,2,L,L,_,_,#,_,X\nX,_,X,L,X,L,X,_,X,_,X\nX,_,V,L,L,L,L,_,L,_,X\nX,_,X,L,X,L,X,L,X,_,X\nX,C,P,L,L,L,L,L,L,_,X\nX,_,L,L,X,L,X,L,L,_,X\nX,_,_,_,1,_,_,_,_,_,X\nX,X,X,X,X,X,X,X,X,X,X\n"
    second_message = "X,X,X,X,X,X,X,X,X,X,X\nX,_,_,B,_,D,_,_,_,_,X\nX,_,_,_,_,_,_,_,2,_,X\nX,A,_,1,L,L,_,_,#,_,X\nX,_,_,L,_,L,_,_,_,_,X\nX,_,V,L,L,L,L,1,L,_,X\nX,_,_,L,_,L,_,L,_,_,X\nX,C,P,L,L,L,L,L,L,_,X\nX,_,L,L,_,L,_,L,L,_,X\nX,_,_,_,_,_,_,_,_,_,X\nX,X,X,X,X,X,X,X,X,X,X\n"
    third_message = "X,X,X,X,X,X,X,X,X,X,X\nX,_,B,_,_,D,_,_,_,_,X\nX,_,_,_,_,_,_,_,2,_,X\nX,A,_,1,L,L,_,_,#,_,X\nX,_,_,L,_,L,_,_,_,_,X\nX,_,V,L,L,L,L,1,L,_,X\nX,_,_,L,_,L,_,L,_,_,X\nX,C,P,L,L,L,L,L,L,_,X\nX,_,L,L,_,L,_,L,L,_,X\nX,_,_,_,_,_,_,_,_,_,X\nX,X,X,X,X,X,X,X,X,X,X\n"
    @bot.update_map(first_message)
    first_out=@bot.print_map(@bot.get_map_elements,true,true,false)
    @bot.update_last_map()
    @bot.update_map(second_message)
    second_out=@bot.print_map(@bot.get_map_elements,true,false,false)
    second_element=@bot.get_map_elements.select{|element|element.get_value()=="B"}
    @bot.update_last_map()
    @bot.update_map(third_message)
    third_out=@bot.print_map(@bot.get_map_elements,true,true,false)
    third_element=@bot.get_map_elements.select{|element|element.get_value()=="B"}
    assert_equal(second_element[0].get_powerv,2)
    assert_equal(third_element[0].get_powerv,2)
    puts "\nLetter: " + @bot.get_letter()
    puts "First Map:\n"
    puts "Position: #{@bot.get_x()},#{@bot.get_y()}"
    puts first_message +"\n"
    puts "Second Map:\n"
    puts "Position: #{@bot.get_x()},#{@bot.get_y()}"
    puts second_message +"\n"
    print "Power Enemy: ",second_element[0].get_value() +"\n"
    puts "Third Map:\n"
    puts "Position: #{@bot.get_x()},#{@bot.get_y()}"
    puts third_message +"\n"
    print "Power Enemy: ",third_element[0].get_value() +"\n"
  end

  def test_update_last_powers_take_two_V
    print "\ntest_update_last_powers_take_two_V\n"
    first_message = "X,X,X,X,X,X,X,X,X,X,X\nX,_,B,V,_,D,_,_,#,_,X\nX,_,_,_,X,_,X,#,#,#,X\nX,A,_,2,L,L,_,_,#,_,X\nX,_,X,L,X,L,X,_,X,_,X\nX,_,V,L,L,L,L,_,L,_,X\nX,_,X,L,X,L,X,L,X,_,X\nX,C,P,L,L,L,L,L,L,_,X\nX,_,L,L,X,L,X,L,L,_,X\nX,_,_,_,1,_,_,_,_,_,X\nX,X,X,X,X,X,X,X,X,X,X\n"
    second_message = "X,X,X,X,X,X,X,X,X,X,X\nX,_,_,B,V,D,_,_,_,_,X\nX,_,_,_,_,_,_,_,2,_,X\nX,A,_,1,L,L,_,_,#,_,X\nX,_,_,L,_,L,_,_,_,_,X\nX,_,V,L,L,L,L,1,L,_,X\nX,_,_,L,_,L,_,L,_,_,X\nX,C,P,L,L,L,L,L,L,_,X\nX,_,L,L,_,L,_,L,L,_,X\nX,_,_,_,_,_,_,_,_,_,X\nX,X,X,X,X,X,X,X,X,X,X\n"
    third_message = "X,X,X,X,X,X,X,X,X,X,X\nX,_,_,_,B,D,_,_,_,_,X\nX,_,_,_,_,_,_,_,2,_,X\nX,A,_,1,L,L,_,_,#,_,X\nX,_,_,L,_,L,_,_,_,_,X\nX,_,V,L,L,L,L,1,L,_,X\nX,_,_,L,_,L,_,L,_,_,X\nX,C,P,L,L,L,L,L,L,_,X\nX,_,L,L,_,L,_,L,L,_,X\nX,_,_,_,_,_,_,_,_,_,X\nX,X,X,X,X,X,X,X,X,X,X\n"
    fourth_message = "X,X,X,X,X,X,X,X,X,X,X\nX,_,_,B,_,D,_,_,_,_,X\nX,_,_,_,_,_,_,_,2,_,X\nX,A,_,1,L,L,_,_,#,_,X\nX,_,_,L,_,L,_,_,_,_,X\nX,_,V,L,L,L,L,1,L,_,X\nX,_,_,L,_,L,_,L,_,_,X\nX,C,P,L,L,L,L,L,L,_,X\nX,_,L,L,_,L,_,L,L,_,X\nX,_,_,_,_,_,_,_,_,_,X\nX,X,X,X,X,X,X,X,X,X,X\n"
    @bot.update_map(first_message)
    first_out=@bot.print_map(@bot.get_map_elements,true,true,false)
    @bot.update_last_map()
    @bot.update_map(second_message)
    second_out=@bot.print_map(@bot.get_map_elements,true,false,false)
    second_element=@bot.get_map_elements.select{|element|element.get_value()=="B"}
    @bot.update_last_map()
    @bot.update_map(third_message)
    third_out=@bot.print_map(@bot.get_map_elements,true,true,false)
    third_element=@bot.get_map_elements.select{|element|element.get_value()=="B"}
    @bot.update_last_map()
    @bot.update_map(fourth_message)
    fourth_out=@bot.print_map(@bot.get_map_elements,true,true,false)
    fourth_element=@bot.get_map_elements.select{|element|element.get_value()=="B"}
    assert_equal(second_element[0].get_powerv,2)
    assert_equal(third_element[0].get_powerv,3)
    assert_equal(fourth_element[0].get_powerv,3)
    puts "\nLetter: " + @bot.get_letter()
    puts "First Map:\n"
    puts "Position: #{@bot.get_x()},#{@bot.get_y()}"
    puts first_message +"\n"
    puts "Second Map:\n"
    puts "Position: #{@bot.get_x()},#{@bot.get_y()}"
    puts second_message +"\n"
    print "Power Enemy: ",second_element[0].get_value() +"\n"
    puts "Third Map:\n"
    puts "Position: #{@bot.get_x()},#{@bot.get_y()}"
    puts third_message +"\n"
    print "Power Enemy: ",third_element[0].get_value() +"\n"
  end

  def test_update_last_powers_take_two_P
    print "\ntest_update_last_powers_take_two_p\n"
    first_message = "X,X,X,X,X,X,X,X,X,X,X\nX,_,B,P,_,D,_,_,#,_,X\nX,_,_,_,X,_,X,#,#,#,X\nX,A,_,2,L,L,_,_,#,_,X\nX,_,X,L,X,L,X,_,X,_,X\nX,_,V,L,L,L,L,_,L,_,X\nX,_,X,L,X,L,X,L,X,_,X\nX,C,P,L,L,L,L,L,L,_,X\nX,_,L,L,X,L,X,L,L,_,X\nX,_,_,_,1,_,_,_,_,_,X\nX,X,X,X,X,X,X,X,X,X,X\n"
    second_message = "X,X,X,X,X,X,X,X,X,X,X\nX,_,_,B,P,D,_,_,_,_,X\nX,_,_,_,_,_,_,_,2,_,X\nX,A,_,1,L,L,_,_,#,_,X\nX,_,_,L,_,L,_,_,_,_,X\nX,_,V,L,L,L,L,1,L,_,X\nX,_,_,L,_,L,_,L,_,_,X\nX,C,P,L,L,L,L,L,L,_,X\nX,_,L,L,_,L,_,L,L,_,X\nX,_,_,_,_,_,_,_,_,_,X\nX,X,X,X,X,X,X,X,X,X,X\n"
    third_message = "X,X,X,X,X,X,X,X,X,X,X\nX,_,_,_,B,D,_,_,_,_,X\nX,_,_,_,_,_,_,_,2,_,X\nX,A,_,1,L,L,_,_,#,_,X\nX,_,_,L,_,L,_,_,_,_,X\nX,_,V,L,L,L,L,1,L,_,X\nX,_,_,L,_,L,_,L,_,_,X\nX,C,P,L,L,L,L,L,L,_,X\nX,_,L,L,_,L,_,L,L,_,X\nX,_,_,_,_,_,_,_,_,_,X\nX,X,X,X,X,X,X,X,X,X,X\n"
    fourth_message = "X,X,X,X,X,X,X,X,X,X,X\nX,_,_,B,_,D,_,_,_,_,X\nX,_,_,_,_,_,_,_,2,_,X\nX,A,_,1,L,L,_,_,#,_,X\nX,_,_,L,_,L,_,_,_,_,X\nX,_,V,L,L,L,L,1,L,_,X\nX,_,_,L,_,L,_,L,_,_,X\nX,C,P,L,L,L,L,L,L,_,X\nX,_,L,L,_,L,_,L,L,_,X\nX,_,_,_,_,_,_,_,_,_,X\nX,X,X,X,X,X,X,X,X,X,X\n"
    @bot.update_map(first_message)
    first_out=@bot.print_map(@bot.get_map_elements,true,true,false)
    @bot.update_last_map()
    @bot.update_map(second_message)
    second_out=@bot.print_map(@bot.get_map_elements,true,false,false)
    second_element=@bot.get_map_elements.select{|element|element.get_value()=="B"}
    @bot.update_last_map()
    @bot.update_map(third_message)
    third_out=@bot.print_map(@bot.get_map_elements,true,true,false)
    third_element=@bot.get_map_elements.select{|element|element.get_value()=="B"}
    @bot.update_last_map()
    @bot.update_map(fourth_message)
    fourth_out=@bot.print_map(@bot.get_map_elements,true,true,false)
    fourth_element=@bot.get_map_elements.select{|element|element.get_value()=="B"}
    assert_equal(second_element[0].get_powerp,2)
    assert_equal(third_element[0].get_powerp,3)
    assert_equal(fourth_element[0].get_powerp,3)
    puts "\nLetter: " + @bot.get_letter()
    puts "First Map:\n"
    puts "Position: #{@bot.get_x()},#{@bot.get_y()}"
    puts first_message +"\n"
    puts "Second Map:\n"
    puts "Position: #{@bot.get_x()},#{@bot.get_y()}"
    puts second_message +"\n"
    print "Power Enemy: ",second_element[0].get_value() +"\n"
    puts "Third Map:\n"
    puts "Position: #{@bot.get_x()},#{@bot.get_y()}"
    puts third_message +"\n"
    print "Power Enemy: ",third_element[0].get_value() +"\n"
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