require 'test/unit'
require '../bin/bot'

class Test_Map < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @bot = Bot.new("B")
  end

  def test_identify_new_bombs_two_new_bombs
    print "\ntest_identify_new_bombs_one_new_bombs\n"
#    first_message = "X,X,X,X,X,X,X,X,X,X,X\nX,_,B,_,_,D,_,_,_,_,X\nX,_,_,_,_,_,_,_,_,_,X\nX,A,_,1,L,L,_,_,#,_,X\nX,_,_,L,_,L,_,_,_,_,X\nX,_,V,L,L,L,L,1,L,_,X\nX,_,_,L,_,L,_,L,_,_,X\nX,C,P,L,L,L,L,L,L,_,X\nX,_,L,L,_,L,_,L,L,_,X\nX,_,_,_,_,_,_,_,_,_,X\nX,X,X,X,X,X,X,X,X,X,X\n"
    second_message = "X,X,X,X,X,X,X,X,X,X,X\nX,_,B,_,_,D,2,_,_,_,X\nX,_,_,_,_,_,_,_,_,_,X\nX,A,2,_,L,L,_,_,#,_,X\nX,_,_,L,_,L,_,_,_,_,X\nX,_,V,L,L,L,L,1,L,_,X\nX,_,_,L,_,L,_,L,_,_,X\nX,_,_,L,L,L,L,L,L,_,X\nX,_,L,L,_,L,_,L,L,_,X\nX,_,_,_,_,_,_,_,_,_,X\nX,X,X,X,X,X,X,X,X,X,X\n"
#    @bot.update_map(first_message)
#    @bot.update_last_map()
     @bot.update_map(second_message)
    @bot.identify_new_bombs()
    out_map=@bot.print_map(@bot.get_map_elements(),true,true,false)
    out=@bot.get_map_elements().select{|element|element.get_x()==6&&element.get_y()==1}[0].get_created_by()
    assert_equal(out,"D")

    puts "\nLetter: " + @bot.get_letter()
    puts "Position: #{@bot.get_x()},#{@bot.get_y()}"
#    puts first_message +"\n"
    puts second_message +"\n"
    print "created by: ",out ,"\n"

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