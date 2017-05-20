# Mastermind Planning

This implementation of the classic Mastermind game will be implemented online
using Ruby, Sinatra, JavaScript, CSS, SCSS, and Bootstrap, bringing together
skills I've learned over the past year.

## The General Plan

The plan here is to have a single-page app. The basic components of the system
will be a single erb view, an scss file, various needed images (maybe) in
public/images/, etc.

The app itself will live in a Sinatra-based Ruby file, referencing various
library files. The route blocks will resemble controller actions, and should
actually be fairly straightforward considering that there are very few things
that the user will be able to do with the server. (Just submit a new
configuration of pegs, presumably. The server will have a few different ways
to "talk back" to the user, perhaps.)

The main interest in the program will be in two places: the Ruby methods that
give the user feedback about peg configurations, that sets up the pegs in the 
first place, etc. Then, more interesting pedagogically for me now, will be 
the JavaScript magic. E.g., when someone clicks a peg, it should both change
color *and* change a color attribute that will be submitted to the server.
This shouldn't be too complicated since Mastermind isn't very complicated.
Then there's other JavaScript stuff, such as checking (before submitting) that
all the pegs have been chosen (or maybe that won't be a requirement).

As to a plan of attack, I think I'm going to do the page layout first. This
will set up a sample board. Then I'll write the main app. Exactly how that
will go work remains to be planned.

## Display Requirements

### General Gameplay

At the top of the screen—an image "covering" the solution. Below that, to
begin, is a series of 3-5 dark "holes" where "pegs" will go. Show the 6 or 8
available colors on the side of the board. The user cycles through the colors
simply by clicking the buttons; they always appear in the same order. After
the user has clicked all 3-5 holes, he submits the data to the server, which
evaluates and sends back data to display. This is shown as white and black
"pegs" on the side of the code guess. When the user guesses the code
correctly, the solution is "uncovered" and the user is congratulated with
a popup or something.

## Layout and Design Plan

I want this to be fully responsive, so I'll design for both mobile and 
big displays.
