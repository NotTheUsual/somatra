# Somatra

Sample client app for [Soma](https://github.com/NotTheUsual/Soma), aiming to provide a personal health dashboard, centred on blood test results. Developed as part of a final project for Makers Academy with [Megan Folsom](https://github.com/mfolsom), [Makis Otman](https://github.com/Maikon) and [Jorja Hung](https://github.com/jorjahung). The name probably isn't as funny as we think it is.

## What it does

Somatra takes tracks blood test data, using the Soma API. You sign up with Somatra and input blood test data which is stored by Soma. Then this data (along with analysis as to whether individual tests are within acceptable ranges or not) is requested by the different views of the client. Here, we use D3.js to display this data in a variety of interesting graphs, alongside standard tables (albeit tables highlighted to help you make sense of the data). The idea is to try to contextualise the data you receive from a blood test (should you need one), making a sea of random numbers into something clearer.

On top of this, to give examples of other possible additions to the dashboard, we let you track your mood, and tell you roughly how you've been feeling recently. We also integrate the Moves API, to track your activity. More information means everything makes a bit more sense. Also, you can input your blood test results using your voice.

## How it does what it does

Somatra is a Rails app, tested with Rspec and Cucumber, written with Sass, ERB and JS (and, you know, Ruby). We used Devise for user authentication; Gravatar for user information (name/avatar); Wit for voice input; Sentimental for mood tracking; HTTParty to help process API outputs; the Moves API for Moves data; D3.js for all the lovely graphs and Tesco for far too many snacks.
