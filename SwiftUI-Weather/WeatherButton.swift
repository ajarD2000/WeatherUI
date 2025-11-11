//
//  WeatherButton.swift
//  SwiftUI-Weather
//
//  Created by Ajar Dahal on 11/10/25.
//

import Foundation
import SwiftUI

struct weatherButton: View {
    
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
        
    }
}
