import SwiftUI

struct WeatherButton: View
{
	let title: String
	let backgroundColor: Color
	let foregroundColor: Color
	
	var body: some View
	{
		Text(title)
			.frame(width: 280, height: 50)
			.background(backgroundColor)
			.foregroundColor(foregroundColor)
			.font(.system(size: 20, weight: .bold, design: .default))
			.cornerRadius(10)
	}
}
