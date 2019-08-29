# Scripts

Scripts that make development life easier.

## `nuke_derived_data`

The `nuke_derived_data` script will eventually delete everything in ~/Library/Developer/Xcode/DerivedData. By default, it also tells you how many tries it took to clear out DerivedData, but you can silence that with the `-q` option.

## `push`

Meant to be a replacement for `git push`, the `push` script will run some checks, push the current branch to origin, and (optionally) open a pull request.

The checks that `push` has are:

- git index must be clean.
- tests should pass (this is done by having the `run_tests` command return 0). Can be disabled with the `-s` flag.

You can also do a [force with lease](https://blog.developer.atlassian.com/force-with-lease/) push by passing the `-f` flag.

If you pass the `-p` option, `push` will look for a url in the standard output of `git push origin HEAD` and, if one is detected, open it in the default browser (using the `open` command). Future work involves expanding pull request support to auto-fill-in options for github pull requests.

## `run_tests`

Builds and runs tests for the project. Detects fastlane, mdbook, and rspec-based projects. Complains but doesn't return error if it can't detect how to run the tests.

- fastlane-based tests is detected by looking for a fastlane file. It'll attempted to run the `test` lane.
- mdbook project will check spelling (using [`mdspell`](https://github.com/mtuchowski/mdspell)), generate a SUMMARY.md file for the book (using [`mdbook-generate-summary`](https://github.com/younata/mdbook-generate-summary), and then run `mdbook test`.
- rspec-based projects looks for a `spec` directory, and, if found, runs `rspec .`.

## `svg2png`

The `svg2png` script creates 3 png images from a single svg image - meant for use in creating assets for use in iOS apps.

The first argument is the path to the svg image to use, the second argument is the width of the image to use. `svg2png` then creates 3 images, at the given width, at twice that width, and at 3 times that width - while preserving the aspect ratio.

`svg2png` uses the [`svgexport`](https://github.com/shakiba/svgexport) command (`npm i -g svgexport`) along with [`gnu parallel`](https://www.gnu.org/software/parallel/) (`brew install parallel`).

## util.sh

`util.sh` is a library of simple shell functions that these commands all share. For the most part, it exists for the `echo_red`, `echo_cyan`, `echo_green`, and `echo_yellow` commands - commands which print the argument in the specified color.
