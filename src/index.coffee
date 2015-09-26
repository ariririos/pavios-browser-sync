'use strict'

taskName = 'BrowserSync' # used with humans
safeTaskName = 'browser-sync' # used with machines

{getConfig, gulp, API: {$, typeCheck, debug}} = require 'pavios'
debug = debug 'task:' + taskName

config = getConfig safeTaskName

result = typeCheck.raw 'Object', config
debug 'Type check ' + (if result then 'passed' else 'failed')

gulp.task safeTaskName, (cb) ->
  unless result
    debug 'Exiting task early because config is invalid'
    return cb()

  if config.port
    debug 'Starting BrowserSync on port ' + config.port

  $.browserSync.init config, cb

module.exports.order = 3
