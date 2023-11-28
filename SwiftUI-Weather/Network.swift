import SwiftUI

struct WeatherNetwork
{
	static func receiveWeatherInfo(townName: String, transferTo: @escaping(WeatherResponse) -> Void)
	{
		let url = URL(string: "http://api.weatherapi.com/v1/forecast.json?key=1251e6ba273846c0845195531232711&q=Moscow&days=6&hour=12")!

		var request = URLRequest(url: url)
		request.httpMethod = "GET"

		let task = URLSession.shared.dataTask(with: request) { data, response, error in
			if let data = data
			{
				do
				{
					let response = try JSONDecoder().decode(WeatherResponse.self, from: data)
					transferTo(response)
				} catch
				{
					print(error)
				}
			}
			if let response = response
			{
				print(response)
			}
			else if let error = error
			{
				print("HTTP Request Failed \(error)")
			}
		}
		task.resume()
	}
}

struct WeatherResponse : Decodable
{
	let forecast: Forecast
	
	struct Forecast : Decodable
	{
		let forecastday: [ForecastDay]
	}
	
	struct ForecastDay : Decodable
	{
		let date: String
		let day: Day
	}
	
	struct Day : Decodable
	{
		let avgtemp_c: Double
		let daily_chance_of_rain: Int
		let daily_chance_of_snow: Int
		let daily_will_it_snow: Int
		let daily_will_it_rain: Int
	}
}

