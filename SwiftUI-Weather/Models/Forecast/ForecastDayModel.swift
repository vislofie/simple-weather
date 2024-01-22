struct ForecastDayModel
{
	let date: String
	
	let maxTemperature: Double
	let minTemperature: Double
	let avgTemperature: Double
	
	let isItRaining: Bool
	let isItSnowing: Bool
	
	let sunriseTime: String
	let sunsetTime: String
	let moonRise: String
	let moonSet: String
	
	let hours: [ForecastHourModel]
	
	init(date: String, maxTemperature: Double, minTemperature: Double, avgTemperature: Double, isItRaining: Bool, isItSnowing: Bool, sunriseTime: String, sunsetTime: String, moonRise: String, moonSet: String, hours: [ForecastHourModel])
	{
		self.date = date
		
		self.maxTemperature = maxTemperature
		self.minTemperature = minTemperature
		self.avgTemperature = avgTemperature
		
		self.isItRaining = isItRaining
		self.isItSnowing = isItSnowing
		
		self.sunriseTime = sunriseTime
		self.sunsetTime = sunsetTime
		self.moonRise = moonRise
		self.moonSet = moonSet
		
		self.hours = hours
	}
	
	init()
	{
		self.date = "2000-01-01"
		
		self.maxTemperature = 0
		self.minTemperature = 0
		self.avgTemperature = 0
		
		self.isItRaining = false
		self.isItSnowing = false
		
		self.sunriseTime = "00:00"
		self.sunsetTime = "00:00"
		self.moonRise = "00:00"
		self.moonSet = "00:00"
		
		self.hours = Array(repeating: ForecastHourModel(), count: 24)
	}
}

struct ForecastHourModel
{
	let isDay: Bool
	
	let time: String
	
	let temperature: Double
	
	let windSpeed: Double
	let windDir: String
	
	let precipitation: Double
	let humidity: Int
	let pressure: Double
	
	let isItRaining: Bool
	let isItSnowing: Bool
	
	init(isDay: Bool, time: String, temperature: Double, windSpeed: Double, windDir: String, precipitation: Double, humidity: Int, pressure: Double, isItRaining: Bool, isItSnowing: Bool)
	{
		self.isDay = isDay
		
		self.time = time
		
		self.temperature = temperature
		
		self.windSpeed = windSpeed
		self.windDir = windDir
		
		self.precipitation = precipitation
		self.humidity = humidity
		self.pressure = pressure
		
		self.isItRaining = isItRaining
		self.isItSnowing = isItSnowing
	}
	
	init()
	{
		self.isDay = true
		
		self.time = "00:00"
		
		self.temperature = 0
		
		self.windSpeed = 0
		self.windDir = "N"
		
		self.precipitation = 0
		self.humidity = 0
		self.pressure = 0
		
		self.isItRaining = false
		self.isItSnowing = false
	}
}
