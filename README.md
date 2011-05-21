#The Lucid Grid

Currently in early development. Comments/suggestions welcome!

###Lucid is for developers who:

* Like lean stylesheets. 
* Think using "alpha" and "omega" is a hacky solution.
* Hate fighting with gutters to get their layouts aligned.
* Want to apply borders and padding to grid elements without wrapping `<div>`s.
* Want a grid that plays nice with @media queries. 

###Developer's Notes:

* Lucid uses @extend internally to prevent the CSS duplication that can happen with too many @includes.
* Documenation is coming soon.

###Instructions:

`(sudo) gem install compass-lucid-grid`

THEN

`cd your_existing_project`
`echo "require 'lucid'" >> config.rb`
`compass install -r lucid lucid`

OR

`compass create -r lucid --using lucid your_new_project`
