import SwiftUI

struct ContentView: View 
{
	@State
	private var currentDayModel: CurrentDayModel = CurrentDayModel()
	@State
	private var forecastDayModels: [ForecastDayModel] = Array(repeating: ForecastDayModel(), count: 3)
	
    var body: some View
	{
		ZStack
		{
			BackgroundView()
			
			VStack
			{
				CurrentDayView(currentDayModel: $currentDayModel)
					.padding(.bottom, 5)
				ForecastHourView(currentForecastDay: $forecastDayModels[0], nextForecastDay: $forecastDayModels[1], startWithHour: Utilities.getCurrentHour() + 1)
					.padding(.horizontal, 25)
				Spacer()
			}.onAppear 
			{
				WeatherNetwork.receiveWeatherInfo(
					townName: "Moscow",
					transferTo: { weatherResponse in
						processResponse(response: weatherResponse)
					})
			}
		}
	}
	
	func processResponse(response: WeatherResponse)
	{
		currentDayModel = CurrentDayModel(
			place: response.location.name, 
			dayOfWeek: Utilities.getDayOfWeekFromDate(date: response.forecast.forecastday[0].date),
			date: response.forecast.forecastday[0].date, 
			precipitationLevel: Utilities.PrecipitationLevel.getPrecipitationLevel(precipitationInMM: response.current.precip_mm),
			temperature: Int(response.current.temp_c),
			isDay: response.current.is_day != 0,
			windDir: response.current.wind_dir,
			windSpeed: Int(Utilities.convertToMetersPerSecond(value: response.current.wind_kph, from: .kilometersPerHour)),
			pressure: Int(response.current.pressure_mb),
			precipitation: Int(response.current.precip_mm),
			humidity: response.current.humidity)
		
		
		for i in forecastDayModels.indices
		{
			var hourModels = Array(repeating: ForecastHourModel(), count: 24)
			
			for j in hourModels.indices
			{
				let currentHour = response.forecast.forecastday[i].hour[j]
				
				hourModels[j] = ForecastHourModel(
					isDay: currentHour.is_day != 0,
					time: String(currentHour.time.split(separator: " ")[1]),
					temperature: currentHour.temp_c,
					windSpeed: Utilities.convertToMetersPerSecond(value: currentHour.wind_kph, from: .kilometersPerHour),
					windDir: currentHour.wind_dir,
					precipitation: currentHour.precip_mm,
					humidity: currentHour.humidity,
					pressure: currentHour.pressure_mb,
					isItRaining: currentHour.will_it_rain != 0,
					isItSnowing: currentHour.will_it_snow != 0)
			}
			
			forecastDayModels[i] = ForecastDayModel(
				date: response.forecast.forecastday[i].date,
				maxTemperature: response.forecast.forecastday[i].day.maxtemp_c,
				minTemperature: response.forecast.forecastday[i].day.mintemp_c,
				avgTemperature: response.forecast.forecastday[i].day.avgtemp_c,
				isItRaining: response.forecast.forecastday[i].day.daily_will_it_rain != 0,
				isItSnowing: response.forecast.forecastday[i].day.daily_will_it_snow != 0,
				sunriseTime: response.forecast.forecastday[i].astro.sunrise,
				sunsetTime: response.forecast.forecastday[i].astro.sunset,
				moonRise: response.forecast.forecastday[i].astro.moonrise,
				moonSet: response.forecast.forecastday[i].astro.moonset,
				hours: hourModels)
			
			
		}
	}
	
	
}

#Preview 
{
    ContentView()
}
