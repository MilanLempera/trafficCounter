###*
  @fileoverview lempera.trafficCounter.viewer.users.Collection
.
###
goog.provide 'lempera.trafficCounter.viewer.users.Collection'

goog.require 'este.Collection'
goog.require 'lempera.trafficCounter.viewer.users.Model'

class lempera.trafficCounter.viewer.users.Collection extends este.Collection
  ###*
    @override
  ###
  model: lempera.trafficCounter.viewer.users.Model

  ###*
    @param {Array=} array
    @constructor
    @extends {este.Collection}
  ###
  constructor: (array) ->
    super array

  ###*
    @param {string} interval
  ###
  setParams: (interval) ->
    @url = '/users/'+ interval