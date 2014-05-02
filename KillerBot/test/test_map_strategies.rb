require 'test/unit'
require '../bin/bot'

class Test_Map < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @bot = Bot.new("B")
  end

  def test_escape_bombs
    print "\ntest_escape_bombs\n"
    message = "X,X,X,X,X,X,X,X,X,X,X\nX,_,B,_,1,D,_,_,_,_,X\nX,_,_,_,_,_,_,_,2,_,X\nX,A,_,2,L,L,_,_,#,_,X\nX,_,_,L,_,L,_,_,_,_,X\nX,_,V,L,L,L,L,1,L,_,X\nX,_,_,L,_,L,_,L,_,_,X\nX,C,P,L,L,L,L,L,L,_,X\nX,_,L,L,_,L,_,L,L,_,X\nX,_,_,_,_,_,_,_,_,_,X\nX,X,X,X,X,X,X,X,X,X,X\n"
    @bot.update_map(message)
    @bot.remove_bombs_elements(1)
    @bot.escape_boms(@bot.get_x(),@bot.get_y())
    out=@bot.print_map(@bot.get_map_elements(),true,true,false)
    puts "\nLetter: " + @bot.get_letter()
    puts "Position: #{@bot.get_x()},#{@bot.get_y()}"
    puts message +"\n"
    puts out +"\n"
  end

  def test_search_neighbors
    print "\ntest_search_neighbors\n"
    message = "X,X,X,X,X,X,X,X,X,X,X\nX,_,B,1,_,1,_,_,_,_,X\nX,_,_,_,2,D,L,_,2,_,X\nX,A,_,2,L,L,_,_,#,_,X\nX,_,_,L,_,L,_,_,_,_,X\nX,_,V,L,L,L,L,1,L,_,X\nX,_,_,L,_,L,_,L,_,_,X\nX,C,P,L,L,L,L,L,L,_,X\nX,_,L,L,_,L,_,L,L,_,X\nX,_,_,_,_,_,_,_,_,_,X\nX,X,X,X,X,X,X,X,X,X,X\n"
    message_out="
?,?,?,?,?,?,?,?,?,
?,?,?,?,D,?,?,?,?,
?,?,?,L,?,_,?,?,?,
?,?,?,?,L,?,?,?,?,
?,?,?,?,?,?,?,?,?,
?,?,?,?,?,?,?,?,?,
?,?,?,?,?,?,?,?,?,
?,?,?,?,?,?,?,?,?,
?,?,?,?,?,?,?,?,?,\n\n"
    @bot.update_map(message)
    map_neighbors=@bot.neighbors(@bot.get_map_elements(),5,3)
    out=@bot.print_map(map_neighbors,true,false,false)
    assert_equal("\n"+out,message_out)
    puts "\nLetter: " + @bot.get_letter()
    puts "Position: #{@bot.get_x()},#{@bot.get_y()}"
    puts message +"\n"
    print out
#    puts out +"\n"
  end

  def test_search_neighbors_distance2
    print "\ntest_search_neighbors_diatnce2\n"
    message = "X,X,X,X,X,X,X,X,X,X,X\nX,_,B,1,_,1,_,_,_,_,X\nX,_,_,_,2,D,L,_,2,_,X\nX,A,_,2,L,L,_,_,#,_,X\nX,_,_,L,_,L,_,_,_,_,X\nX,_,V,L,L,L,L,1,L,_,X\nX,_,_,L,_,L,_,L,_,_,X\nX,C,P,L,L,L,L,L,L,_,X\nX,_,L,L,_,L,_,L,L,_,X\nX,_,_,_,_,_,_,_,_,_,X\nX,X,X,X,X,X,X,X,X,X,X\n"
    message_out="
?,?,?,?,1,?,?,?,?,
?,?,?,?,?,?,?,?,?,
?,?,2,?,?,?,_,?,?,
?,?,?,?,?,?,?,?,?,
?,?,?,?,L,?,?,?,?,
?,?,?,?,?,?,?,?,?,
?,?,?,?,?,?,?,?,?,
?,?,?,?,?,?,?,?,?,
?,?,?,?,?,?,?,?,?,\n\n"
    @bot.update_map(message)
    map_neighbors=@bot.neighbors(@bot.get_map_elements(),5,3,2)
    out=@bot.print_map(map_neighbors,true,false,false)
    assert_equal("\n"+out,message_out)
    puts "\nLetter: " + @bot.get_letter()
    puts "Position: #{@bot.get_x()},#{@bot.get_y()}"
    puts message +"\n"
    print out
