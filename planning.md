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

As to a plan of attack, I think I'm going to do the page layout first. This
will set up a sample board. Then I'll write the main app. Exactly how that
will go work remains to be planned.

## Layout and Design Plan

