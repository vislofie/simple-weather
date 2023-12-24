import SwiftUI

struct CurrentDayView: View 
{
	@Binding
	var currentDayModel: CurrentDayModel
	
    var body: some View
	{
		ZStack
		{
			VStack
			{
				VStack
				{
					Text("\(currentDayModel.place)")
						.foregroundStyle(.white)
						.font(.system(size: 32, weight: .bold))
					Text("\(currentDayModel.dayOfWeek), \(currentDayModel.date)")
						.foregroundStyle(.white)
						.font(.system(size: 24, weight: .light))
					
					Image(systemName: currentDayModel.imagePath)
						.symbolRenderingMode(.multicolor)
						.resizable()
						.aspectRatio(contentMode: .fit)
						.frame (width: 191, height: 135)
						.padding(.bottom, -10)
					
					Text("\(currentDayModel.temperature)º")
						.foregroundStyle(.white)
						.font(.system(size: 64, weight: .bold))
				}
				
				ZStack
				{
					BackgroundPanelView(width: 275, height: 63)
					
					HStack(spacing: 35)
					{
						WeatherParameterView(parameterModel: WeatherParameterModel(
							name: "WND",
							value: currentDayModel.windDir,
							additionalValue: "\(currentDayModel.windSpeed)",
							unit: "m/s"
						))
						WeatherParameterView(parameterModel: WeatherParameterModel(
							name: "PRS",
							value: "\(currentDayModel.pressure)",
							additionalValue: "",
							unit: "mb"
						))
						WeatherParameterView(parameterModel: WeatherParameterModel(
							name: "PCT",
							value: "\(currentDayModel.precipitation)",
							additionalValue: "",
							unit: "mm"
						))
						WeatherParameterView(parameterModel: WeatherParameterModel(
							name: "HMD",
							value: "\(currentDayModel.humidity)",
							additionalValue: "",
							unit: "%"
						))
					}.frame(width: 275, height: 63)
				}
			}
			
		}
	}
}

#Preview
{
	CurrentDayView(currentDayModel: .constant(CurrentDayModel(
		place: "Moscow",
		dayOfWeek: "Monday",
		date: "28th of November",
		precipitationLevel: Utilities.PrecipitationLevel.moderate,
		temperature: -5,
		windDir: "NW",
		windSpeed: 3,
		pressure: 1050,
		precipitation: 30,
		humidity: 60)))
}
