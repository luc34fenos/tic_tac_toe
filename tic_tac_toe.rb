
require "pry"

class Boardcase
	attr_reader :i
	attr_accessor :var

	def initialize(i, var = 0)
		@i = i
		@var = var
	end

	def cochee(var)
		return @var = var
	end
end

class Board
	#attr_accessor :partie[1 - 1], :partie[2 - 1], :partie[3 - 1], :partie[4 - 1], :partie[5 - 1], :partie[6 - 1], :partie[7 - 1], :partie[8 - 1], :partie[9 - 1]
	attr_accessor :partie

	def initialize(partie = Hash.new(0))
		@partie = partie
		for i in (1..9) do
			partie["name#{i}"] = Boardcase.new(i)
		end
	end

	def status
		@partie.each{|k, v|
			"#{v.i} => #{v.var}"
		}
	end

	def cochee(i, var)
		@partie["name#{i}"].cochee(var)
	end
end

class Player
	attr_reader :name, :num, :sym

	def initialize(name, num, sym = "")
		@name = name
		@num = num
		@sym = sym
	end

	def victoir()
		return puts "#{@name} a gagnee"
	end
end

class Game
	attr_reader :player1, :player2

	def initialize(player1, player2)
		@player1 = Player.new(player1, 1, "X")
		@player2 = Player.new(player2, 2, "O")
		@board = Board.new
	end

	def status
		puts "#{@player1.name} #{@player2.name} \n #{@board.partie.values}"
	end

	def cochee(i, var)
		if @board.partie["name#{i}"].var == 0
			@board.cochee(i, var)
		end
	end

	def test1()
		#binding pry	

		for i in (1..4)
			if (((@board.partie["name#{i}"].var) == @player1.sym) && ((@board.partie["name#{i+1}"].var) == @player1.sym) && ((@board.partie["name#{i+2}"].var) == @player1.sym)) && (((3*i + 3) == 6) || ((3*i + 3) == 15) || ((3*i + 3) == 24))
				player1.victoir
				return true
			elsif (((@board.partie["name3"].var) == @player1.sym) && ((@board.partie["name5"].var) == @player1.sym) && ((@board.partie["name7"].var) == @player1.sym))
				player1.victoir
				return true
			elsif(((@board.partie["name#{i}"].var) == @player1.sym) && ((@board.partie["name#{i+3}"].var) == @player1.sym) && ((@board.partie["name#{i+6}"].var) == @player1.sym)) && (((3*i + 3) == 12) || ((3*i + 3) == 18) || ((3*i + 3) == 12))
				player1.victoir
				return true
			elsif (((@board.partie["name1"].var) == @player1.sym) && ((@board.partie["name5"].var) == @player1.sym) && ((@board.partie["name9"].var) == @player1.sym))
				player1.victoir
				return true
			elsif (((@board.partie["name7"].var) == @player1.sym) && ((@board.partie["name8"].var) == @player1.sym) && ((@board.partie["name9"].var) == @player1.sym))
				player1.victoir
				return true
			end
		end
	def test2()
		#binding pry	

		for i in (1..4)
			if (((@board.partie["name#{i}"].var) == @player2.sym) && ((@board.partie["name#{i+1}"].var) == @player2.sym) && ((@board.partie["name#{i+2}"].var) == @player2.sym)) && (((3*i + 3) == 6) || ((3*i + 3) == 15) || ((3*i + 3) == 24))
				player2.victoir
				return true
			elsif (((@board.partie["name3"].var) == @player2.sym) && ((@board.partie["name5"].var) == @player2.sym) && ((@board.partie["name7"].var) == @player2.sym))
				player2.victoir
				return true
			elsif(((@board.partie["name#{i}"].var) == @player2.sym) && ((@board.partie["name#{i+3}"].var) == @player2.sym) && ((@board.partie["name#{i+6}"].var) == @player2.sym)) && (((3*i + 3) == 12) || ((3*i + 3) == 18) || ((3*i + 3) == 12))
				player2.victoir
				return true
			elsif (((@board.partie["name1"].var) == @player2.sym) && ((@board.partie["name5"].var) == @player2.sym) && ((@board.partie["name5"].var) == @player2.sym))
				player2.victoir
				return true
			elsif (((@board.partie["name7"].var) == @player2.sym) && ((@board.partie["name8"].var) == @player2.sym) && ((@board.partie["name9"].var) == @player2.sym))
				player2.victoir
				return true
			end
		end
	end
end

i = "y"

	while i != "n"
		print "nom du joueur 1: "
		pl1 = gets.chomp.to_s
		print "no du joueur 2: "
		pl2 = gets.chomp.to_s
		game = Game.new(pl1, pl2)
		k = 0
		while true do
			j = 0
			puts game.status
			print "tour du player 1: "
			j = gets.chomp.to_i
			game.cochee(j, "X")
			puts game.status
			break if game.test1 == true
			print "tour du player 2: "
			j = gets.chomp.to_i
			game.cochee(j, "O")
			puts game.status
			break if game.test2 == true
			k += 1
			break if k == 9
		end
		puts "voulez vous recommencer: (y or n)"
		i = gets.chomp
		i = i[0]
	end
end