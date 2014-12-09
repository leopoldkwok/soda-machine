class Coins

	attr_accessor :one_pence, :two_pence, :five_pence, :ten_pence, :twenty_pence, :fifty_pence, :one_pound, :two_pounds

	def initialize(one_pence, two_pence, five_pence, ten_pence, twenty_pence, fifty_pence, one_pound, two_pounds)
			@one_pence		= one_pence
			@two_pence 		= two_pence
			@five_pence 	= five_pence
			@ten_pence 		= ten_pence
			@twenty_pence 	= twenty_pence
			@fifty_pence 	= fifty_pence
			@one_pound 		= one_pound
			@two_pounds 	= two_pounds
			# @total 			= total
		end

	def values
		{"1p" => 1, "2p" => 2, "5p" => 5, "10p" => 10, "20p" => 20, "50p" => 50, "£1" => 100, "£2" => 200}
	end

	
end
