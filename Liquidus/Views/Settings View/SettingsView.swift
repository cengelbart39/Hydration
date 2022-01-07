//
//  SettingsView.swift
//  Hydration App
//
//  Created by Christopher Engelbart on 9/6/21.
//

import SwiftUI
import HealthKit

struct SettingsView: View {
    
    @EnvironmentObject var model: DrinkModel
    
    @State var dailyGoal = ""
    
    var body: some View {
        
        NavigationView {
            
            Form {
                
                // MARK: - Daily Goal Settings
                Section(footer: Text("Weekly goal adjusts accordingly")) {
                    
                    NavigationLink(
                        // Display Settings Page
                        destination: SettingsDailyGoalView(),
                        label: {
                            HStack {
                                // Display current daily goal
                                Text("Daily Goal: \(model.drinkData.dailyGoal, specifier: model.getSpecifier(amount: model.drinkData.dailyGoal)) \(model.getUnits())")
                            }
                        })
                    
                }
                
                Section {
                    NavigationLink {
                        SettingsDrinkTypeView()
                    } label: {
                        Text("Drink Types")
                    }

                }
                
                // MARK: - Unit Settings
                Section(footer: Text("If the unit is changed, all measurements will be converted")) {
                    
                    NavigationLink(
                        destination: SettingsUnitsView(),
                        label: {
                            Text("\(model.drinkData.units) (\(model.getUnits()))")
                        })
                }
                
                // MARK: - Sync with Apple Health
                // Don't display button if Apple Health access is granted
                if !model.drinkData.healthKitEnabled {
                    Section() {
                        
                        HStack {
                            
                            Spacer()
                            
                            Button(action: {
                                if let healthStore = model.healthStore {
                                    if model.drinkData.lastHKSave == nil {
                                        healthStore.requestAuthorization { succcess in
                                            if succcess {
                                                healthStore.getHealthKitData { statsCollection in
                                                    if let statsCollection = statsCollection {
                                                        model.retrieveFromHealthKit(statsCollection)
                                                        model.saveToHealthKit()
                                                        DispatchQueue.main.async {
                                                            model.drinkData.healthKitEnabled = true
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }, label: {
                                Text("Sync with Apple Health")
                                    .foregroundColor(model.grayscaleEnabled ? .primary : Color(.systemPink))
                            })
                            
                            Spacer()
                        }
                        
                    }
                }
                
                
            }
            .navigationBarTitle("Settings")
        }

        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(DrinkModel())
    }
}
