###*
  @fileoverview lempera.trafficCounter.viewer.users.detail.View.
###
goog.provide 'lempera.trafficCounter.viewer.users.detail.View'

goog.require 'este.app.View'
goog.require 'lempera.trafficCounter.viewer.users.detail.templates'

class lempera.trafficCounter.viewer.users.detail.View extends este.app.View
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
    data.user = @userData.toJson()
    html = lempera.trafficCounter.viewer.users.detail.templates.main data
    este.dom.merge @getElement(), html
