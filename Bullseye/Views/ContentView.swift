//
//  ContentView.swift
//  Bullseye
//
//  Created by Dylan Cronk on 4/3/23.
//

import SwiftUI

struct ContentView: View {
  @State private var alertIsVisible = false
  @State private var sliderValue = 50.0
  @State private var game = Game()
  var body: some View {
    ZStack {
      BackgroundView(game: $game)
      VStack {
        InstructionsView(game: $game)
          .padding(.bottom, alertIsVisible ? 0 : 100)
        if alertIsVisible {
          PointsView(alertIsVisible: $alertIsVisible, game: $game, sliderValue: $sliderValue)
            .transition(.scale)
        } else {
          HitMeButtonView(alertIsVisible: $alertIsVisible, game: $game, sliderValue: $sliderValue)
            .transition(.scale)
        }
      }
      if !alertIsVisible {
        SliderView(sliderValue: $sliderValue)
          .zIndex(1)
          .transition(.scale)
      }
    }
  }
}

struct SliderView: View {
  @Binding var sliderValue: Double
  var body: some View {
    HStack {
      SliderLabelText(text: "1")
        .frame(width: 35)
      Slider(value: $sliderValue, in: 1.0...100.0)
      SliderLabelText(text: "100")
        .frame(width: 35)
    }
    .padding()
  }
}

struct HitMeButtonView: View {
  @Binding var alertIsVisible: Bool
  @Binding var game: Game
  @Binding var sliderValue: Double
  var body: some View {
    Button("Hit me".uppercased()) {
      withAnimation {
        alertIsVisible = true
      }
    }
    .padding(20)
    .background(
      ZStack {
        Color("ButtonColor")
        LinearGradient(
          gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]),
          startPoint: .top, endPoint: .bottom)
      }
    )
    .overlay {
      RoundedRectangle(cornerRadius: Constants.General.roundRecCornerRadius)
        .strokeBorder(Color.white, lineWidth: Constants.General.strokeWidth)
    }
    .foregroundColor(.white)
    .cornerRadius(Constants.General.roundRecCornerRadius)
    .bold()
    .font(.title3)
  }
}

struct InstructionsView: View {
  @Binding var game: Game
  var body: some View {
    VStack {
      InstructionText(text: "🎯🎯🎯\nPut the bullseye as close as you can to")
        .padding(.horizontal, 30)
      BigNumberText(text: String(game.target))
    }
  }
}


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
