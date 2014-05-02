require 'test/unit'
require '../bin/bot'

class Test_Map < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @bot = Bot.new("B")
  end

  def test_update_map
    print "\ntest_update_map\n"
    first_message = "X,X,X,X,X,X,X,X,X,X,X\nX,_,B,C,_,D,_,_,#,_,X\nX,_,_,_,X,_,X,#,#,#,X\nX,A,_,2,L,L,_,_,#,_,X\nX,_,X,L,X,L,X,_,X,_,X\nX,_,V,L,L,L,L,_,L,_,X\nX,_,X,L,X,L,X,L,X,_,X\nX,_,P,L,L,L,L,L,L,_,X\nX,_,L,L,X,L,X,L,L,_,X\nX,_,_,_,1,_,_,_,_,_,X\nX,X,X,X,X,X,X,X,X,X,X\n"
    first_message_out="
_,B,C,_,D,_,_,#,_,
_,_,_,?,_,?,#,#,#,
A,_,2,L,L,_,_,#,_,
_,?,L,?,L,?,_,?,_,
_,V,L,L,L,L,_,L,_,
_,?,L,?,L,?,L,?,_,
_,P,L,L,L,L,L,L,_,
_,L,L,?,L,?,L,L,_,
_,_,_,1,_,_,_,_,_,\n\n"
    @bot.update_map(first_message)
    first_out=@bot.print_map(@bot.get_map_elements,true,false,false)
    print @bot.print_map(@bot.get_map_elements,false,true,false)
    assert_equal("\n"+first_out,first_message_out)
    puts "\nLetter: " + @bot.get_letter()
    puts "First Map:\n"
    puts "Position: #{@bot.get_x()},#{@bot.get_y()}"
    puts first_message +"\n"
    print first_out ,"\n"

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