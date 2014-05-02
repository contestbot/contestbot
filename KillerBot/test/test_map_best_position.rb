require 'test/unit'
require '../bin/bot'

class Test_Map < Test::Unit::TestCase

  def setup
    @bot = Bot.new("B")
  end
  def test_best_position
    print "\ntest_best_position\n"
    message = "X,X,X,X,X,X,X,X,X,X,X\nX,_,B,_,_,D,_,_,_,_,X\nX,_,_,_,_,_,_,_,2,_,X\nX,A,_,1,L,L,_,_,#,_,X\nX,_,_,L,_,L,_,_,_,_,X\nX,_,V,L,L,L,L,1,L,_,X\nX,_,_,L,_,L,_,L,_,_,X\nX,C,P,L,L,L,L,L,L,_,X\nX,_,L,L,_,L,_,L,L,_,X\nX,_,_,_,_,_,_,_,_,_,X\nX,X,X,X,X,X,X,X,X,X,X\n"

    @bot.update_map(message)
    @bot.search_best_position(2,1,3)
    out=@bot.move

    puts out +"\n"
    assert_equal(out,"O")
  #  puts out +"\n"

  end

  def test_best_position_1
    print "\ntest_best_position_1\n"
    message = "X,X,X,X,X,X,X,X,X,X,X\nX,_,B,_,_,D,_,_,_,_,X\nX,_,_,_,_,_,_,_,2,_,X\nX,A,_,1,L,L,_,_,#,_,X\nX,_,_,L,_,L,_,_,_,_,X\nX,_,V,L,L,L,L,1,L,_,X\nX,_,_,L,_,L,_,L,_,_,X\nX,C,P,L,L,L,L,L,L,_,X\nX,_,L,L,_,L,_,L,L,_,X\nX,_,_,_,_,_,_,_,_,_,X\nX,X,X,X,X,X,X,X,X,X,X\n"

    @bot.update_map(message)
    @bot.search_best_position(1,3,2)
    out=@bot.move

    puts out +"\n"
    assert_equal(out,"S")
    #  puts out +"\n"

  end


  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end

  # Fake test

end