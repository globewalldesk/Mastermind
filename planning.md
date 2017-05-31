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

#### Server-side Methods

There are several basic game logic methods needed:
- [x] Game.new: initializes game
- [x] set_code: creates solution (initialized when Game is created)
- [x] evaluate_guess: given a solution and a guess, output results

### The CSS & JavaScript Logic

#### Layout Tasks

The layout will have the following tasks:

- [x] Create header, footer, and main section.
- [x] Use Pencil to sketch the board.
- [x] Create a static design of the board HTML/CSS/Bootstrap.

#### Input Pegs

There are many possible ways to display the color options to the user using
JavaScript or CSS. I could have something pop up on hover, but that sounds both
difficult and potentially buggy. (There are probably libraries that do that,
and I haven't learned any of them.) So instead I'll just click to cycle through
colors. Clicking will call a JS function that will change the `name` and
styling attributes of the peg in question (which will have an ID). Then, when
the user submits the guess with a button, first, a comma-separated string will
be prepared and inserted into params[:guess].

- [x] The above is done.

#### Displaying Old Guesses

For each of the Game.guesses, I will want to display it in its own row. Note
that the buttons must be small enough (or else resized) so that six across plus
the black&whites (or, in the same space, a submit button) can fit on a portrait
oriented phone.

The look of the pegs will be designed using CSS. In the right place, the guess
color will be supplied. (E.g., gamehash.guesses[0][:guess][0] will represent a
specific color.)

The black & white evaluation pegs will be smaller, also designed using CSS, and
put off to the side. Remember that you should make room for up to six (really
five) of these evaluation pegs. These will be displayed with black first, then
white. After that, a "hole" jpg will be shown.

- [x] Each old guess is displayed on its own row.
  - [x] Iterate each guess.
  - [x] Iterate each old peg.
  - [x] Iterate result pegs.
- [x] Make sure the logic does not depend on precisely three pegs, but gets this
  from gamehash.codelength.

### Winning and Losing

Winning actually will require showing the covered up, then uncovered. This
requires a new design for the covered-up solution. In addition, there will have
to be some snazzy way to tell the user that he's won, and to invite a new game
(and to ensure that the user can't continue guessing after winning). Finally,
the user will have to be able to lose!

- [x] Announce winner.
- [x] More attractively.
- [x] Disallow user from continuing to guess after winning.
- [ ] Show "covered up solution."
- [ ] Allow user to lose.

### Final Improvements
- [x] Show link-style hand when hovering an active peg.
- [x] Show (always in the same place) color choices when the user hovers an
      active peg.
- [x] Add a collapsible instruction bubble. Save collapsed state in session as
      necessary.
- [ ] Different users use different sessions.
- [ ] Add integration tests!
- [ ] Add two new colors for four-peg game.
- [ ] Add empty holes to the results board.
- [ ] Restrict number of turns; put turn numbers next to each.
- [ ] Enable the user to choose between 3 and 4 rows, and to start a new game.
- [ ] Move name, copyright, etc., to <footer> as practice for that.
- [ ] Add column info for Bootstrap.
- [ ] Check your resources that all needed HTML tags etc. are there; validate.
- [ ] Add everything you've learned to SuperMemo.
- [ ] Refactor everything.
