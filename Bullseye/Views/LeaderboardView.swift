//
//  LeaderboardView.swift
//  Bullseye
//
//  Created by Dylan Cronk on 8/20/23.
//

import SwiftUI

struct LeaderboardView: View {
  @Binding var leaderboardIsShowing: Bool
  @Binding var game: Game
  var body: some View {
    ZStack {
      Color("BackgroundColor").ignoresSafeArea()
      VStack(spacing: 10) {
        HeaderView(leaderboardIsShowing: $leaderboardIsShowing)
        LabelView()
        ScrollView {
          VStack {
            ForEach(game.leaderBoardEntries.indices, id: \.self ) { index in
              let leaderBoardEntry = game.leaderBoardEntries[index]
              RowView(index: index + 1, score: leaderBoardEntry.score, date: leaderBoardEntry.date)
            }
          }
        }
      }
    }
  }
}

struct HeaderView: View {
  @Environment(\.horizontalSizeClass) var horizontalSizeClass
  @Environment(\.verticalSizeClass) var verticalSizeClass
  @Binding var leaderboardIsShowing: Bool
  var body: some View {
    ZStack {
      HStack {
        BigBoldText(text: "Leaderboard")
        if verticalSizeClass == .regular && horizontalSizeClass == .compact {
          Spacer()
        }
      }
      HStack {
        Spacer()
        Button {
          leaderboardIsShowing = false
        } label: {
          RoundedImageViewFilled(systemName: "xmark")
        }
      }
    }
    .padding([.horizontal, . top])
  }
}

struct LabelView: View {
  var body: some View {
    HStack {
      Spacer()
        .frame(width: Constants.General.roundedViewLength)
      Spacer()
      LabelText(text: "Score")
        .frame(width: Constants.Leaderboard.scoreColumnWidth)
      Spacer()
      LabelText(text: "Date")
        .frame(width: Constants.Leaderboard.dateColumnWidth)
    }
    .padding(.horizontal)
    .frame(maxWidth: Constants.Leaderboard.maxRowWidth)
  }
}

struct RowView: View {
  let index: Int
  let score: Int
  let date: Date
  var body: some View {
    HStack {
      RoundedTextView(text: String(index))
      Spacer()
      ScoreText(score: score)
        .frame(width: Constants.Leaderboard.scoreColumnWidth)
      Spacer()
      DateText(date: Date())
        .frame(width: Constants.Leaderboard.dateColumnWidth)
    }.background(
      RoundedRectangle(cornerRadius: .infinity).strokeBorder(Color("LeaderboardRowColor"), lineWidth: Constants.General.strokeWidth))
    .padding(.horizontal)
    .frame(maxWidth: Constants.Leaderboard.maxRowWidth)
  }
}

struct LeaderboardView_Previews: PreviewProvider {
  static private var leaderboardIsShowing = Binding.constant(false)
  static private var game = Binding.constant(Game())
  static var previews: some View {
    LeaderboardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
  }
}
