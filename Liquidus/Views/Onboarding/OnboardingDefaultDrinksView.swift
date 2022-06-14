//
//  OnboardingDefaultDrinksView.swift
//  Liquidus
//
//  Created by Christopher Engelbart on 10/11/21.
//

import SwiftUI

struct OnboardingDefaultDrinksView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @Environment(\.managedObjectContext) var context
    @FetchRequest(sortDescriptors: [NSSortDescriptor(key: "order", ascending: true)], predicate: NSPredicate(format: "isDefault == true")) var drinkTypes: FetchedResults<DrinkType>
    
    @EnvironmentObject var model: DrinkModel
    
    @State var isEnabled = true
    
    @ScaledMetric(relativeTo: .body) var symbolSize = 75
    
    var body: some View {
        
        // Instructions
        Form {
            Section {
                HStack {
                    Spacer ()
                    
                    Image("custom.drink")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: symbolSize, height: symbolSize)
                        .symbolRenderingMode(.hierarchical)
                        .foregroundColor(model.grayscaleEnabled ? .primary : .blue)
                    
                    Spacer ()
                    
                }
                .listRowBackground(colorScheme == .light ? Color(.systemGray6) : Color.black)
                .listSectionSeparator(.hidden)
                .accessibilityHidden(true)
            }
            
            Section {
                HStack {
                    
                    Spacer ()
                    
                    Text("Liquidus comes with 4 default drink types. These can be enabled and disabled at any time.")
                        .font(.title2)
                    
                    Spacer()
                }
                .listRowBackground(colorScheme == .light ? Color(.systemGray6) : Color.black)
                .listSectionSeparator(.hidden)
            }
            
            // Drink Toggles
            Section {
                List {

                    ForEach(drinkTypes) { type in
                        OnboardingToggleDrinksView(type: type)
                    }
                }
            }
        }
        .multilineTextAlignment(.center)
        .toolbar {
            NavigationLink {
                OnboardingCustomDrinksView()
            } label: {
                Text("Next")
            }
            
        }
        .onDisappear {
            // Save changes
            do {
                try context.save()
            } catch {
                fatalError("OnboardingDefaultDrinksView: Unable to save to CoreData")
            }
        }
    }
}

struct OnboardingDefaultDrinksView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            OnboardingDefaultDrinksView()
                .environmentObject(DrinkModel(test: false, suiteName: nil))
            OnboardingDefaultDrinksView()
                .preferredColorScheme(.dark)
                .environmentObject(DrinkModel(test: false, suiteName: nil))
                .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
        }
    }
}
