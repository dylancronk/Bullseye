//
//  Game.swift
//  Bullseye
//
//  Created by Dylan Cronk on 4/3/23.
//

import Foundation

struct Game {
  var target = Int.random(in: 1...100)
  var score = 0
  var round = 1
  var leaderBoardEntries : [LeaderBoardEntry] = []
  
  func points(sliderValue : Int) -> (Int) {
    let difference = abs(target - sliderValue)
    let bonus: Int
    
    if difference == 0 {
      bonus = 100
    } else if difference <= 2 {
      bonus = 50
    } else {
      bonus = 0
    }
    
    return 100 - difference + bonus
    
  }
  
  mutating func startNewRound(points: Int) {
    addToLeaderboard(score: points)
    round += 1
    score += points
    target = Int.random(in: 1...100)
  }
  
  mutating func restart() {
    score = 0
    round = 1
    target = Int.random(in: 1...100)
  }
  
  mutating func addToLeaderboard (score: Int) {
    leaderBoardEntries.append(LeaderBoardEntry(score: score, date: Date()))
    leaderBoardEntries.sort { $0.score > $1.score }
  }
}

struct LeaderBoardEntry {
  let score: Int
  let date: Date
}
