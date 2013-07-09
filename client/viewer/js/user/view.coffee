###*
  @fileoverview lempera.trafficCounter.viewer.user.View.
###
goog.provide 'lempera.trafficCounter.viewer.user.View'

goog.require 'este.app.View'
goog.require 'lempera.trafficCounter.viewer.user.templates'

class lempera.trafficCounter.viewer.user.View extends este.app.View
  ###*
    @type {lempera.trafficCounter.viewer.user.Collection}
    @protected
  ###
  userData: null

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
    data = {}
    data.ip = @params['ip']
    data.interval = @params['interval']
    data.records = @userData.toJson()
    html = lempera.trafficCounter.viewer.user.templates.main data
    este.dom.merge @getElement(), html
