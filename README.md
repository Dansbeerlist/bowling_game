INSTRUCTIONS:
1. Open your terminal and navigate to the bowling directory.
2. Open irb by typing the following into the terminal: irb 
3. Load the scorer.rb file by typing the following into the terminal: load "scorer.rb"
4. Enter your bowling score by creating a new Scorer object:
   game = Scorer.new(your_score_arrays) 
   Example: game = Scorer.new([[4,3],[10],[4,5],[1,3],[0,4],[2,5],[8,0],[9,1],[6,2],[2,3]])
5. Get your scores by using the "scores" method: game.scores

ASSUMPTIONS: 
The scores are correct.
They don't break any rules.
The array of scores is for a complete game.
