description "A Compass/SASS grid for people who love semantics."

discover :all

help %Q{

***

THE LUCID GRID | HELP

SETUP

  @import 'lucid'
  @include grid-hooks;             // generate @extend hooks 


BASIC USAGE

  @include grid;                   // setup a new grid container
  @include row;                    // setup a new grid row 

  @include col(3);                 // grid element that spans 3 columns
  @include col(3, 2);              // shifted 2 columns to right
  @include col(3, 2, 20px);        // subtract 20px from `width` to adjust for borders/padding
  @include col-gutterless(5, 2);   // "gutterless" element, identical usage to `col()`
  @include col-widthless;          // adds float and gutters only (useful for aligning headers, etc.)

  @include grid-classes;           // generate .g* classes to use in markup
  @include grid-classes(true);     // generate .g* and .gl* (gutterless) classes

  @include grid-adjustment($n);    // reduce container to $n columns (width)

***

For the full docs, visit [http://yifei.co/lucid]
To view the source, visit [https://github.com/ezYZ/lucid]

}

welcome_message %Q{

***

THE LUCID GRID
plugin by Yifei Zhang

Congrats! Your project templating life is about to become a lot saner.

For examples and documentation, visit:
http://yifei.co/lucid

Contribute on GitHub: 
https://github.com/ezYZ/lucid

***

}
