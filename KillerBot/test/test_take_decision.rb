require 'test/unit'
require '../bin/bot'

class Test_Map < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @bot = Bot.new("B")
  end

  def test_take_decision_no_nearness_element
    print "\ntest_take_decision_no_nearness_element\n"
    first_message = "X,X,X,X,X,X,X,X,X,X,X\nX,_,B,_,_,_,_,_,#,_,X\nX,_,_,_,X,_,X,#,#,#,X\nX,A,_,_,_,_,_,_,#,_,X\nX,_,X,_,X,_,X,_,X,_,X\nX,_,V,L,L,L,L,_,L,_,X\nX,_,X,L,X,L,X,L,X,P,X\nX,C,P,L,L,L,L,L,L,_,X\nX,_,L,L,X,L,X,L,L,_,X\nX,_,_,_,1,_,_,_,_,_,X\nX,X,X,X,X,X,X,X,X,X,X\n"
    @bot.update_map(first_message)
    @bot.take_decision()
    out=@bot.move()
#    @bot.identify_enemies_moves()
#    print @bot.print_map(@bot.get_map_elements,false,true,false)
=begin
    enemy=@bot.get_map_elements.select{|element|element.get_value()=="D"}
    element = enemy[0].get_enemy_move()
    assert_equal(element,"O")
=end
    puts "\nLetter: " + @bot.get_letter()
    puts "First Map:\n"
    puts "Position: #{@bot.get_x()},#{@bot.get_y()}"
    puts first_message +"\n"
    puts "move:"+ out+"\n"
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