//
//  BackgroundView.swift
//  SwiftUI-Weather
//
//  Created by Alexandr on 07.12.2023.
//

import SwiftUI

struct BackgroundView: View
{
	var body: some View
	{
		LinearGradient(gradient: Gradient(colors: [.blue, .lightBlue]),
					   startPoint: .topLeading,
					   endPoint: .bottomTrailing).ignoresSafeArea()
	}
}

#Preview 
{
    BackgroundView()
}
