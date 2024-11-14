/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
The app's main view.
*/

import SwiftUI

struct MainView: View {
    /// The environment value to get the `OpenImmersiveSpaceAction` instance.
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @State private var text: String = ""
    
    // Array of choices to display randomly
    private let choices = [
        "油もの", "ヘルシー", "甘いもの", "エスニック", "和食", "いままで試したことないもの"
    ]

    var body: some View {
        VStack {
            // Display the random text
            Text(text)
                .font(.title)
                .padding()

            // Button to generate a random text
            Button("Tap for Random Choice") {
                text = choices.randomElement() ?? "" // Update text with a random choice
            }
            .padding()
        }
        .onAppear {
            Task {
                await openImmersiveSpace(id: "ImmersiveScene")
            }
        }
    }
}


#Preview(windowStyle: .automatic) {
    MainView()
}
