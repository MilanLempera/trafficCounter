###*
  @fileoverview lempera.trafficCounter.viewer.traffic.Collection.
###
goog.provide 'lempera.trafficCounter.viewer.traffic.Collection'

goog.require 'este.Collection'
goog.require 'lempera.trafficCounter.viewer.traffic.Model'

class lempera.trafficCounter.viewer.traffic.Collection extends este.Collection
  ###*
    @override
  ###
  model: lempera.trafficCounter.viewer.traffic.Model

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
    @url = '/traffic/?interval='+ interval