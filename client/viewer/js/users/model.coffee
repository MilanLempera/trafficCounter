###*
  @fileoverview users model
###
goog.provide 'lempera.trafficCounter.viewer.users.Model'

goog.require 'este.Model'
goog.require 'lempera.trafficCounter.viewer.traffic.Collection'

class lempera.trafficCounter.viewer.users.Model extends lempera.trafficCounter.viewer.traffic.Model

  ###*
    @param {Object=} json
    @constructor
    @extends {este.Model}
  ###
  constructor: (json) ->
    super json

  ###*
    @inheritDoc
  ###
  setAttributes: (json) ->
    if goog.isDefAndNotNull(json['traffic'])  && goog.isArray(json['traffic'])
      json.traffic = new lempera.trafficCounter.viewer.traffic.Collection json['traffic']
    super json
