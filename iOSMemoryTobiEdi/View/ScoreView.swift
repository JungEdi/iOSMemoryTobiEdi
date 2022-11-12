import SwiftUI

struct ScoreView: View {
    var highScore: Int
    var currentScore: Int
    let highScoreSize = CGFloat(12)
    let currentScoreSize = CGFloat(24)
    
    var body: some View {
        HStack{
            Text("Current Score: " + String(currentScore))
                .font(.system(size: currentScoreSize))
            Spacer()
            Text("High Score: " + String(highScore))
                .font(.system(size: highScoreSize))
        }
    }
}
