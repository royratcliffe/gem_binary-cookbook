Description
===========

Configures the default gem binary location for gem packages without a specific
gem binary. This avoids picking up the default gem binary from the embedded
Ruby installation, in the case of omnibus Chef stacks, or the system-wide
packaged Ruby.

The default recipe automatically configures the `node[:gem_binary]` attribute
if and only if the node carries the `rbenv_rubies` attribute and it contains
just a single Ruby version. In such cases, assume that the node intends to use
the single Ruby environment as a default. This assumes that you use the
`rbenv_ruby` cookbook to install Ruby versions using Fletcher Nichol's `rbenv`
cookbook.

Requirements
============

No additional dependencies.

Attributes
==========

* `node[:gem_binary]`

  Path to the gem binary. Use this, the default cookbook recipe tells Chef to
  construct the correct alternative gem environment when installing gem
  packages. Note, this is the full path to the `gem` binary, _not_ the folder
  containing the binary.

Usage
=====

Set up the `node[:gem_binary]` attribute for your node. Do this either upfront
or as part of another recipe. Then include `recipe[gem_binary]` to set up the
appropriate gem environment for all gem packages.

