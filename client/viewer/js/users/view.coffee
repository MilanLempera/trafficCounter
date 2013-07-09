###*
  @fileoverview lempera.trafficCounter.viewer.users.View.
###
goog.provide 'lempera.trafficCounter.viewer.users.View'

goog.require 'este.app.View'
goog.require 'lempera.trafficCounter.viewer.users.templates'

class lempera.trafficCounter.viewer.users.View extends este.app.View
  ###*
    @type {lempera.trafficCounter.viewer.users.Collection}
    @protected
  ###
  users: null

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
    data.interval = @params.interval
    data.records = @users.toJson()
    html = lempera.trafficCounter.viewer.users.templates.main data
    este.dom.merge @getElement(), html
