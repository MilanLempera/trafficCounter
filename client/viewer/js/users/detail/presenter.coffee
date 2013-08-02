###*
  @fileoverview lempera.trafficCounter.viewer.users.detail.Presenter.
###
goog.provide 'lempera.trafficCounter.viewer.users.detail.Presenter'

goog.require 'este.app.Presenter'
goog.require 'lempera.trafficCounter.viewer.users.detail.View'
goog.require 'lempera.trafficCounter.viewer.users.Collection'

class lempera.trafficCounter.viewer.users.detail.Presenter extends este.app.Presenter

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
    @view = new lempera.trafficCounter.viewer.users.detail.View

  ###*
    @override
    @param {Object=} params
  ###
  load: (@params = {ip: '', interval: 'day'}) ->
    @userData = new lempera.trafficCounter.viewer.users.Model
    url = '/users/' + params.ip + '?interval='+ params.interval
    @storage.load @userData, url

  ###*
    Pass loaded data to view if loading was successful.
    @override
  ###
  show: ->
    @view.userData = @userData
    @view.params = @params