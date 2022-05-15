# Who Wants To Be A Milionaire?

## Description 

    Just a simple "Who wants to be a millionaire?" game.
    The main menu screen contains two buttons: 'Play' and 'Records'.
  
### 'Play'
    The first button will lead you straight to the game process.
    You will see a question and 4 answer options, if you'll choose the right one, the next question will appear. 
    There are 15 questions in the game, you can see your current score with the progress ladder on the right.
  
### 'Records'
    All your records are safely stored here, but if you want to get rid of it - 
    just press the bin icon in the top right corner.
  
###  You also have 4 lifelines:
    "50/50" - it will remove 2 wrong answers
    "Call a friend" - it will show you an answer from your AI friend. Be carefull, it can be tricky!
    "Ask the audience" - it will show you the poll, which should definitely help you with your choice.
    "Take cash" - are you happy with the result and don't want to take a risk? This one is for cash out!
  
## There are 3 patterns used in this game:

### 1. Delegate

  Data from GameScene goes to Game singleton via delegate.
  
### 2. Singleton

  'Game' singleton stores current session and records data.

### 3. Memento

  All the records are stored locally in UserDefaults.standard
