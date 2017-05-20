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
configuration of pegs, presumably.)
