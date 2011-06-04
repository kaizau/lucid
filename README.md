#Lucid: A _smarter_ CSS grid for Compass

###Philosophy and Killer Features

CSS grids make web development easier... except when they don't. 

Wrapping `<div>`s, `.alpha` `.omega` madness, and fighting with gutters to get layouts aligned... These are the compromises that developers are forced live with.

But NOT anymore. Lucid makes full use of [SASS](http://sass-lang.com/) and [Compass](http://compass-style.org/) in order to make CSS grids sane again.

Not only does it match other grids in functionality, but it also comes with a handful of unique features:

* Adjust grid dimensions / number of columns instantly through variables (as with all SASS grids)
* Add borders and padding _directly to your grid elements_ without using nested `<div>`s
* Use "gutterless" grid elements for nesting and precise styling
* Cater to multiple screen widths by reconfiguring Lucid inside media queries
* Achieve leaner compiled CSS than other SASS grids, due to Lucid's internal [@extend](http://sass-lang.com/docs/yardoc/file.SASS\_REFERENCE.html#extend) logic

Go ahead! Judge for yourself:

#Installation

```bash
(sudo) gem install compass-lucid-grid
compass help -r lucid lucid
```

Then

```bash
cd your_existing_project
echo "require 'lucid'" >> config.rb
compass install -r lucid lucid
```

Or

```bash
compass create -r lucid --using lucid your_new_project
```

(Note: Creating a project with Lucid does not generate the default Compass stylesheets, only the `\_grid.scss` partial.)

#Documentation

###Setup 

After installation, @include '_grid.scss' or copy its contents into your base file. It should look something like this:

```scss
// Remove the following line if Compass has already been included
@import "compass/utilities/general/clearfix";

// Grid dimensions
$grid-width: 990px;
$grid-columns: 12;

// The amount of margin to apply to each side of a grid element
$grid-gutter: 15px;

// The distance between the grid container and the first grid element
$grid-outer-gutter: 15px;

// Use "pie-clearfix", "overflow", or "none"?
$grid-clearfix: "pie-clearfix";

// Center rows?
$grid-centering: true;

// Include Lucid
@import 'lucid';

// Output 4 CSS classes that Lucid uses as @extend "hooks"
@include grid-init;
```

### Basic Usage

Now we're ready to style:

```scss
/* SCSS */

.container {
  @include container;     // defines grid container
  background: blue;

  .sidebar {
    @include columns(3);  // 3 column element
  }

  .main {
    @include columns(9);  // 9 column element
  }
}

.another-container {
  @include container;     // yet another container
  background: red;
}


/* Compiled CSS */

.grid-container,
.container,
.another-container {
  // container styles
}

.grid-clearfix,
.grid-container,
.container,
.another-container {
  // clearfix styles
}

.container {
  background: blue;
}

.another-container {
  background: red;
}

.grid-element,
.container .sidebar,
.container .main {
  // float: left, display: inline, and styles common to all grid elements
}

.container .sidebar {
  // 3 column width
}

.container .main {
  // 3 column width
}
```

Did you get that?

Instead of applying styles directly to each grid element, whenever possible, Lucid groups grid selectors that contain the same styles.

This results in MUCH leaner compiled CSS, as it avoids needless repetition.

###Using with Borders and Padding

With other grids, styling an inner `<div>` is often the cleanest method to accomodate borders and padding, since it preserves the width of the grid element:

```html
<div class="container">
  <div class="wrapper">
    <div class="safe-to-style">
      <!-- content -->
    </div>
  </div>
</div>
```

```css
.wrapper {
  // grid float, width, styles
}

.safe-to-style {
  border: 1px solid #ccc;
  padding: 19px;
}
```

With Lucid, this practice is no longer necessary, as you can adjust the width of grid elements individually! Just add your total borders / padding together and pass it as a mixin parameter. Like this:

```html
<div class="container">
  <div class="look-ma-no-wrapper">
    <!-- content -->
  </div>
</div>
```

```scss
.look-ma-no-wrapper {
  @include columns(3, 40px);  // (1px + 19px) * 2

  border: 1px solid #ccc;
  padding: 19px;
}
```

Note, adjusting the width of a grid element means that nesting other grid elements within is no longer guaranteed to add up correctly. You *can* make use of Lucid's `+grid-reinit` to define a new inner grid however!

###Gutterless Elements

Sometimes, it's convenient to have grid units without gutters. For example, when you want to nest elements within other elements:

```scss
.gutterless {
  @include columns(9, 0, false);

  .nested {
    @include column(3);
  }

  .also-nested P
    @include column(6);
  }
}
```

#Advanced

###Adapting to Media Queries

Lucid uses pixels, which means that it's a fixed-width grid (percentages aren't precise enough). Fortunately, this doesn't mean that your sites have to be fixed-width:

```scss
@include grid-init;

// full width grid
.container { @include container; }
.sidebar { @include column(3); }
.main { @include column(9); }

@media screen and (max-width: 480px) {

  // redeclare one or more variables
  $grid-width: 480px;

  // outputs a single modified @extend hook
  @include grid-reinit;
  
  // same proportions as before, just smaller!
  .container { @include container; }
  .sidebar { @include column(3); }
  .main { @include column(9); }

}

###Modifying @extend Hooks

As mentioned before, Lucid used @extend internally to achieve leaner stylesheets. In order to do this, `+grid-init` outputs four benign classes for @extend to "hook" onto. These classes can be modified (defaults shown):

```scss
$grid-hook-clearfix: ".grid-clearfix";
$grid-hook-container: ".grid-container";
$grid-hook-element: ".grid-element";
$grid-hook-gutterless: ".grid-column-gutterless";
```

###Unsemantic Class Names

For testing purposes, or for those who are unwilling to part with old ways, Lucid provides a class name generator mixin:

```scss
// outputs .g1 => .g#
@include grid-classes;

// outputs gutterless classes in addition (.gl1 => .gl#);
@include grid-classes(true);

// change the class prefix (outputs .grid-1 => .grid-# and .gutterless-1 => .gutterless-#)
@include grid-classes(true, 'grid-', 'gutterless-');
```

