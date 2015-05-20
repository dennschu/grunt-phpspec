#
# grunt-phpspec
# http://www.jamescryer.com/grunt-phpspec
#
# Copyright (c) 2013 James Cryer
# http://www.jamescryer.com
# Licensed under the MIT license.
#
'use strict'

module.exports = (grunt) ->

  builder = require('./lib/builder').init grunt
  phpspec = require('./lib/phpspec').init grunt

  grunt.registerMultiTask 'phpspec', 'Run PHPSpec', ->

    command = builder.build this.data.specs, this.options
    dir     = builder.directory()

    grunt.verbose.writeln 'Starting PHPSpec (target: ' + this.target.cyan + ') in ' + dir.cyan
    grunt.verbose.writeln 'Running: ' + command.cyan

    phpspec.run(command, this.async());
