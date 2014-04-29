require 'test/unit'
require '../bin/bot'

class Test_Map < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @bot = Bot.new("B")
  end

  def test_create_elements_map_without_X_inside
    print "\ntest_create_elements_map_without_X_inside\n"
     message = "X,X,X,X,X,X,X,X,X,X,X\nX,_,B,_,_,D,_,_,_,_,X\nX,_,_,_,_,_,_,_,2,_,X\nX,A,_,1,L,L,_,_,#,_,X\nX,_,_,L,_,L,_,_,_,_,X\nX,_,V,L,L,L,L,1,L,_,X\nX,_,_,L,_,L,_,L,_,_,X\nX,C,P,L,L,L,L,L,L,_,X\nX,_,L,L,_,L,_,L,L,_,X\nX,_,_,_,_,_,_,_,_,_,X\nX,X,X,X,X,X,X,X,X,X,X\n"
     message_out="_,B,_,_,D,_,_,_,_,\n_,_,_,_,_,_,_,2,_,\nA,_,1,L,L,_,_,#,_,\n_,_,L,_,L,_,_,_,_,\n_,V,L,L,L,L,1,L,_,\n_,_,L,_,L,_,L,_,_,\nC,P,L,L,L,L,L,L,_,\n_,L,L,_,L,_,L,L,_,\n_,_,_,_,_,_,_,_,_,\n\n"
     @bot.update_map(message)
     out=@bot.print_map(@bot.get_map_elements(),true,false,false)
     assert_equal(out,message_out)

    puts "\nLetter: " + @bot.get_letter()
    puts "Position: #{@bot.get_x()},#{@bot.get_y()}"
    puts message +"\n"
    puts out +"\n"
  end

  def test_create_elements_map_with_X_inside
    print "\ntest_create_elements_map_with_X_inside\n"
    message = "X,X,X,X,X,X,X,X,X,X,X\nX,_,B,C,_,D,_,_,#,_,X\nX,_,_,_,X,_,X,#,#,#,X\nX,A,_,2,L,L,_,_,#,_,X\nX,_,X,L,X,L,X,_,X,_,X\nX,_,V,L,L,L,L,_,L,_,X\nX,_,X,L,X,L,X,L,X,_,X\nX,_,P,L,L,L,L,L,L,_,X\nX,_,L,L,X,L,X,L,L,_,X\nX,_,_,_,1,_,_,_,_,_,X\nX,X,X,X,X,X,X,X,X,X,X\n"
    message_out="
_,B,C,_,D,_,_,#,_,
_,_,_,?,_,?,#,#,#,
A,_,2,L,L,_,_,#,_,
_,?,L,?,L,?,_,?,_,
_,V,L,L,L,L,_,L,_,
_,?,L,?,L,?,L,?,_,
_,P,L,L,L,L,L,L,_,
_,L,L,?,L,?,L,L,_,
_,_,_,1,_,_,_,_,_,\n\n"
    @bot.update_map(message)
    out=@bot.print_map(@bot.get_map_elements(),true,false,false)
    assert_equal("\n"+out,message_out)

    puts "\nLetter: " + @bot.get_letter()
    puts "Position: #{@bot.get_x()},#{@bot.get_y()}"
    puts message +"\n"
    puts out +"\n"
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