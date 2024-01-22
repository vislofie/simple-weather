import SwiftUI

struct ForecastHourElementView: View 
{
	let time: String
	let imagePath: String
	let temperature: String
	
    var body: some View
	{
		VStack
		{
			Text(time)
				.foregroundStyle(.white)
				.font(.system(size: 12, weight: .bold))
				.frame(width: 49, height: 21)
			Image(systemName: imagePath)
				.symbolRenderingMode(.multicolor)
				.resizable()
				.aspectRatio(contentMode: .fill)
				.frame(width: 46, height: 31)
			Text("\(temperature)º")
				.foregroundStyle(.white)
				.font(.system(size: 20, weight: .bold ))
				.frame(width: 49, height: 31)
		}
    }
}

#Preview 
{
	ForecastHourElementView(time: "12:00", imagePath: "cloud.fill", temperature: "5")
}
