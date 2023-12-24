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
		ZStack
		{
			BackgroundPanelView(width: 367, height: 111)
			
			ScrollView(.horizontal, showsIndicators: false)
			{
				HStack()
				{
					Text("")
					
					ForEach(0..<25)
					{ i in
						ForecastHourElementView(
							time: "\(Utilities.getFormattedTime(time: startWithHour + i)):00",
							imagePath: Utilities.getImagePathByHour(
								forecastModel: startWithHour + i > 23 ? nextForecastDay : currentForecastDay,
								hour: startWithHour + i),
							temperature: "-5")
					}
					
					Text("")
				}
			}.padding(.leading, 15).padding(.trailing, 15)
		}
    }
}

#Preview 
{
	ForecastHourView(
		currentForecastDay: .constant(ForecastDayModel()),
		nextForecastDay: .constant(ForecastDayModel()),
		startWithHour: 12)
}
