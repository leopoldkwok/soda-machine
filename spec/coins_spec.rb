require 'coins'

describe Coins do 
	#quantity of coins in the soda machine
	let(:coins) {Coins.new 2, 2, 2, 2, 2, 2, 2, 2}

	it 'quantities' do 
		expect(coins.one_pence).to eq 2
		expect(coins.two_pence).to eq 2
		expect(coins.five_pence).to eq 2
		expect(coins.ten_pence).to eq 2
		expect(coins.twenty_pence).to eq 2
		expect(coins.fifty_pence).to eq 2
		expect(coins.one_pound).to eq 2
		expect(coins.two_pounds).to eq 2
	end

	it 'have values' do 
		expect(coins.values["1p"]).to eq 1
		expect(coins.values["2p"]).to eq 2
		expect(coins.values["5p"]).to eq 5
		expect(coins.values["10p"]).to eq 10
		expect(coins.values["20p"]).to eq 20
		expect(coins.values["50p"]).to eq 50
		expect(coins.values["£1"]).to eq 100
	end

	it 'can calculate total amount' do 
		expect(coins.total).to eq 776
	end

	it 'can calculate the change' do
		expect(coins.change(1)).to eq [1]
		expect(coins.change(11)).to eq [10,1]
		expect(coins.change(12)).to eq [10,2]
		expect(coins.change(150)).to eq [100,50]
	end

	it 'when the soda machine receives payment the quantity of its cash increases' do 
		coins.receive("1p")
		expect(coins.one_pence).to eq 3
	end



end