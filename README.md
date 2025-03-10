# Bowling Challenge

## Task

Count and sum the scores of a bowling game for one player (in Ruby.

A bowling game consists of 10 frames in which the player tries to knock down the 10 pins. In every frame the player can roll one or two times. The actual number depends on strikes and spares. The score of a frame is the number of knocked down pins plus bonuses for strikes and spares. After every frame the 10 pins are reset.

I approached this challenge by using a test driven approach. I created the unit and feature tests with Jest.

Create a domain model and diagram from the user story
Create a failing test (red) in Jest
Develop code to result in a passing test (green)
Refactor the code and re-test (orange)

I created this challenge in Ruby. However, my code for this challenge is flawed as it could not pass a perfect game, and the design of the code made it difficult to bugfix. Therefore when I re-visited this challenge (in JavaScript), I invested time into planning and redesigning the scorecard from scratch to improve the structure of my code and apply better concepts such as Single Responsibilty Principle.

<a href="https://github.com/Conor-Developer/bowling-challenge-js" target="_blank">You can find my JavaScript version here</a>

## Getting started

git clone path-to-repo

# Test Code

Run rspec from the root directory to test the code

# Run

1. Type 'irb' and press enter from the root directory
2. Command: require './lib/game.rb'
3. Command: game = Game.new
4. Command: game.calculate_total_score(**enter number between 1 - 10**)
5. Continue adding scores to the scorecard
6. To view your score:
7. Command: game.total_score

# Ten Pin Score Example

![Ten Pin Score Example](images/example_ten_pin_scoring.png)
