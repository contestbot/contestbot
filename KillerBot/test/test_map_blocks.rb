require 'test/unit'
require '../bin/bot'

class Test_Map < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @bot = Bot.new("B")
  end

  def test_destroy_block_destroy_block_distance_2
    print "\nTest_Move_destroy_block_distance_2\n"
    message = "X,X,X,X,X,X,X,X,X,X,X\nX,_,_,L,_,B,_,_,2,_,X\nX,_,_,_,2,_,L,_,2,L,X\nX,A,_,2,L,L,_,_,#,_,X\nX,_,_,L,_,L,_,_,_,_,X\nX,_,V,L,L,L,L,1,L,_,X\nX,_,_,L,_,L,_,L,_,_,X\nX,C,P,L,L,L,L,L,L,_,X\nX,_,L,L,_,L,_,L,L,_,X\nX,_,_,_,_,_,_,_,_,_,X\nX,X,X,X,X,X,X,X,X,X,X\n"
    @bot.update_map(message)
    @bot.remove_bombs_elements(1)
    @bot.destroy_blocks()
=begin
    out= @bot.move()
     assert_equal(out,"E")
    map_out=@bot.print_map(@bot.get_map_elements(),true,true,false)
=end
    puts "\nLetter: " + @bot.get_letter()
    puts "Position: #{@bot.get_x()},#{@bot.get_y()}"
    puts message +"\n"
#    puts map_out +"\n"
#    puts "Move: #{out}\n"

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