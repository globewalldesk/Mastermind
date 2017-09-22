// This is a kluge...widens the .resultbox if codelength > 4.
function widenResultbox() {
  var resultbox = document.getElementsByClassName("resultbox");
  for (var box of resultbox) {
    box.style.width = "72px";
  }
}

// Wider board...wider result box.
if (codelength > 4 ) {
  widenResultbox();
}

// Set the width of the #guide...a super-kluge.
var guideWidth = 118;
switch (codelength) {
  case 2:
    guideWidth = 98;
    break;
  case 3:
    guideWidth = 118;
    break;
  case 4:
    guideWidth = 131;
    break;
  case 5:
    guideWidth = 133;
    break;
  case 6:
    guideWidth = 141;
    break;
}

// GLOBALS
var activeTarget = ""; // The peg ID that has been most recently clicked.

// Close instructions on click.
var instr = $("#instructions");
if (instr) instr.click(function(e) {
  e.preventDefault();
  var closeRequest = new HttpRequest("close_instructions", setInstructionsOff);
  closeRequest.send();
});

function setInstructionsOff() {
  document.getElementById("instructions").style.display = "none";
}

$("#guide").css("width", guideWidth + "%");


// Event listeners and logic for color switching.
// Toggle display of guide on click; prepareGuide if shown.
$(".active-cell").click(function(e) {
  var guide = $("#guide");
  // Set correct target. Clicking parent should select child.
  var target = $(e.target).hasClass("active-cell") ? e.target.childNodes[1] : e.target;
  // If guide is closed, open it and call prepareGuide. Also, set activeTarget.
  if (! guide.hasClass("guide-shown")) {
    prepareGuide(target);
    guide.toggleClass("guide-shown");
    highlightTarget(target); // Add a highlight of the target so the user knows it's the one tapped on.
    activeTarget = target;
  // If guide is open, and user clicks on the activeTarget, close the guide and remove cell listeners.
  } else if (target === activeTarget) {
    removeTargetHighlight(target); // Remove the highlight.
    removeCellListeners();
    guide.toggleClass("guide-shown");
  // Else if guide is open and user clicks on another target, keep guide open and refresh cell listeners.
  // Also, set the new activeTarget.
  } else {
    removeCellListeners();
    removeTargetHighlight(activeTarget); // Remove the old highlight.
    prepareGuide(target);
    highlightTarget(target); // Add a highlight of the target so the user knows it's the one tapped on.
    activeTarget = target;
  }
});

// Adds a ring around the peg cell the user tapped on.
function highlightTarget(target) {
  $(target).addClass("highlight");
}

// Removes the ring around the peg cell the user had tapped on earlier.
function removeTargetHighlight(target) {
  $(target).removeClass("highlight");
}

// Prepares guide. Prepares event handlers so clicking a peg creates a same-colored peg on the target.
function prepareGuide(target) {
  // Iterate color pegs; set each to activate peg on target.
  colors.forEach(function(color) {
    var guidecell = $("#guidecell-" + color);
    guidecell.click({target: target, color: color}, setTargetColor);
    guidecell.parent().click({target: target, color: color}, setTargetColor);
  });
}

// Remove existing event listeners previously assigned to guidecells.
function removeCellListeners() {
  // Iterate color pegs; remove event listeners.
  colors.forEach(function(color) {
    var guidecell = $("#guidecell-" + color);
    guidecell.off();
    guidecell.parent().off();
  });
}

// Actually changes the color (and hidden data) according to user selection from guide colors.
function setTargetColor(args) {
  var target = args.data.target;
  var color  = args.data.color;
  var num = target.id.replace(/.*(\d)/, "$1");
  target.className = "peg center-block " + color;
  $("#pegSubmit" + num).attr("value", color);
  highlightTarget(target);
}