# puppet-time_units

A small Puppet function to convert from one unit of time to another.

[![Build Status](https://travis-ci.org/deanwilson/puppet-time_units.svg?branch=master)](https://travis-ci.org/deanwilson/puppet-time_units)
[![Puppet Forge](https://img.shields.io/puppetforge/v/deanwilson/time_units.svg)](https://forge.puppetlabs.com/deanwilson/time_units)

In a large Puppet code base you'll eventually end up with a scattering of time
based '[magic numbers](https://en.wikipedia.org/wiki/Magic_number_%28programming%29#Unnamed_numerical_constantsmagic)
such as cache expiry numbers, zone file ttls and recurring job
schedules. You'll typically find these dealt with in one of a few ways.
The easiest is to ignore it and leave a hopefully guessable literal
value (such as 3600). The other often taken is the dreaded heavily
linked comments that start off as `86400 # seconds in a day` and over
time becomes `3600 # seconds in a day`.

This module is a proof of concept that uses a puppet function to make these kind
of calls more explicit while keeping larger magic numbers from the code base.

## Usage

A basic conversion is called like this:

    time_units(15, 'minutes', 'seconds') # returns 900

You can also make calls using a slightly 'prettier' 4 argument version

    time_units(2, 'hours', 'in', 'minutes') # returns 120



## Installation

You can install this module from
[PuppetForge](https://forge.puppet.com/):

    puppet module install deanwilson-time_units

### License

Apache 2.0 - [Dean Wilson](http://www.unixdaemon.net)
