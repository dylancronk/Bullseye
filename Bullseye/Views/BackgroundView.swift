//
//  BackgroundView.swift
//  Bullseye
//
//  Created by Dylan Cronk on 4/7/23.
//

import SwiftUI

struct BackgroundView: View {
  @Binding var game: Game
    var body: some View {
      VStack{
        TopView(game: $game)
        Spacer()
        BottomView(game: $game)
      }
      .padding()
      .background(RingsView())
    }
}

struct TopView: View {
  @Binding var game: Game
  @State var leaderboardIsShowing = false
  var body: some View {
    HStack {
      Button {
        game.restart()
      } label: {
        RoundedImageViewStroked(systemName: "arrow.counterclockwise")
      }
      Spacer()
      Button {
        leaderboardIsShowing = true
      } label: {
        RoundedImageViewFilled(systemName: "list.dash")
      }
      .sheet(isPresented: $leaderboardIsShowing) {
        LeaderboardView(leaderboardIsShowing: $leaderboardIsShowing, game: $game)
      }
    }
  }
}

struct NumberView: View {
  var title: String
  var text: String
  var body: some View {
    VStack(spacing: 5.0) {
      LabelText(text: title)
      RoundedRecTextView(text: text)
    }
  }
}

struct BottomView: View {
  @Binding var game: Game
  var body: some View {
    HStack {
      VStack {
        LabelText(text: "Round")
        RoundedRecTextView(text: String(game.round))
      }
      Spacer()
      VStack {
        LabelText(text: "Score")
        RoundedRecTextView(text: String(game.score))
      }
    }
  }
}

struct RingsView: View {
  @Environment(\.colorScheme) var colorScheme
  var body: some View {
    ZStack {
      Color("BackgroundColor").ignoresSafeArea()
      ForEach(1..<6) {ring in
        let size = CGFloat(ring * 100)
        let opacity = colorScheme == ColorScheme.dark ? 0.1 : 0.3
        Circle()
          .stroke(lineWidth: 20)
          .fill(RadialGradient(colors: [Color("RingColor").opacity(0.8 * opacity), Color("RingColor").opacity(0)], center: .center, startRadius: 100, endRadius: 300))
          .frame(width: size, height: size)
      }
    }
  }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
      BackgroundView(game: .constant(Game()))
    }
}
