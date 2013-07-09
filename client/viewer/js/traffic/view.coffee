###*
  @fileoverview lempera.trafficCounter.viewer.traffic.View.
###
goog.provide 'lempera.trafficCounter.viewer.traffic.View'

goog.require 'este.app.View'
goog.require 'lempera.trafficCounter.viewer.traffic.templates'

class lempera.trafficCounter.viewer.traffic.View extends este.app.View
  ###*
    @type {lempera.trafficCounter.viewer.traffic.Collection}
    @protected
  ###
  traffic: null

  ###*
    @type {Object}
    @protected
  ###
  params: null

  ###*
    @constructor
    @extends {este.app.View}
  ###
  constructor: ->
    super()

  ###*
    @override
  ###
  enterDocument: ->
    super()
    @update()
    return

  ###*
    @protected
  ###
  update: ->
    data ={}
    data.interval = @params.interval
    data.records = @traffic.toJson()
    html = lempera.trafficCounter.viewer.traffic.templates.main data
    este.dom.merge @getElement(), html
