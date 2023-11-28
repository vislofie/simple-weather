import SwiftUI

struct DayDataModel : Hashable
{
	let dayOfWeek: String
	let isItRaining: Bool
	let isItSnowing: Bool
	let temperature: Int
	
	init(day: String, isItRaining: Bool, isItSnowing: Bool, temperature: Double)
	{
		self.dayOfWeek = day
		self.isItRaining = isItRaining
		self.isItSnowing = isItSnowing
		self.temperature = Int(temperature)
	}
	
	func getImageNameFromStatus() -> String
	{
		if (isItRaining)
		{
			return "cloud.rain.fill"
		}
		else if (isItSnowing)
		{
			return "cloud.snow.fill"
		}
		
		return "cloud.sun.fill"
	}
}
