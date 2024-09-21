
![logo](https://github.com/rob3rtu/JustTrivia/blob/main/readme_images/logo.png?raw=true) 

# JustTrivia - A Flutter mobile app made for fun

I made this app to learn more about Flutter and to explore Firebase tools. 

The app is a trivia battle, where you create a room to play with a friend, and the winner is the one who answer correct to more questions.



## 🔐 Login Screen

![login screen](https://github.com/rob3rtu/JustTrivia/blob/main/readme_images/login.jpeg?raw=true)

This one is not in the original design because I had no ideea at the moment how I wanted it to look like, so I did a little freestyle. A user can log in with an email an a password or with his Google Account. Fot this I used the Authentication functions from Firebase.
## 🏠 Home Screen

![home screen](https://github.com/rob3rtu/JustTrivia/blob/main/readme_images/home.png?raw=true)

This is the home screen, with the main features: 
- play online
- play with a friend
- question of the day

Due to the lack of time and motivation, just a part the "Play with a friend" was implemented :(
## 🏠 Home Screen

![home screen](https://github.com/rob3rtu/JustTrivia/blob/main/readme_images/home.png?raw=true)

This is the home screen, with the main features: 
- play online
- play with a friend
- question of the day

Due to the lack of time and motivation, just a part the "Play with a friend" was implemented :(
## 🏠 Home Screen

![home screen](https://github.com/rob3rtu/JustTrivia/blob/main/readme_images/home.png?raw=true)

This is the home screen, with the main features: 
- play online
- play with a friend
- question of the day

Due to the lack of time and motivation, just a part the "Play with a friend" was implemented :(
## ❓ Question Screen
![code](https://github.com/rob3rtu/JustTrivia/blob/main/readme_images/code.png?raw=true)

![question screen](https://github.com/rob3rtu/JustTrivia/blob/main/readme_images/question.png?raw=true)

For matches I used Firebase Firestore in order to syncronize the users. Initialy a "room" is created qith a given ID, which is the 4 characters long string required for the second user in order to join the match.

Unfortunately, this part was only managed in Firebase Console; I dropped the app at this point because I realized from now on the most part was to populate the Firestore DB with questions and that would be a very repetitive job.
## Others

The profile and settings screen were also implemented and fully functional, I did not include them here because I do not consider them to be very important, but they were helpful for me to master building UI in Flutter.




## Full Design

You can see the full design file of the app at the following [link](https://www.figma.com/file/o5TlVD3ZoELNXIguHAQpN1/Trivia-Game?type=design&node-id=0-1&mode=design).
