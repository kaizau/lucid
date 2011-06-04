#Changelog

##v0.4.0 (6/4/2011)

After weeks of experiments, feedback from coworkers, and endless tweaking, Lucid is finally close to being ready for primetime. This update marks a major overhaul from previous versions:

* Media query support - `+grid-reinit` and interal refactoring now allows the user to redefine the entire grid inside media queries 
* Simplified usage
** No more `+row` - Lucid now uses float clearing to wrap grid elements (no more wrapping "row `div`s")
** No more `+col-gutterless` - this has been folded into `+column` as mixin parameter 
** Calcuator functions - grid values are now accessible through functions
** More semantic mixins, more sensible parameters
* Clearfix is configurable - `$grid-clearfix` can now be 'pie-clearfix', 'overflow', or 'false' (no clearfix)
* Internal mixins are no longer dependent on global variables, everything is passed by public mixins
* Documentation added to README

##v0.3.0

* Added support for outer gutters (previously depended on the margins on individual grid elements)
* Added experimental `+grid-adjustment` for media query support

##v0.2.0

The dark ages.
