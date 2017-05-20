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
first place, etc. Then, more interesting pedagogically for me now will be
the JavaScript magic. E.g., when someone clicks a peg, it should both change
color *and* change a color attribute that will be submitted to the server.
This shouldn't be too complicated since Mastermind isn't very complicated.
Then there's other JavaScript stuff, such as checking (before submitting) that
all the pegs have been chosen (or maybe that won't be a requirement).

As to a plan of attack, I'm going to do the logic first, because I need to get
through more of the JavaScript book before I can really use JS properly. I'm
very close but maybe not quite there with the DOM and event handling.


## General Requirements

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

### Narrowing Down the Plan

I say 3-5 holes and 6-8 colors, but I think I'm going to start with 3 and 6,
just to make things simple. I'll try to write classes, the design, etc., so
that it is not opinionated about these numbers, however. Maybe I'll make "3"
and "8" global variables or something, which can be easily reset later.

### Layout and Design Plan

I want this to be fully responsive, so I'll design for both mobile and big
displays. There will be a header and footer (just so I can get general
experience with those) and some hideable instructions, along with the
above-described available color pegs on the side. The game board itself can
probably be designed as a table, although I will probably use Bootstrap for
that. The solution will go on top, and then below that will go the player's
guesses, appended to the top.

### The Server

The server should, as I said, be fairly simple. The GET method accepts game
data,probably a hash containing previous guesses (an array of colors), and then
the evaluation of these, which can be a two-item array: number of black, then
number of white. The POST 'move' method puts into the params hash the player's
most recent guess. An array of older guesses (and results) should be available
in Sinatra session data. A POST 'new' method simply restarts the game.

### The Methods

There are several methods needed:
* new_game: initializes game
* new_solution: creates solution
* test_solution: given a solution and a guess, output results

Those are the main ones.


## Technical Requirements

### Main Server File

* If no game is running, then initialize game.
* The GET root method should, if no game is running, pass a code to the
browser.
