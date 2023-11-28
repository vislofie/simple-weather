import SwiftUI

struct DayView: View
{
	let dataModel: DayDataModel
	
	var body: some View
	{
		VStack
		{
			Text(dataModel.dayOfWeek)
				.font(.system(size: 18, weight: .medium, design: .default))
				.foregroundStyle(.white)
				.padding(.top)
			
			Image(systemName: dataModel.getImageNameFromStatus())
				.renderingMode(.original)
				.resizable()
				.aspectRatio(contentMode: .fit)
				.frame(width: 45, height: 45)
				.foregroundColor(.white)
			Text(String(dataModel.temperature) + "°")
				.font(.system(size: 24, weight: .medium, design: .default))
				.foregroundStyle(.white)
				.padding(.bottom)
		}.padding(.horizontal, 5)
	}
}

struct BackgroundView: View
{
	var body: some View
	{
		LinearGradient(gradient: Gradient(colors: [.blue, .lightBlue]),
					   startPoint: .topLeading,
					   endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)
	}
}

struct CityNameView: View
{
	let cityName: String
	
	var body: some View
	{
		Text("\(cityName)")
			.font(.system(size: 32, weight: .medium, design: .default))
			.foregroundStyle(.white)
			.padding()
	}
}

struct CurrentWeatherView: View
{
	let dataModel: DayDataModel
	
	var body: some View
	{
		VStack
		{
			Image(systemName: dataModel.getImageNameFromStatus())
				.renderingMode(.original)
				.resizable()
				.aspectRatio(contentMode: .fit)
				.frame(width: 120, height: 120)
			
			Text("\(dataModel.temperature)°")
				.font(.system(size: 70, weight: .medium, design: .default))
				.foregroundStyle(.white)
				.padding()
		}.padding(.bottom, 10)
	}
}

