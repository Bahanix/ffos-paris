# FFOS app template

Firefox OS open web app template with localisation using middleman.

## About tools

* [MiddleMan](http://middlemanapp.com/) is used for preprocessing:
  * Slim to Html
  * SCSS to CSS
  * CoffeeScript to JavaScript
  * Concatenate and minify everything

You may remove slim/scss/coffee from filenames if you don't want to use them.

## How to build your app':

* Fork this repo
* `git clone` your repo
* `bundle install` to install dependencies
* `middleman server` to test the app in your browser
* `rake build` to compile everything
* `rake deploy` to deploy on Github pages
* `https://bahanix.github.io/ffos-middleman/`

## Known limitations

* Hosted app can't do XHR or any privileged action.
* If you need to, use the generated build/app.zip to publish your app.

## Test with your device or simulator

* Download and install [Firefox Nightly](https://nightly.mozilla.org/)
* Firefox > Developer > WebIDE
* Select your device or simulator
* Open Hosted App
* URL to your `manifest.webapp`
* https://bahanix.github.io/ffos-middleman/manifest.webapp
* Run
