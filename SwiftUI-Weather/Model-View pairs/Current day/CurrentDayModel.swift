struct CurrentDayModel : Hashable
{
	let place: String
	let dayOfWeek: String
	let date: String
	
	let precipitationLevel: Utilities.PrecipitationLevel
	
	let temperature: Int
	
	let isDay: Bool
	
	let windDir: String
	let windSpeed: Int
	let pressure: Int
	let precipitation: Int
	let humidity: Int
	
	public private(set) var imagePath : String
	
	init(place: String, dayOfWeek: String, date: String, precipitationLevel: Utilities.PrecipitationLevel, temperature: Int, isDay: Bool, windDir: String, windSpeed: Int, pressure: Int, precipitation: Int, humidity: Int)
	{
		self.place = place
		self.dayOfWeek = dayOfWeek
		self.date = Utilities.getFormattedDayDate(date: date)
		
		self.precipitationLevel = precipitationLevel
		
		self.temperature = temperature
		self.isDay = isDay
		
		self.windDir = windDir
		self.windSpeed = windSpeed
		self.pressure = pressure
		self.precipitation = precipitation
		self.humidity = humidity
		
		imagePath = Utilities.getWeatherStatusImagePath(isDay: isDay, windSpeed: Utilities.convertToMetersPerSecond(value: Double(windSpeed), from: .kilometersPerHour), pressure: Double(pressure), precipitation: Double(precipitation), willItRain: precipitationLevel != .none, willItSnow: precipitationLevel != .none)
	}
	
	init()
	{
		self.place = "None"
		self.dayOfWeek = "Monday"
		self.date = Utilities.getFormattedDayDate(date: "2023-05-21")
		
		self.precipitationLevel = Utilities.PrecipitationLevel.none
		
		self.temperature = 0
		
		self.isDay = true
		
		self.windDir = "NW"
		self.windSpeed = 0
		self.pressure = 0
		self.precipitation = 0
		self.humidity = 0
		
		imagePath = "cloud.sun.fill"
	}
}
