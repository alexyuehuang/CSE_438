# iOS_Development
This repo contains all my work in iOS Development, for the class CSE 438. All work is in Swift. 

# Lab 1
This lab implements a simple shopping calculater. 

In this lab I implemented an additional feature where you can get the tax rate by the state you’re in. To use this feature, simple scroll down the picker view and select your location from a list of states, and it will give you the estimated tax rate of that state. 

I implemented this feature by introducing an UIPickerView that displays the three states to choose from. The list of states can also be easily changed by editing an array called pickerData. Depending on the state we choose, we change the value of UITextField taxRate to corresponding values. 

I implemented this feature because it is very common that people don’t know the exact tax rate of their state, which can be troublesome when getting the total price. With this final feature, users could be better informed of their tax rates. 

# Lab 2
This lab includes a petting app, in which you can feed or play with a variety of pets. 

In this lab I implemented an addition feature where you can hear the sound of your pet. The sound was activated whenever the program launches or when the user chooses another pet. 

I implemented this feature by downloading and adding mp3 files online, then introducing AVFoundation, I also defined a variable that is an AVAudioPlayer. Then the files from the folder was streamed in and played the file whenever a new pet was chose. To achieve that I also defined a new function that plays the file with the name matching the input. 

I implemented this feature because it provides audiences with a very personal experience. By including the voice, the pet becomes more lifelike to the audience. It also improves the functionality of the application, making it more interesting. 

# Lab 3
This lab includes a drawing app, and the user is able to choose color and width of the line. 

In this lab I implemented two additional features, the first one allows you to download your painting as a picture to the phone’s gallery, and the second allows you to import pictures from the gallery and show the picture on the drawing canvas. Both features are activated by buttons on the top. 

I implemented this feature by adding UINavigationControllerDelegate, UIImagePickerControllerDelegate interfaces to my app. The import function involves initializing an UIImageView and expanding that image view every time I need to display photos. I also used UIImagepickerController to get the image and to display it on the image view. In the second feature I first implemented a method to take screenshot of the canvas CGRect, and then make it save the image to Photo Album. I created buttons for both things, and when it was pressed I call the needed functions. I also changed the info.plist to allow the app to import and export things from the phone storage. 

I implemented this feature because it is very common that the user wants to import or export files. By adding export, the user can download and share his/hers artwork and enjoy it indefinitely. By adding import, the user can edit existing files, so it can work as a simple version of photoshop. It also improves the functionality of the application, making it more interesting and useful at the same time. 

# Lab 4
This is a Movie search app, using the TMDB database. The user can search for any movie, check basic informations for that movie, and mark as favorite. 

In this lab I implemented three additional features. The first one allows you to see the trailer for the movie, which is activated by clicking a button in the movie description page, above the “favorite” button. The second one allows you to search for movie theaters near you, which is activated by a button in the main page near the search bar. The third one allows you to filter the top movies by language and by time. Selecting a different year means searching for top movies in the selected year, and selecting a different language shows the overview in that language. The all time favorites also loads when the app is loaded. This feature is activated by a picker in the main page. 

I implemented the first feature by finding the video path in the TMDB database API, and then pushing a new ViewController with WKWebView in it. The webview displays a youtube page with the trailer in it. If no video is found, we return a page that says so. I implemented the second feature by opening a new page with a WKWebVIew that displays the google map view which searches the user’s nearby area for “movies”. I implemented the third feature by first adding two UIPickerview which displays the languages and years respectively. If a specific row of the picker view is selected, I request the TMDB database API to filter through the given conditions, and then refresh the display. 

I implemented the first feature because the users would be very interested to know about the details of the movies that they’re interested, so would want to see the trailer of the movies they’ve selected. I implemented the second feature because the users would like to see the top movies, if they are interested, and now they can check for nearby cinemas within the app. I implemented the third feature (time) so that the users can see the important movies of each year, thus getting more information about each years’ hits. The third feature (language) is intended for audiences that want to know about the movie in other languages. 

# Lab 5
In the last lab I collaborated with a team to acheve an AR music visualizer app. Details of the app can be found at: https://bitbucket.org/Martin_Cepeda/musicar/src/master/




