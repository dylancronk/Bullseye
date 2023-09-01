//
//  PointsView.swift
//  Bullseye
//
//  Created by Dylan Cronk on 7/23/23.
//

import SwiftUI

struct PointsView: View {
  @Binding var alertIsVisible: Bool
  @Binding var game: Game
  @Binding var sliderValue: Double
  var body: some View {
    let roundedValue = Int(sliderValue.rounded())
    let points = game.points(sliderValue: roundedValue)
    VStack(spacing: 10) {
      InstructionText(text: "The slider's value is")
      BigNumberText(text: String(roundedValue))
      BodyText(text: "You scored \(points) points.")
      Button {
        withAnimation {
          alertIsVisible = false
        }
        game.startNewRound(points: points)
      } label: {
        ButtonText(text: "Start New Round")
      }
    }
    .padding()
    .frame(maxWidth: 300)
    .background(Color("BackgroundColor"))
    .cornerRadius(Constants.General.roundRecCornerRadius)
    .shadow(radius: 10, x: 5, y: 5)
  }
}

struct PointsView_Previews: PreviewProvider {
  static private var alertIsVisible  = Binding.constant(false)
  static private var sliderValue  = Binding.constant(50.0)
  static private var game = Binding.constant(Game())

  static var previews: some View {
    PointsView(alertIsVisible: alertIsVisible, game: game, sliderValue: sliderValue)
  }
}
