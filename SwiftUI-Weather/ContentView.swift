import SwiftUI

struct ContentView: View 
{
	@State
	private var currentDayModel: DayDataModel = DayDataModel(day: "NON", isItRaining: false, isItSnowing: false, temperature: 0)
	@State
	private var forecastDayModels: [DayDataModel] = Array(
		repeating: DayDataModel(day: "NON", isItRaining: false, isItSnowing: false, temperature: 0),
	    count: 5)
	
    var body: some View
	{
        ZStack
		{
			BackgroundView()
	
			VStack
			{
				CityNameView(cityName: "Moscow")
				CurrentWeatherView(dataModel: currentDayModel)
				
				HStack
				{
					ForEach(forecastDayModels, id: \.self)
					{ dayModel in
						DayView(dataModel: dayModel)
					}
				}
			
				Spacer()
			}
		}.onAppear { WeatherNetwork.receiveWeatherInfo(townName: "Moscow", transferTo: { weatherResponse in processResponse(response: weatherResponse) })}
	}
	
	func processResponse(response: WeatherResponse)
	{
		currentDayModel = DayDataModel(
			day: getShortenedDayOfWeekFromDate(date: response.forecast.forecastday[0].date),
			isItRaining: response.forecast.forecastday[0].day.daily_will_it_rain == 1 && response.forecast.forecastday[0].day.avgtemp_c >= 0,
			isItSnowing: response.forecast.forecastday[0].day.daily_will_it_rain == 1 && response.forecast.forecastday[0].day.avgtemp_c < 0,
			temperature: response.forecast.forecastday[0].day.avgtemp_c)
		
		for i in 0 ... 4
		{
			forecastDayModels[i] = DayDataModel(
				day: getShortenedDayOfWeekFromDate(date: response.forecast.forecastday[i + 1].date),
				isItRaining: response.forecast.forecastday[i + 1].day.daily_will_it_rain == 1 && response.forecast.forecastday[i + 1].day.avgtemp_c >= 0,
				isItSnowing: response.forecast.forecastday[i + 1].day.daily_will_it_rain == 1 && response.forecast.forecastday[i + 1].day.avgtemp_c < 0,
				temperature: response.forecast.forecastday[i + 1].day.avgtemp_c)
		}
		
		print(response)
	}
	
	func getShortenedDayOfWeekFromDate(date: String) -> String
	{
		let formatter = DateFormatter()
		formatter.dateFormat = "yyyy-MM-dd"
		guard let todayDate = formatter.date(from: date) else { return "" }
		
		let myCalendar = Calendar(identifier: .gregorian)
		let dayOfWeek = myCalendar.component(.weekday, from: todayDate)
		
		switch dayOfWeek
		{
		case 1:
			return "MON"
		case 2:
			return "TUE"
		case 3:
			return "WED"
		case 4:
			return "THU"
		case 5:
			return "FRI"
		case 6:
			return "SAT"
		case 7:
			return "SUN"
		default:
			return "NON"
		}
	}

}

#Preview 
{
    ContentView()
}
