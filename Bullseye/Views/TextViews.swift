//
//  TextViews.swift
//  Bullseye
//
//  Created by Dylan Cronk on 4/5/23.
//

import SwiftUI

struct InstructionText: View {
  var text : String
  var body: some View {
    Text(text.uppercased())
      .bold()
      .multilineTextAlignment(.center)
      .lineSpacing(4.0)
      .font(.footnote)
      .kerning(2)
      .foregroundColor(Color("TextColor"))
  }
}

struct BigNumberText: View {
  var text: String
  var body: some View {
    Text(text)
      .kerning(-1)
      .font(.largeTitle)
      .fontWeight(.black)
      .foregroundColor(Color("TextColor"))
  }
}

struct SliderLabelText: View {
  var text: String
  var body: some View {
    Text(text)
      .bold()
      .foregroundColor(Color("TextColor"))
  }
}

struct LabelText: View {
  var text: String
  var body: some View {
    Text(text.uppercased())
      .bold()
      .font(.caption)
      .kerning(1.5)
      .foregroundColor(Color("TextColor"))
  }
}

struct BodyText: View {
  var text: String
  var body: some View {
    Text(text)
      .font(.subheadline)
      .fontWeight(.semibold)
      .multilineTextAlignment(.center)
      .lineSpacing(12)
  }
}

struct ButtonText: View {
  var text: String
  
  var body: some View {
    Text(text)
      .bold()
      .padding()
      .frame(maxWidth: .infinity)
      .background(
        Color.accentColor
      )
      .foregroundColor(.white)
      .cornerRadius(12)
  }
}

struct ScoreText: View {
  var score: Int
  var body: some View {
    Text("\(score)")
      .bold()
      .kerning(-0.2)
      .foregroundColor(Color("TextColor"))
      .font(.title3)
  }
}

struct DateText: View {
  var date: Date
  var body: some View {
    Text(date, style: .time)
      .bold()
      .kerning(-0.2)
      .foregroundColor(Color("TextColor"))
      .font(.title3)
  }
}

struct RoundedTextView: View {
  let text: String
  var body: some View {
    Text(text)
      .bold()
      .font(.title3)
      .foregroundColor(Color("TextColor"))
      .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
      .overlay(
        Circle()
          .strokeBorder(Color("LeaderboardRowColor"), lineWidth: Constants.General.strokeWidth))
  }
}

struct BigBoldText: View {
  let text: String
  var body: some View {
    Text(text.uppercased())
      .kerning(2)
      .foregroundColor(Color("TextColor"))
      .font(.title)
      .fontWeight(.black)
  }
}

struct TextViews_Previews: PreviewProvider {
  static var previews: some View {
    BigBoldText(text: "Leaderboard")
  }
}
