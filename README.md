<h1 align="center">Who Wants To Be A Milionaire?</h1>
<p align="center">Train your brain with this little game.</p>

![](https://img.shields.io/badge/platform-iOS-000000?style=flat&logo=apple&logoColor=white)
![](https://img.shields.io/badge/Swift%205.7-FA7343?style=flat&logo=swift&logoColor=white)
[![GPLv3 License](https://img.shields.io/badge/License-GPL%20v3-yellow.svg?style=flat)](https://opensource.org/licenses/)

# Screenshots

<span>
    <img src="https://user-images.githubusercontent.com/90601277/223105708-4db4d65a-d1b0-4f56-8fc4-5e12f45ed0ff.png" width="160px">
</span>
<span>
    <img src="https://user-images.githubusercontent.com/90601277/223105716-9a2d9ab9-9cea-4ecd-a37d-0324ce876d00.png" width="160px">
</span>
<span>
    <img src="https://user-images.githubusercontent.com/90601277/223105731-88f1e4cd-9f8f-481a-a6fd-56dbd3f0e1dc.png" width="160px">
</span>
<span>
    <img src="https://user-images.githubusercontent.com/90601277/223105746-6dd7213e-e705-4feb-b0f6-2732684f2920.png" width="160px">
</span>
<span>
    <img src="https://user-images.githubusercontent.com/90601277/223105761-1e2f6d09-da6a-48b2-a21f-435103c5607e.png" width="160px">
</span>

    
## There are 6 patterns used in this project:

### 1. Delegate
    Data from GameScene goes to Game singleton via delegate.
### 2. Singleton
    'Game' singleton stores current session and records data.
### 3. Memento
    All the records and user's questions database are stored locally in UserDefaults.
### 4. Strategy
    Difficulty options are implemented with Strategy pattern.
### 5. Facade
    Strategies are hidden from GameScene with Facade pattern.
### 6. Builder
    Adding user's questions is implemented with Builder pattern.
