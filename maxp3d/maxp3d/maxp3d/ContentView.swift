//
//  ContentView.swift
//  maxp3d
//
//  Created by jumango pussu on R 6/11/13.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    let entity = Entity()

    var body: some View {
        VStack {
            RealityView { content in
                content.add(entity)
                if let scene = try? await Entity(named: "Scene", in: realityKitContentBundle) {
                    content.add(scene)
                }
                let audioName: String = "j2.m4a"
                let configuration = AudioFileResource.Configuration(shouldLoop: true)
                guard let audio = try? AudioFileResource.load(
                    named: audioName,
                    configuration: configuration
                ) else {
                    print("Failed to load audio file.")
                    return
                }
                let focus: Double = 0.5
                entity.spatialAudio = SpatialAudioComponent(directivity: .beam(focus: focus))
                entity.playAudio(audio)
            }
        }
    }
}

#Preview(windowStyle: .volumetric) {
    ContentView()
}
