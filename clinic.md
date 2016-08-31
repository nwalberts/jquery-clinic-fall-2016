The following is adapted from my mentor, Elise Fitzgerald & from fellow coder Jenn Eng!

#Intro to jQuery Library

jQuery is a JavaScript library. jQuery is a fast, small, and feature-rich JavaScript library. It makes things like HTML document traversal and manipulation, event handling, animation, and Ajax much simpler with an easy-to-use API that works across a multitude of browsers.

There is also another extension library called jQuery UI that provides some nice effects and methods for enhanced user experiences.

## Where to Start: New Learning Center!
jQuery is a very popularly used library and beyond documentation the authors of jQuery have launched a (beta) Learning Center that approached documentation in beginner friendly way.

####Cautionary Tale
Everything you can do in jQuery is written with regular ([sometimes jokingly called "vanilla"](http://vanilla-js.com/)) JavaScript. Therefore, understanding the fundamentals of JavaScript as a language (its constructs and syntax, its orientation to particular programming concepts) is *important* (it's not just us telling you - [the learning docs even say so!](http://learn.jquery.com/about-jquery/)) in order to effectively use jQuery. You want to be careful not to use jQuery as a crutch to avoid engaging with the internals of JavaScript and instead use it as a tool to expedite your work.

## How to set up in a Rails

`rails new` and done!

Rails comes with jQuery included as well as jQueryUI.

## In Sinatra

If you are adding it in a Sinarta app, you can check out this [repository](https://github.com/mlg-/space-tacos) for directions.

There are two key ways:
  - download from the [documentation.](http://api.jquery.com/)
  - include link from [Google Hosted Libraries](https://developers.google.com/speed/libraries/)

## Using FireQuery

I've yet to find an equivalent for Chrome, but Mozilla has a nifty extension called FireQuery which you can use
with the Mozilla developer tools if you really want to start using jQuery elements on any old webpage.

[FireQuery](https://addons.mozilla.org/en-us/firefox/addon/firequery/) adds a lot of neat jQuery features, but what I love about it is that it also injects jQuery into the webpage you are on so that you can navigate the DOM using jQuery rather than those old fashioned vanilla js methods.

### Note on Syntax
The `$` is the same as including `jQuery` before the selector. For example, `$('h2')` is the same as `jQuery('h2')` the `$` here denotes the library. jQuery being among the most popular libraries it's safe to include the dollar sign in all referees. But be aware that other libraries may also use the `$` which could through you errors down the road or a namespace collision, at which point you should refer to the jQuery [documentation on this topic](http://learn.jquery.com/using-jquery-core/avoid-conflicts-other-libraries/).

## First grab the jQuery object
There are a number of ways to "grab" selectors from the DOM, notice the similarity to css:    
  - By id `$("#kale");`
  - By class `$(".top-bar");`
  - By element `$("h1");`

#### Assigning a jQuery object to a variable
You can assign any element you select with jQuery to a variable and then call jQuery methods on it.

```js
var kale = $('#kale')
kale.hide();
```
#### Pro-tip: Don't mix with Vanilla JS

When "grabbing" elements from the DOM with jQuery we are returned jQuery objects. We can call jQuery effects and events on jQuery objects but not if we "grab" them with JS.  The below results in an error:

```js
var vanilla = document.getElementById("kale")
vanilla.hide();
// => Uncaught TypeError: vanilla.hide is not a function(…)
```

## Then have fun with that object
To get some inspiration and decide what to do once you grab the item or items you want from the page, check out the [jQuery API documentation](http://api.jquery.com/).

### Hiding an element

`$("#white-powder").hide();`

[`hide()` documentation](http://api.jquery.com/hide/)

### Showing an element

`$("#white-powder").show();`

[`show()` documentation](http://api.jquery.com/show/)

### GET FANCY! FADE OUT!

`$("#neil-gaiman").fadeOut();`

[`fadeOut()` documentation](http://api.jquery.com/fadeOut/)

### Changing the styling of element(s)

`$("h1").css("color", "teal");`

[`css()` documentation](http://api.jquery.com/css/)

or maybe:
```
$(".top-bar").addClass("new_class");
$(".top-bar").addClass("feature");
```
Why did the top bar disappear? let's take a look at the css for the class "feature"

[`addClass()` documentation](http://api.jquery.com/addclass/)

### Remove an element and then append it somewhere else

```
var wormhole = $('#wormhole').remove();
$('.resources').append(wormhole);
```
Remove is different from hide, remove takes it out of the DOM

[`remove()` documentation](http://api.jquery.com/remove/)

[`append()` documentation](http://api.jquery.com/append/)

### Append something new to a list
```
var demogorgon = "Demogorgon"
$(".resources").append("<li>" + demogorgon + "</li>")
```
## How to use within Rails & Sinatra
Good practice to add files for different features but that's where you can run into some issues. For the app size you guys are using it's good to keep in one file for now.
  - Let's look at our set up
  - We have a `application.js` linked in our layout

### PRO-TIP ALERT: `$(document).ready();`
Loading your JavaScript at the bottom of the page will help you avoid trying to manipulate elements that aren't yet loaded onto the page, but `$(document).ready();` is an insurance policy against this problem. It's particularly useful for images or other content which may load after a js file at the end of the `<body>` or in the `<footer>`.

It's best to only use one or fewer `$(document).ready();` in your js file as you get started. While technically you *can* use more than one, it is slightly slower (an optimization concern), more verbose (a style/readability concern) and arguably harder to debug (a developer experience concern). It also gets you into the habit of organizing your code into discrete functions.

```js
function someFunction(){
  //do a thing;
};

function someOtherFunction(){
  //do some other thing;
};

$(document).ready(function(){
  //someFunction();
  //someOtherFunction();
});
```
## Let's Try it Out!
Let's add these features:

####Toggle the form

```js
$("#comic-book").click(function() {
  $("#comic-book img").toggle();
});
```
### Append something new to list from form field, reset field
```
$("#thing-button").click(function() {
  var newThing = $("#thing-name").val();
  $("ul").append("<li>" + newThing + "</li>");
  $("#thing-name").val("");
});
```

Notice how the above syntax for grabbing the value is different syntactically then vanilla JS.  The last line resets the name field to be an empty string.  If you refresh the page, whatever you added will be lost because we did not add it to the database so the data was not able to persist...BUT... stay tuned for AJAX :)
Side note: you'll notice the item was added near the top bar as well, this is because there's a ul in my topbar so $("ul") is selecting both unordered lists in the DOM, just an fyi.
Also keep in mind, we could have executed ALOT more code in here! More often than not, you'll use jQuery to listen to specific events, then combine it with vanilla JS to do
some manipulation of the objects that jQuery might return, and then when done change how
the DOM looks on the page to reflect a change. Often times you'll even use AJAX.

Common Event Listeners
```
click()
bind()
preventDefault()
scroll()
etc.
```

Nearly any event you can think of! Note, most are variants of the `.on` method!

### Packages

So you've fiddled around with jQuery. You realize that it was rather convenient
that we could just download jQuery right into our app with a simple file and script.

What's more, you are wondering: Nick dawgy dawg, I noticed that jQuery is probably just one of MANY libraries out there that can beef up our application. What, if anything is out there, and how do I add it to my application, yo?

- rails gems abound that include these libraries, and you can simply add some to your Gemfile and bundle to add their functionality!
- some few are hosted on the CDN like jQuery
- some you can simple download a few JS files into your app but...

### npm package manager
- bundler/rubygems (client, website, registry)
- especially if this libraries have dependencies, or need to be regularly updated, you'll
want something to manage the versions of these libraries for you, and have them quickly be
installed in your app
- npm allows us to quickly add these libraries/packages, because it hosts them on the npm website,
much like Ruby hosts their gems on THEIR website

A few libraries...
- lodash: takes the hassle out of working with arrays, unless you looovvvee the current way
- underscore: EVEN MORE awesome functions that you can call on arrays and objects
- react: thats right....its a library. It has oodles of things you can call on, but it is up to you

library vs framework
- library adds features and chunks of code that you can call on when needed
- a framework requires that you add code in specific places according to accepted conventions, and then calls on THAT code.
MM
