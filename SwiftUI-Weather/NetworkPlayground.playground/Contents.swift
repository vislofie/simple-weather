import SwiftUI
import PlaygroundSupport

let url = URL(string: "http://api.weatherapi.com/v1/forecast.json?key=1251e6ba273846c0845195531232711&q=Moscow&days=11")!
var request = URLRequest(url: url)
request.httpMethod = "GET"

let task = URLSession.shared.dataTask(with: request) { data, response, error in
	if let data = data
	{
		print("JSON String: \(String(data: data, encoding: .utf8) ?? "nil")")
	}
	else
	{
		print("Something wrong")
	}
}
task.resume()
