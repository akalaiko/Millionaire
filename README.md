# Who Wants To Be A Milionaire?

## Description 

    Just a simple "Who wants to be a millionaire?" game.
    The main menu screen contains three buttons: 'Play', 'Records' and 'Add question' + Difficulty options.
### Play
    The first button will lead you straight to the game process, but first it will ask for your name 
    (I bet you want your perfect score to be in Records table under your name, right?)
    You will see a question and 4 answer options, if you'll choose the right one, 
    the next question will appear. There are 15 questions in the game, 
    you can see your current score with the progress ladder on the right.
### Records
    All your records are safely stored here, but if you want to get rid of it - 
    just press the bin icon in the top right corner. BTW, records are splitted into 3 lists by difficulty.
### Add question
    You can add your questions to the database here. Up to 3 questions can be added at a time.
    You can also manage your database, just use the button in the top right corner.
    Clear the database using trash bin button or delete 1 question by swiping to the left on it.
### Difficulty options:
    There are 3 options:
    Easy - you will get an easy questions set + all the lifelines.
    Hard - you will get a difficult questions set, but you still get all the lifelines.
    Insane - here you have a difficult questions set + you have only 'Take cash' lifeline.
### You also have 4 lifelines:
    "50/50" - it will remove 2 wrong answers
    "Call a friend" - it will show you an answer from AI. Be carefull, it can be tricky!
    "Ask the audience" - it will show you the poll, which should help you to choose.
    "Take cash" - happy with the result? Don't want to take a risk? Just cash out!
    
## There are 5 patterns used in this game:

### 1. Delegate
    Data from GameScene goes to Game singleton via delegate.
### 2. Singleton
    'Game' singleton stores current session and records data.
### 3. Memento
    All the records and user's questions database are stored locally in UserDefaults.standard
### 4. Strategy
    Difficulty options are implemented with Strategy pattern.
### 5. Builder
    Adding user's questions is implementer with Builder pattern
