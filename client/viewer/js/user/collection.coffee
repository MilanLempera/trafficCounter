###*
  @fileoverview lempera.trafficCounter.viewer.user.Collection
.
###
goog.provide 'lempera.trafficCounter.viewer.user.Collection'

goog.require 'este.Collection'
goog.require 'lempera.trafficCounter.viewer.user.Model'

class lempera.trafficCounter.viewer.user.Collection extends este.Collection
  ###*
    @override
  ###
  model: lempera.trafficCounter.viewer.user.Model

  ###*
    @param {Array=} array
    @constructor
    @extends {este.Collection}
  ###
  constructor: (array) ->
    super array

  ###*
    @param {string} ip
    @param {string} interval
  ###
  setParams: (ip, interval) ->
    @url = '/user/'+ ip + '/' + interval