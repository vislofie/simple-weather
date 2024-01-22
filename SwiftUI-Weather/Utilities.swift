import Foundation

struct Utilities
{
	enum PrecipitationLevel
	{
		case none
		case light
		case moderate
		case strong
		case rainfall
		
		static func getPrecipitationLevel(precipitationInMM: Double) -> PrecipitationLevel
		{
			switch (precipitationInMM)
			{
			case 2...4:
				PrecipitationLevel.light
			case 5...14:
				PrecipitationLevel.moderate
			case 15...30:
				PrecipitationLevel.strong
			case 30...:
				PrecipitationLevel.rainfall
			default:
				PrecipitationLevel.none
			}
		}
	}
	
	enum SpeedUnit
	{
		case metersPerSecond
		case kilometersPerHour
		case milesPerHour
	}
	
	static func getWeatherStatusImagePath(isDay: Bool, windSpeed: Double, pressure: Double, precipitation: Double, willItRain: Bool, willItSnow: Bool) -> String
	{
		var resultString = ""
		
		resultString += "cloud."
		
		if (pressure > 1000)
		{
			if (isDay)
			{
				resultString += "sun."
			}
			else
			{
				resultString += "moon."
			}
		}
		
		if (willItRain)
		{
			switch PrecipitationLevel.getPrecipitationLevel(precipitationInMM: precipitation)
			{
			case .light:
				resultString += "drizzle."
			case .moderate:
				resultString += "rain."
			case .strong, .rainfall:
				resultString += "heavyrain."
			case .none:
				resultString += "drizzle."
			}
		}
		else if (willItSnow)
		{
			resultString += "snow."
		}
		else if (windSpeed > 8.5)
		{
			resultString = "wind"
			if (willItSnow) { resultString += ".snow" }
		}
		
		if (!resultString.contains("wind"))
		{
			resultString += "fill"
		}
		
		return resultString
	}
	
	static func getDateDayPostfix(day: Int) -> String
	{
		let lastDigit = day % 10
		switch (lastDigit)
		{
		case 1:
			return "st"
		case 2:
			return "nd"
		case 3:
			return "rd"
		default:
			return "th"
		}
	}
	
	static func getTime(rounded: Bool = false) -> String
	{
		let formatter = DateFormatter()
		formatter.dateFormat = "HH:mm"
		var dateString = formatter.string(from: Date())
		
		if (rounded)
		{
			dateString = "\(String(dateString.prefix(3)))00"
		}
		
		return dateString
	}
	
	static func getDayOfWeekFromDate(date: String) -> String
	{
		let formatter = DateFormatter()
		formatter.dateFormat = "yyyy-MM-dd"
		guard let todayDate = formatter.date(from: date) else { return "" }
		
		let myCalendar = Calendar(identifier: .gregorian)
		let dayOfWeek = myCalendar.component(.weekday, from: todayDate)
		
		switch dayOfWeek
		{
		case 1:
			return "Monday"
		case 2:
			return "Tuesday"
		case 3:
			return "Wednesday"
		case 4:
			return "Thursday"
		case 5:
			return "Friday"
		case 6:
			return "Saturday"
		case 7:
			return "Sunday"
		default:
			return "None"
		}
	}
	
	static func getFormattedDayDate(date: String) -> String
	{
		let formatter = DateFormatter()
		formatter.dateFormat = "yyyy-MM-dd"
		guard let todayDate = formatter.date(from: date) else { return "" }
		
		let myCalendar = Calendar(identifier: .gregorian)
		let day = myCalendar.component(.day, from: todayDate)
		let month = myCalendar.component(.month, from: todayDate)
		
		var monthString: String
		switch month
		{
		case 1:
			monthString = "January"
		case 2:
			monthString = "February"
		case 3:
			monthString = "March"
		case 4:
			monthString = "April"
		case 5:
			monthString = "May"
		case 6:
			monthString = "June"
		case 7:
			monthString = "July"
		case 8:
			monthString = "August"
		case 9:
			monthString = "September"
		case 10:
			monthString = "October"
		case 11:
			monthString = "November"
		case 12:
			monthString = "December"
		default:
			monthString = ""
		}
		
		return "\(String(day) + getDateDayPostfix(day: day)) of \(monthString)"
	}
	
	static func getFormattedTime(time: Int) -> String
	{
		var mutableTime = time
		while (mutableTime > 23)
		{
			mutableTime -= 24
		}
		
		if mutableTime < 10
		{
			return "0\(mutableTime)"
		}
		
		return String(mutableTime)
	}
	
	static func getImagePathByHour(forecastModel: ForecastDayModel, hour: Int) -> String
	{
		var mutableHour = hour
		while (mutableHour > 23)
		{
			mutableHour = mutableHour - 24
		}
		
		let currentHour = forecastModel.hours[mutableHour]
		
		return getWeatherStatusImagePath(
			isDay: currentHour.isDay,
			windSpeed: currentHour.windSpeed,
			pressure: currentHour.pressure,
			precipitation: currentHour.precipitation,
			willItRain: currentHour.isItRaining,
			willItSnow: currentHour.isItSnowing)
	}
	static func convertToMetersPerSecond(value: Double, from unit: SpeedUnit) -> Double
	{
		switch unit
		{
		case .metersPerSecond:
			return value
		case .kilometersPerHour:
			return value / 3.6
		case .milesPerHour:
			return value / 2.237
		}
	}
	
	static func getCurrentHour() -> Int
	{
		return Calendar.current.component(.hour, from: Date())
	}
}
