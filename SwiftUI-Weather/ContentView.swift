import SwiftUI

struct ContentView: View 
{
	@State
	private var currentDayModel: CurrentDayModel = CurrentDayModel()
	@State
	private var forecastCurrentDayHours: ForecastDayModel = ForecastDayModel()
	@State
	private var forecastDayModels: [ForecastDayModel] = Array(repeating: ForecastDayModel(), count: 0)
	
    var body: some View
	{
		ZStack
		{
			BackgroundView()
			
			VStack
			{
				CurrentDayView(currentDayModel: $currentDayModel)
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
			windDir: response.current.wind_dir, 
			windSpeed: Int(response.current.wind_kph), 
			pressure: Int(response.current.pressure_mb),
			precipitation: Int(response.current.precip_mm),
			humidity: response.current.humidity)
	}
	
	
}

#Preview 
{
    ContentView()
}
