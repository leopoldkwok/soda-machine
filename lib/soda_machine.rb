class Soda_machine

	# initilises products and coins in the soda machine

	def initialize
		@tango  = Product.new "Tango",  150.0, 20
		@kitkat = Product.new "Coke", 	200.0, 10
		@pepsi  = Product.new "Pepsi",  100.0, 30
		@coins 	= Coins.new 1, 1, 1, 1, 1, 1, 1, 1
	end

	def coins
		@soda_machine_coins = []
		@coins.one_pence.times {@soda_machine_coins << 1}
		@coins.two_pence.times {@soda_machine_coins << 2}
		@coins.five_pence.times {@soda_machine_coins << 5}
		@coins.ten_pence.times {@soda_machine_coins << 10}
		@coins.twenty_pence.times {@soda_machine_coins << 20}
		@coins.fifty_pence.times {@soda_machine_coins << 50}
		@coins.one_pound.times {@soda_machine_coins << 100}
		@coins.two_pounds.times {@soda_machine_coins << 200}
		@soda_machine_coins
	end


	# def change
	# 	{
	# 		"1p"	=> 10,
	# 		"2p" 	=> 10,
	# 		"5p" 	=> 10,
	# 		"10p" 	=> 10,
	# 		"20p" 	=> 8,
	# 		"50p" 	=> 8,
	# 		"£1" 	=> 5,
	# 		"£2" 	=> 5
	# 	}
	# end

	def products
			[@tango, @kitkat, @pepsi]
	end

	def products_names
			products.map{|p| p.name}
	end

	def select(product)
		products.select{|p|p.name == product}
	end

	def selected(product)
		@selected = select(product)[0]
	end

	def quantity(product)
		quantity = select(product)
		quantity[0].quantity
	end

	def price(product)
		p = select(product)
		p[0].price
	end



	def convert(cash)
		if cash.class == Fixnum || cash.class == Float
			return "#{cash.to_i}p" if cash < 100
			return "£#{cash.to_i/100}" if cash >= 100
		end

		if cash.class == String
			return cash.to_f if cash.include? "p"
			return (cash.delete("£").to_f)*100 if cash.include? "£"
		end
	end

	def buy(product, amount)
		new_price = convert(amount)

		return "There are no more #{selected(product).name}" if remaining(product)==0
		
			if new_price == price(product)
				selected(product).one_less
				return "Your product:\n #{selected(product).name}"
			end

			if new_price > price(product)
				change = convert(new_price - price(product))
				return "Your product:\n #{selected(product).name}\nChange: #{change}"
			end
	end

	def remaining(product)
			selected(product).quantity
	end

	
end