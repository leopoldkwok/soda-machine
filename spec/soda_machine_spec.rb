require 'soda_machine'
require 'product'
require 'coins'

describe Soda_machine do 
	let(:soda_machine) 		{Soda_machine.new}



	context 'When created' do

		it 'contains coins when created' do 
			expect(soda_machine.available_coins).to eq [1, 2, 5, 10, 20, 50, 100, 200]
		end
		
		it 'contains products' do 
			expect(soda_machine.products_names).to eq ["Tango", "Coke", "Pepsi"]
		end

		it 'products have a price' do 
			expect(soda_machine.price("Tango")).to eq 150
		end
	end

	context 'Converting the change' do 
		it 'can convert price to denomination pence' do
			expect(soda_machine.convert(20)).to eq "20p"
		end

		it 'can convert price to denomination £pounds' do 
			expect(soda_machine.convert(100)).to eq "£1"
		end

		it 'can convert denomination p to price' do 
			expect(soda_machine.convert("20p")).to eq 20
		end

		it 'can convert denomination £ to price' do 
			expect(soda_machine.convert("£1")).to eq 100
		end
	end


	context 'Selecting products' do 
		it 'returns a product when selected with no change when the money provided is correct' do 
				expect(soda_machine.buy("Tango", "£1.5")).to eq "Your product:\n Tango"
		end

		it 'returns change if too much money is provided' do 
				expect(soda_machine.buy("Tango", "£2")).to eq "Your product:\n Tango\nChange: 50p"
		end

		it 'add the value to the total coins' do 
			soda_machine.buy("Tango","£1.5")
			expect(soda_machine.coins.fifty_pence).to eq 1
			expect(soda_machine.coins.one_pound).to eq 1
			expect(soda_machine.coins.total).to eq 388

		end
	end

		# it 'requests for more money if it is not enough' do 
		# 	expect(soda_machine.select("KitKat", "£1")).to eq "Please insert another £1"
		# end
	
	context 'Keeping track of products and change' do 

			it 'know when a product is selected and is removed from the vending machine' do 
				soda_machine.buy("Tango", "£1.5")
				expect(soda_machine.remaining("Tango")).to eq 19
			end

			it 'know when a product is selected but is not removed from the vending machine if the money is not enough' do 
				soda_machine.buy("Coke", "£1.5")
				expect(soda_machine.remaining('Coke')).to eq 10
			end

			it 'know when there are no more items of a product' do 
				10.times {soda_machine.buy("Coke", "£2")}
				expect(soda_machine.buy("Coke", "£2")).to eq "There are no more Coke"
			end
	end		

end