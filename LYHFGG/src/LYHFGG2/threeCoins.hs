import System.Random as R


threeCoins :: StdGen -> (Bool, Bool, Bool)
threeCoins gen = 
		let 
			(firstCoin, newGen) = R.random gen
			(secondCoin, newGen') = R.random newGen
			(thirdCoin, _) = R.random newGen'
		in  (firstCoin,secondCoin,thirdCoin)