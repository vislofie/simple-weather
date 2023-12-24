import SwiftUI

struct WeatherParameterView: View 
{
	var parameterModel: WeatherParameterModel
	
    var body: some View
	{
		VStack
		{
			Text(parameterModel.parameterName)
				.foregroundStyle(.white)
				.font(.system(size: 10, weight: .semibold))
			Text(parameterModel.parameterValue)
				.foregroundStyle(.white)
				.font(.system(size: 16, weight: .bold))
				.padding(0)
			Text("\(parameterModel.additionalValue)\(parameterModel.parameterUnit)")
				.foregroundStyle(.white)
				.font(.system(size: 16, weight: .bold))
		}
    }
}

#Preview 
{
	WeatherParameterView(parameterModel: WeatherParameterModel(name: "WND", value: "NW", additionalValue: "9", unit: "m/s"))
}
