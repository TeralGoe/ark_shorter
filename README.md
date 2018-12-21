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
    
## Running the tests

Coverage results report is available in the folder `coverage/index.html` after executing:

    $ bundle exec rspec

## API Documentation

### List of shorters

- #### Endpoint

    **<code>GET</code>** /api/shorters

- #### Success Response

     Code: **200**
     
    ```
    [
      {
        "code": "uKH4SN",
        "original_url": "https://foo.bar/John",
        "purified_url": "foo.bar/john",
        "visitors": []
      },
      {
        "code": "iHV4j5",
        "original_url": "https://foo.bar/Doe",
        "purified_url": "foo.bar/doe",
        "visitors": []
      }
    ]
    ```

### Shorter creation

- #### Endpoint

    **<code>POST</code>** /api/shorters

- #### Success Response

     Code: **201**
     
    ```
    [
      {
        "code": "CN1pG1",
        "original_url": "https://foo.bar/JohnDoe",
        "purified_url": "foo.bar/johndoe",
        "visitors": []
      }
    ]
    ```

- #### Error Response

     Code: **422**
     
    ```
    [
      {
        "error": "Oh no! URL format is invalid"
      }
    ]
    ```

### Shorter

- #### Endpoint

    **<code>GET</code>** /api/shorters/:code

- #### Success Response

     Code: **200**
     
    ```
    [
      {
        "code": "CN1pG1",
        "original_url": "https://foo.bar/JohnDoe",
        "purified_url": "foo.bar/johndoe",
        "visitors": [
          {
            "ip": "127.0.0.1",
            "country": "RU",
            "visit_time": "2018-12-21T16:56:19.338Z"
          }
        ]
      }
    ]
    ```

- #### Error Response

     Code: **404**
     
    ```
    [
      {
        "error": "Couldn't find Shorter"
      }
    ]
    ```

### List of visitors

- #### Endpoint

    **<code>GET</code>** /api/visitors

- #### Success Response

     Code: **200**
     
    ```
    [
      {
        "shorter": "CN1pG1",
        "ip": "8.8.8.8",
        "country": "US",
        "visit_time": "2018-12-12T18:30:19.675Z"
      },
      {
        "shorter": "CN1pG1",
        "ip": "8.8.4.4",
        "country": "RU",
        "visit_time": "2018-12-21T16:56:19.338Z"
      }
    ]
    ```

## License
Created by [Michael Arkhipov](https://github.com/TeralGoe).
Available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
