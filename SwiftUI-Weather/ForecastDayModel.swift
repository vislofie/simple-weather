struct ForecastDayModel
{
	let time: String
	
	let temperature: Int
	
	let isItRaining: Bool
	let isItSnowing: Bool
	
	init(time: String, temperature: Int, isItRaining: Bool, isItSnowing: Bool)
	{
		self.time = time
		self.temperature = temperature
		self.isItRaining = isItRaining
		self.isItSnowing = isItSnowing
	}
	
	init()
	{
		self.time = ""
		self.temperature = 0
		self.isItRaining = false
		self.isItSnowing = false
	}
}
