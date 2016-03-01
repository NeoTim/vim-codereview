[![Travis Build Status](https://travis-ci.org/google/vim-codereview.svg?branch=master)](https://travis-ci.org/google/vim-codereview)

codereview is a plugin for interfacing with ongoing code reviews.

In this initial release, it only supports GitHub and only supports listing open
pull requests, but it will ultimately support viewing line comments inline in
vim and updating them straight from vim, and support additional code review
platforms such as Gerrit and Phabricator Differential.

For details, see the executable documentation in the `vroom/` directory or the
helpfiles in the `doc/` directory. The helpfiles are also available via
`:help codereview` if codereview is installed (and helptags have been
generated).

DISCLAIMER: This is not an official Google product.

# Commands

Use `:CodeReview {remoterepo}` to view pull requests / pending changes between
local and remote repo.

# Usage example

```vim
:CodeReview github:google/vim-maktaba
```
```
Viewing changes relative to remote github:google/vim-maktaba
Pulls:
  #60: Add maktaba#plugin#Register that never touches runtimepath
```

# Installation

This example uses [Vundle](https://github.com/gmarik/Vundle.vim), whose
plugin-adding command is `Plugin`.

```vim
" Add maktaba and codereview to the runtimepath.
" (The latter must be installed before it can be used.)
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codereview'
```
