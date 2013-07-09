###*
  @fileoverview lempera.trafficCounter.viewer.user.Presenter.
###
goog.provide 'lempera.trafficCounter.viewer.user.Presenter'

goog.require 'este.app.Presenter'
goog.require 'lempera.trafficCounter.viewer.user.View'
goog.require 'lempera.trafficCounter.viewer.user.Collection'

class lempera.trafficCounter.viewer.user.Presenter extends este.app.Presenter

  ###*
    @typedef {{ip: string, interval: number}}
    @protected
    @expose
  ###
  params: {ip: '', interval: 'day'}

  ###*
    @constructor
    @extends {este.app.Presenter}
  ###
  constructor: ->
    super()
    @view = new lempera.trafficCounter.viewer.user.View

  ###*
    @override
    @param {Object=} params
  ###
  load: (@params = {ip: '', interval: 'day'}) ->
    @userData = new lempera.trafficCounter.viewer.user.Collection
    @userData.setParams params.ip, params.interval
    @storage.query @userData

  ###*
    Pass loaded data to view if loading was successful.
    @override
  ###
  show: ->
    @view.userData = @userData
    @view.params = @params