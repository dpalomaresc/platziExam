//
//  VideoPlayerView.swift
//  platziExam
//
//  Created by Diego Palomares on 19/06/24.
//


import AVFoundation
import SwiftUI
import VideoPlayer

private var videoURLs: [URL] = [
    URL(string: "https://cdn.pixabay.com/video/2021/05/09/73654-549527823_large.mp4")!,
    URL(string: "https://cdn.pixabay.com/video/2022/12/14/142915-781314403_large.mp4")!,
    URL(string: "https://cdn.pixabay.com/video/2021/05/09/73654-549527823_large.mp4")!,
    URL(string: "http://vfx.mtime.cn/Video/2019/06/25/mp4/190625091024931282.mp4")!,
    URL(string: "https://cdn.pixabay.com/video/2024/05/06/210859_large.mp4")!
]

struct VideoPlayerView : View {
    @State var index = 0
    @State private var play: Bool = true
    @State private var time: CMTime = .zero
    @State private var autoReplay: Bool = true
    @State private var mute: Bool = false
    @State private var stateText: String = ""
    @State private var totalDuration: Double = 0
    @State private var speedRate: Float = 1.2
    
    var body: some View {
        VStack {
            VideoPlayer(url: videoURLs[index % videoURLs.count], play: $play, time: $time)
                .autoReplay(autoReplay)
                .mute(mute)
                .speedRate(speedRate)
                .onStateChanged { state in
                    switch state {
                    case .loading:
                        self.stateText = "Loading..."
                    case .playing(let totalDuration):
                        self.stateText = ""
                    case .error(let error):
                        self.stateText = "Error: \(error)"
                    default: break
                    }
                }
                .aspectRatio(1.78, contentMode: .fit)
                .cornerRadius(16)
                .shadow(color: Color.black.opacity(0.7), radius: 6, x: 0, y: 2)
                .padding()
            
            Text(stateText)
                .padding()
                .foregroundColor(.white)
            
            Button(self.play ? "Parar" : "Continuar") {
                self.play.toggle()
            }
            .foregroundColor(.white)
            
            Button("Siguiente Video") { self.index += 1 }
                .foregroundColor(.white)
        }
        .onDisappear { self.play = false }
    }
}

struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
