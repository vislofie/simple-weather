import SwiftUI

struct ForecastHourView: View 
{
	@Binding
	var currentForecastDay: ForecastDayModel
	@Binding
	var nextForecastDay: ForecastDayModel
	
	let startWithHour: Int
	
    var body: some View
	{
		GeometryReader
		{ geometry in
			
			BackgroundPanelView(width: geometry.size.width, height: 111, cornerRadius: 24)
			
			ScrollView(.horizontal, showsIndicators: false)
			{
				HStack()
				{
					Text("")
					
					ForEach(0..<24)
					{ i in
						ForecastHourElementView(
							time: "\(Utilities.getFormattedTime(time: startWithHour + i)):00",
							imagePath: Utilities.getImagePathByHour(
								forecastModel: startWithHour + i > 23 ? nextForecastDay : currentForecastDay,
								hour: startWithHour + i),
							temperature: String(Int(((startWithHour + i) > 23 ? nextForecastDay.hours[startWithHour + i - 24].temperature : currentForecastDay.hours[startWithHour + i].temperature))))
					}
					
					Text("")
				}
			}.padding(.vertical, 5)
		}
    }
}

#Preview 
{
	ForecastHourView(
		currentForecastDay: .constant(ForecastDayModel()),
		nextForecastDay: .constant(ForecastDayModel()),
		startWithHour: 0)
}
