import SwiftUI

struct BackgroundPanelView: View 
{
	let width : CGFloat
	let height : CGFloat
	
    var body: some View
	{
		Rectangle()
			.fill(Color.white)
			.frame(width: width, height: height)
			.opacity(0.2)
			.cornerRadius(14)
    }
}

#Preview 
{
	BackgroundPanelView(width: 200, height: 50)
}
