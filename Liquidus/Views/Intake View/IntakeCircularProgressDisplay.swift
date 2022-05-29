//
//  IntakeCircularProgressDisplay.swift
//  Liquidus
//
//  Created by Christopher Engelbart on 3/23/22.
//
//  Based off of:
//  https://www.simpleswiftguide.com/how-to-build-a-circular-progress-bar-in-swiftui/
//

import SwiftUI

struct IntakeCircularProgressDisplay: View {
    
    @EnvironmentObject var model: DrinkModel
    
    var day: Day
    var totalPercent: Double
    var width: CGFloat
    @Binding var trigger: Bool
    
    var body: some View {
        
        ZStack {
            // Create circle background
            Circle()
                .stroke(lineWidth: width)
                .foregroundColor(Color(.systemGray6))
                .scaledToFit()
            
            // Get the outline fill for each type
            ForEach(model.drinkData.drinkTypes.reversed()) { type in
                
                // If the drink type is enabled...
                if type.enabled {
                    // Get color for highlight
                    // Use drink type color if goal isn't reached
                    // Use "GoalGreen" if goal is reached
                    let color = model.getHighlightColor(type: type, date: day)
                        
                    IntakeCircularProgressBarHighlight(progress: model.getProgressPercent(type: type, date: day), color: color, width: width, trigger: $trigger)
                }
            }
        }
    }
}
