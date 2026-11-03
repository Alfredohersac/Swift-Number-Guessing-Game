class Player {
  var name: String = ""
  var age: Int = 0
  var score: Int = 0
  var isPlaying: Bool = true

  func showInfo() {
    print("Name: \(name)")
    print("Age: \(age)")
    print("Score: \(score)")
    print("Playing: \(isPlaying)")
    
  }

  let secretNumber = Int.random(in : 1...100)


  func checkGuess(guess: Int) -> Bool{
    if guess == secretNumber {
      print("You Win!")
      return true
    }else if guess > secretNumber {
      print("Too High")
      return false
    }else{
      print("Too Low")
      return false
    }
    
  }

  func startGame() {
    while isPlaying {
      score += 1
      let guess = Int(readLine()!)!
      if checkGuess(guess : guess) {
        isPlaying = false
      }
      }
    print("Your attempts: \(score)")
    }

  func getGameResult() -> GameResult {
    return GameResult(
      playerName : name,
      attempts : score,
      isWinner : !isPlaying
    
    )
  }


  func addScore(points: Int) {
    score += points
}

  func addScore(points: Int, bonus: Int) {
    score += points + bonus
}
  
  }

struct GameResult {
  var playerName: String
  var attempts: Int
  var isWinner: Bool
}



class VIPPlayer : Player {
  override func showInfo() {
    print("VIP Player: \(name)")
    print("Score: \(score)")
    print("Status: Premium")
  }
  
}

var results : [GameResult] = []

let player1 = Player()
player1.name = "Ali"
player1.age = 20

let player2 = Player()
player2.name = "Murad"
player2.age = 22

let player3 = Player()
player3.name = "Samir"
player3.age = 19


player1.startGame()
results.append(player1.getGameResult())

player2.startGame()
results.append(player2.getGameResult())

player3.startGame()
results.append(player3.getGameResult())



var min = results[0].attempts

for result in results {
    if result.attempts < min {
        min = result.attempts
    }

    if result.isWinner {
        print("Winner")
    } else {
        print("Lose")
    }

    print("Player: \(result.playerName)")
    print("Attempts: \(result.attempts)")
    print("Winner: \(result.isWinner)")
    print("-------------------")
}

print("Minimum attempts: \(min)")

print("===== BEST PLAYER =====")

for result in results {
    if result.attempts == min && result.isWinner {
        print("Winner: \(result.playerName)")
        print("Attempts: \(result.attempts)")
    }
}
