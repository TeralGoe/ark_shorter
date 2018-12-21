# ARK: Shorter app
[![Build Status](https://travis-ci.org/TeralGoe/ark_shorter.svg?branch=master)](https://travis-ci.org/TeralGoe/ark_shorter)
[![Maintainability](https://api.codeclimate.com/v1/badges/11bd665d51001a6db992/maintainability)](https://codeclimate.com/github/TeralGoe/ark_shorter/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/11bd665d51001a6db992/test_coverage)](https://codeclimate.com/github/TeralGoe/ark_shorter/test_coverage)

An application that will shorten links and save URL visitors data.
Has an API and built with TDD, CI and HAML.

## Prerequisites

* Ruby (MRI) 2.5+ 
* SQLite

## Setup

    $ git clone git@github.com:TeralGoe/ark_shorter.git
    $ cd ark_shorter
    $ bundle install
    $ bundle exec rake db:create
    $ bundle exec rake db:migrate
    $ rails s

## License
Created by [Michael Arkhipov](https://github.com/TeralGoe).
Available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
