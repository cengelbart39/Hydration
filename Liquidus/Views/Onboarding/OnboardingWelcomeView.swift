//
//  OnboardingWelcomeView.swift
//  Liquidus
//
//  Created by Christopher Engelbart on 10/11/21.
//

import SwiftUI

struct OnboardingWelcomeView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            
            Text("Welcome to Liquidus!")
                .font(.largeTitle)
                .bold()
                .padding(.bottom)
            
            Text("Here you can take steps to staying hydrated while seeing what you drink and how much you drink.")
                .font(.title3)
                .padding(.bottom)
        }
        .multilineTextAlignment(.center)
        .padding(.horizontal)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingWelcomeView()
    }
}
