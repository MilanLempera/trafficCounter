###*
  @fileoverview Object represent sorting event.
###

goog.provide 'lempera.trafficCounter.component.tablesorter.Event'

goog.require 'goog.events.Event'

class lempera.trafficCounter.component.tablesorter.Event extends goog.events.Event

  ###*
    @param {string} type type Event type.
    @param {string} column sorting column name.
    @param {boolean} reversed is reversible sorting.
    @constructor
    @extends {goog.events.Event}
  ###
  constructor: (type, @column, @reversed) ->
    super type