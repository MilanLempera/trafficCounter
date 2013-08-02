###*
  @fileoverview lempera.trafficCounter.viewer.traffic.Presenter.
###
goog.provide 'lempera.trafficCounter.viewer.traffic.Presenter'

goog.require 'este.app.Presenter'
goog.require 'lempera.trafficCounter.viewer.traffic.View'
goog.require 'lempera.trafficCounter.viewer.traffic.Collection'

class lempera.trafficCounter.viewer.traffic.Presenter extends este.app.Presenter

  ###*
    @typedef {{interval: string}}
    @protected
  ###
  params: {interval: 'day'}

  ###*
    @type {lempera.trafficCounter.viewer.traffic.Collection}
    @protected
  ###
  traffic: null

  ###*
    @constructor
    @extends {este.app.Presenter}
  ###
  constructor: ->
    super()
    @view = new lempera.trafficCounter.viewer.traffic.View()


  ###*
    @override
    @param {Object=} params
  ###
  load: (@params = {interval: 'day'}) ->
    @traffic = new lempera.trafficCounter.viewer.traffic.Collection
    url = '/traffic/?interval='+ params.interval
    @traffic.setUrl url
    @storage.query @traffic

  ###*
    Pass loaded data to view if loading was successful.
    @override
  ###
  show: ->
    @view.traffic = @traffic
    @view.params = @params