#    puts out +"\n"
  end

  def test_neighbors_board_limits
    print "\ntest_neighbors_board_limits\n"
    message = "X,X,X,X,X,X,X,X,X,X,X\nX,_,_,1,_,1,_,_,2,B,X\nX,_,_,_,2,D,L,_,2,L,X\nX,A,_,2,L,L,_,_,#,_,X\nX,_,_,L,_,L,_,_,_,_,X\nX,_,V,L,L,L,L,1,L,_,X\nX,_,_,L,_,L,_,L,_,_,X\nX,C,P,L,L,L,L,L,L,_,X\nX,_,L,L,_,L,_,L,L,_,X\nX,_,_,_,_,_,_,_,_,_,X\nX,X,X,X,X,X,X,X,X,X,X\n"
    message_out="
?,?,?,?,?,?,?,2,?,
?,?,?,?,?,?,?,?,L,
?,?,?,?,?,?,?,?,?,
?,?,?,?,?,?,?,?,?,
?,?,?,?,?,?,?,?,?,
?,?,?,?,?,?,?,?,?,
?,?,?,?,?,?,?,?,?,
?,?,?,?,?,?,?,?,?,
?,?,?,?,?,?,?,?,?,\n\n"
    @bot.update_map(message)
    map_neighbors=@bot.neighbors(@bot.get_map_elements(),9,1)
    out=@bot.print_map(map_neighbors,true,false,false)
    assert_equal("\n"+out,message_out)
    puts "\nLetter: " + @bot.get_letter()
    puts "Position: #{@bot.get_x()},#{@bot.get_y()}"
    puts message +"\n"
    print out
#    puts out +"\n"
  end

  def test_assesss_risk_YES_Case
    print "\ntest_assesss_risk_YES_Case\n"
    message = "X,X,X,X,X,X,X,X,X,X,X\nX,_,_,B,1,_,_,_,2,_,X\nX,_,_,_,2,D,L,_,2,L,X\nX,A,_,2,L,L,_,_,#,_,X\nX,_,_,L,_,L,_,_,_,_,X\nX,_,V,L,L,L,L,1,L,_,X\nX,_,_,L,_,L,_,L,_,_,X\nX,C,P,L,L,L,L,L,L,_,X\nX,_,L,L,_,L,_,L,L,_,X\nX,_,_,_,_,_,_,_,_,_,X\nX,X,X,X,X,X,X,X,X,X,X\n"
    @bot.update_map(message)
    out=@bot.assess_risk()
    assert_equal(out,1)
    puts "\nLetter: " + @bot.get_letter()
    puts "Position: #{@bot.get_x()},#{@bot.get_y()}"
    puts message +"\n"
    print @bot.print_map(@bot.get_map_elements(),true,false,false)
    print "Risk: ",out
  end

  def test_assesss_risk_NO_Case
    print "\ntest_assesss_risk_NO_Case\n"
    message = "X,X,X,X,X,X,X,X,X,X,X\nX,1,_,B,_,_,1,_,2,_,X\nX,_,_,_,2,D,L,_,2,L,X\nX,A,_,2,L,L,_,_,#,_,X\nX,_,_,L,_,L,_,_,_,_,X\nX,_,V,L,L,L,L,1,L,_,X\nX,_,_,L,_,L,_,L,_,_,X\nX,C,P,L,L,L,L,L,L,_,X\nX,_,L,L,_,L,_,L,L,_,X\nX,_,_,_,_,_,_,_,_,_,X\nX,X,X,X,X,X,X,X,X,X,X\n"
    @bot.update_map(message)
    out=@bot.assess_risk()
    assert_equal(out,0)
    puts "\nLetter: " + @bot.get_letter()
    puts "Position: #{@bot.get_x()},#{@bot.get_y()}"
    puts message +"\n"
    print @bot.print_map(@bot.get_map_elements(),true,false,false)
    print "Risk: ",out
  end


  def test_take_decision_Case_Escape
    print "\ntest_Take_Decision_Case_Escape\n"
    message = "X,X,X,X,X,X,X,X,X,X,X\nX,_,_,B,1,_,_,_,2,_,X\nX,_,_,_,2,D,L,_,2,L,X\nX,A,_,2,L,L,_,_,#,_,X\nX,_,_,L,_,L,_,_,_,_,X\nX,_,V,L,L,L,L,1,L,_,X\nX,_,_,L,_,L,_,L,_,_,X\nX,C,P,L,L,L,L,L,L,_,X\nX,_,L,L,_,L,_,L,L,_,X\nX,_,_,_,_,_,_,_,_,_,X\nX,X,X,X,X,X,X,X,X,X,X\n"
    @bot.update_map(message)
    out=@bot.take_decision()
    assert_equal(out,0)
    puts "\nLetter: " + @bot.get_letter()
    puts "Position: #{@bot.get_x()},#{@bot.get_y()}"
    puts message +"\n"
    print @bot.print_map(@bot.get_map_elements(),true,false,false)
  #  print "Strategy: ",out
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