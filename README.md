Description
===========

Configures the default gem binary location for gem packages without a specific
gem binary. This avoids picking up the default gem binary from the embedded
Ruby installation, in the case of omnibus Chef stacks, or the system-wide
packaged Ruby.

Requirements
============

No additional dependencies.

Attributes
==========

* `node[:gem_binary]`

  Path to the gem binary. Use this, the default cookbook recipe tells Chef to
  construct the correct alternative gem environment when installing gem
  packages.

Usage
=====

Set up the `node[:gem_binary]` attribute for your node. Do this either upfront
or as part of another recipe. Then include `recipe[gem_binary]` to set up the
appropriate gem environment for all gem packages.

