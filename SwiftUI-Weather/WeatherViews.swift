import SwiftUI

struct CityNameView: View
{
	let cityName: String
	let dayOfWeek: String
	let monthName: String
	let day: Int
	
	var body: some View
	{
		 Text("\(cityName)")
			.font(.system(size: 32, weight: .medium, design: .default))
			.foregroundStyle(.white)
		Text("\(dayOfWeek), \(day)\(Utilities.getDateDayPostfix(day: day)) of \(monthName)")
			.font(.system(size: 24, weight: .light, design: .default))
			.foregroundStyle(.white)
			.padding(.bottom)
	}
}

struct CurrentWeatherView: View
{
	let dataModel: CurrentDayModel
	
	var body: some View
	{
		VStack
		{
			Image(systemName: dataModel.imagePath)
				.symbolRenderingMode(.multicolor)
				.resizable()
				.aspectRatio(contentMode: .fit)
				.frame(width: 120, height: 120)
			
			Text("\(dataModel.temperature)°")
				.font(.system(size: 70, weight: .medium, design: .default))
				.foregroundStyle(.white)
				.padding()
		}
		.padding(.bottom, 10)
	}
}
