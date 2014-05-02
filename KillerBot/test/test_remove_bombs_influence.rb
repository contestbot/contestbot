require 'test/unit'
require '../bin/bot'

class Test_Map < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @bot = Bot.new("B")
  end

  def test_remove_bombs_elements_influence_1
    print "\ntest_remove_bombs_elements_influence_1\n"
    message = "X,X,X,X,X,X,X,X,X,X,X\nX,_,B,_,_,D,_,_,_,_,X\nX,_,_,_,_,_,_,_,2,_,X\nX,A,_,1,L,L,_,_,#,_,X\nX,_,_,L,_,L,_,_,_,_,X\nX,_,V,L,L,L,L,1,L,_,X\nX,_,_,L,_,L,_,L,_,_,X\nX,C,P,L,L,L,L,L,L,_,X\nX,_,L,L,_,L,_,L,L,_,X\nX,_,_,_,_,_,_,_,_,_,X\nX,X,X,X,X,X,X,X,X,X,X\n"
    message_out=   "
_,B,_,_,D,_,_,_,_,
_,_,?,_,_,_,_,2,_,
A,?,?,?,L,_,_,#,_,
_,_,?,_,L,_,?,_,_,
_,V,L,L,L,?,?,?,_,
_,_,L,_,L,_,?,_,_,
C,P,L,L,L,L,L,L,_,
_,L,L,_,L,_,L,L,_,
_,_,_,_,_,_,_,_,_,\n\n"
    @bot.update_map(message)
    @bot.remove_bombs_elements()
    out=@bot.print_map(@bot.get_map_elements(),true,false,false)
    assert_equal("\n"+out,message_out)

    puts "\nLetter: " + @bot.get_letter()
    puts "Position: #{@bot.get_x()},#{@bot.get_y()}"
    puts message +"\n"
    puts out +"\n"

  end

  def test_remove_bombs_elements_influence_2_one_enemy
    print "\ntest_remove_bombs_elements_influence_2_one_enemy\n"
     message_out=   "
_,?,?,?,?,?,_,_,_,
_,_,?,?,_,_,_,2,_,
?,?,?,?,?,_,?,#,_,
_,_,?,_,L,_,?,_,_,
_,V,?,L,?,?,?,?,?,
_,_,L,_,L,_,?,_,_,
C,P,L,L,L,L,?,L,_,
_,L,L,_,L,_,L,L,_,
_,_,_,_,_,_,_,_,_,\n\n"

    first_message = "X,X,X,X,X,X,X,X,X,X,X\nX,_,A,P,_,D,_,_,#,_,X\nX,_,_,_,X,_,X,#,#,#,X\nX,B,_,2,L,L,_,_,#,_,X\nX,_,X,L,X,L,X,_,X,_,X\nX,_,V,L,L,L,L,_,L,_,X\nX,_,X,L,X,L,X,L,X,_,X\nX,C,P,L,L,L,L,L,L,_,X\nX,_,L,L,X,L,X,L,L,_,X\nX,_,_,_,1,_,_,_,_,_,X\nX,X,X,X,X,X,X,X,X,X,X\n"
    second_message = "X,X,X,X,X,X,X,X,X,X,X\nX,_,_,A,_,D,_,_,_,_,X\nX,_,_,_,_,_,_,_,2,_,X\nX,B,_,1,L,L,_,_,#,_,X\nX,_,_,L,_,L,_,_,_,_,X\nX,_,V,L,L,L,L,1,L,_,X\nX,_,_,L,_,L,_,L,_,_,X\nX,C,P,L,L,L,L,L,L,_,X\nX,_,L,L,_,L,_,L,L,_,X\nX,_,_,_,_,_,_,_,_,_,X\nX,X,X,X,X,X,X,X,X,X,X\n"
    third_message = "X,X,X,X,X,X,X,X,X,X,X\nX,_,_,A,2,_,D,_,_,_,X\nX,_,_,_,_,_,_,_,2,_,X\nX,B,_,1,L,L,_,_,#,_,X\nX,_,_,L,_,L,_,_,_,_,X\nX,_,V,L,L,L,L,1,L,_,X\nX,_,_,L,_,L,_,L,_,_,X\nX,C,P,L,L,L,L,L,L,_,X\nX,_,L,L,_,L,_,L,L,_,X\nX,_,_,_,_,_,_,_,_,_,X\nX,X,X,X,X,X,X,X,X,X,X\n"
    fourth_message = "X,X,X,X,X,X,X,X,X,X,X\nX,_,A,_,1,D,_,_,_,_,X\nX,_,_,_,_,_,_,_,2,_,X\nX,B,_,1,L,L,_,_,#,_,X\nX,_,_,L,_,L,_,_,_,_,X\nX,_,V,L,L,L,L,1,L,_,X\nX,_,_,L,_,L,_,L,_,_,X\nX,C,P,L,L,L,L,L,L,_,X\nX,_,L,L,_,L,_,L,L,_,X\nX,_,_,_,_,_,_,_,_,_,X\nX,X,X,X,X,X,X,X,X,X,X\n"
    @bot.update_map(first_message)
    first_out=@bot.print_map(@bot.get_map_elements,true,true,false)
    @bot.update_last_map()
    @bot.update_map(second_message)
    second_out=@bot.print_map(@bot.get_map_elements,true,false,false)
    second_element=@bot.get_map_elements.select{|element|element.get_value()=="A"}
    @bot.update_last_map()
    @bot.update_map(third_message)
    third_out=@bot.print_map(@bot.get_map_elements,true,true,false)
    third_element=@bot.get_map_elements.select{|element|element.get_value()=="A"}
    @bot.update_last_map()
    @bot.update_map(fourth_message)
    fourth_out=@bot.print_map(@bot.get_map_elements,true,true,false)
    fourth_element=@bot.get_map_elements.select{|element|element.get_value()=="A"}
    @bot.remove_bombs_elements()
    out=@bot.print_map(@bot.get_map_elements(),true,false,false)
    print out
    assert_equal("\n"+out,message_out)
    assert_equal(second_element[0].get_powerp,2)
    assert_equal(third_element[0].get_powerp,2)
    assert_equal(fourth_element[0].get_powerp,2)
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