require 'coins'

describe Coins do 
	let(:coins) {Coins.new 5, 5, 5, 5, 5, 5, 2, 2}

	it 'quantities' do 
		expect(coins.one_pence).to eq 5
		expect(coins.two_pence).to eq 5
		expect(coins.five_pence).to eq 5
		expect(coins.ten_pence).to eq 5
		expect(coins.twenty_pence).to eq 5
		expect(coins.fifty_pence).to eq 5
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

end