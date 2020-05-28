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
