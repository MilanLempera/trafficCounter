###*
  @fileoverview lempera.trafficCounter.viewer.users.list.View.
###
goog.provide 'lempera.trafficCounter.viewer.users.list.View'

goog.require 'este.app.View'
goog.require 'lempera.trafficCounter.viewer.users.list.templates'

class lempera.trafficCounter.viewer.users.list.View extends este.app.View
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
    html = lempera.trafficCounter.viewer.users.list.templates.main data
    este.dom.merge @getElement(), html
