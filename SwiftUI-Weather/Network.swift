import SwiftUI

struct WeatherNetwork
{
	static func receiveWeatherInfo(townName: String, transferTo transferClosure: @escaping(WeatherResponse) -> Void)
	{
		guard let url = URL(string: "http://api.weatherapi.com/v1/forecast.json?key=1251e6ba273846c0845195531232711&q=\(townName)&days=11") else { return }
		
		var request = URLRequest(url: url)
		
		request.httpMethod = "GET"

		let task = URLSession.shared.dataTask(with: request) { data, response, error in
			if let data = data
			{
				do
				{
					let response = try JSONDecoder().decode(WeatherResponse.self, from: data)
					transferClosure(response)
				} catch
				{
					print(error)
				}
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
	let location: Location
	let forecast: Forecast
	let current: Current
	
	struct Location : Decodable
	{
		let name: String
		let region: String
	}
	
	struct Forecast : Decodable
	{
		let forecastday: [ForecastDay]
	}
	
	struct Current : Decodable
	{
		let temp_c: Double
		let is_day: Int
		let wind_kph: Double
		let wind_dir: String
		let pressure_mb: Double
		let precip_mm: Double
		let humidity: Int
	}
	
	struct ForecastDay : Decodable
	{
		let date: String
		let day: Day
		let astro: Astro
		let hour: [Hour]
	}
	
	struct Astro : Decodable
	{
		let sunrise: String
		let sunset: String
		let moonrise: String
		let moonset: String
	}
	
	struct Day : Decodable
	{
		let maxtemp_c: Double
		let mintemp_c: Double
		let avgtemp_c: Double
		let maxwind_kph: Double
		let totalprecip_mm: Double
		let avghumidity: Double
		let daily_chance_of_rain: Int
		let daily_chance_of_snow: Int
		let daily_will_it_snow: Int
		let daily_will_it_rain: Int
	}
	
	struct Hour : Decodable
	{
		let time: String
		let is_day: Int
		let temp_c: Double
		let wind_kph: Double
		let wind_dir: String
		let pressure_mb: Double
		let precip_mm: Double
		let humidity: Int
		let will_it_rain: Int
		let will_it_snow: Int
	}
}

