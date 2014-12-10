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
			@total 			= total
		end

	def values
		{"1p" => 1, "2p" => 2, "5p" => 5, "10p" => 10, "20p" => 20, "50p" => 50, "£1" => 100, "£2" => 200}
	end

	def total
		(@one_pence		* values["1p"])		+ 
		(@two_pence 	* values["2p"])		+	 
		(@five_pence 	* values["5p"]) 	+ 
		(@ten_pence 	* values["10p"])	+
		(@twenty_pence 	* values["20p"])	+
		(@fifty_pence 	* values["50p"]) 	+
		(@one_pound 	* values["£1"]) 	+ 
		(@two_pounds 	* values["£2"])
	end

	def change(amount)
		
		available_coins = values.values.reverse
		coins=[]
		index = 0
		coin = available_coins[index]
		remaining_amount = amount
		until remaining_amount == 0
			until remaining_amount >=coin
				index +=1
				coin = available_coins[index]
			end

			coins << coin
			remaining_amount -= coin
			end
		coins
	end 

	# this quantity of coins increase as the soda machine accepts more coins
	def receive(cash)
		c = convert(cash)
		amount = change(c)
			amount.each do |coin|
				@one_pence 	  += 1 if coin == 1
				@two_pence    += 1 if coin == 2
				@five_pence   += 1 if coin == 5
				@ten_pence    += 1 if coin == 10
				@twenty_pence += 1 if coin == 20
				@fifty_pence  += 1 if coin == 50
				@one_pound    += 1 if coin == 100
				@two_pounds   += 1 if coin == 200
		end
		@total = total
	end

	# converts cash to either pence or pounds

	def convert(cash)
		if cash.class == String
			return cash.to_f if cash.include? "p"
			return (cash.delete("£").to_f)*100 if cash.include? "£"
		end

		if cash.class == Fixnum || cash.class == Float
			return "#{cash.to_i}p" if price < 100
			return "£#{cash.to_i/100}" if cash >= 100
		end

		
	end

end
