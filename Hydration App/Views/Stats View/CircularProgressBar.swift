//
//  CircularProgressBar.swift
//  Hydration App
//
//  Created by Christopher Engelbart on 9/6/21.
//

import SwiftUI

struct CircularProgressBar: View {
    
    @EnvironmentObject var model: DrinkModel
    
    var progressWater: Double
    var progressCoffee: Double
    var progressSoda: Double
    var progressJuice: Double
    var selectedTimePeriod: String
    
    var body: some View {
        
        ZStack {
            
            Circle()
                .stroke(lineWidth: 30)
                .foregroundColor(Color(.systemGray6))
            
            CircularProgressBarHighlight(progress: progressJuice+progressSoda+progressCoffee+progressWater, color: Constants.colors[Constants.juiceKey]!)
            
            CircularProgressBarHighlight(progress: progressSoda+progressCoffee+progressWater, color: Constants.colors[Constants.sodaKey]!)
            
            CircularProgressBarHighlight(progress: progressCoffee+progressWater, color: Constants.colors[Constants.coffeeKey]!)
            
            CircularProgressBarHighlight(progress: progressWater, color: Constants.colors[Constants.waterKey]!)
            
            if selectedTimePeriod == Constants.selectDay {
                Text(String(format: "%.2f%%", min(model.getTotalPercent(date: model.drinkData.selectedDay), 1.0)*100.0))
                    .font(.largeTitle)
                    .bold()
            } else {
                Text(String(format: "%.2f%%", min(model.getTotalPercent(week: model.drinkData.selectedWeek), 1.0)*100.0))
                    .font(.largeTitle)
                    .bold()
            }
            
        }
        .padding(.horizontal)
        
    }
}
