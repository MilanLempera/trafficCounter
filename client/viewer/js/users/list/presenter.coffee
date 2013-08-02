###*
  @fileoverview lempera.trafficCounter.viewer.users.list.Presenter.
###
goog.provide 'lempera.trafficCounter.viewer.users.list.Presenter'

goog.require 'este.app.Presenter'
goog.require 'lempera.trafficCounter.viewer.users.list.View'
goog.require 'lempera.trafficCounter.viewer.users.Collection'

class lempera.trafficCounter.viewer.users.list.Presenter extends este.app.Presenter

  ###*
    @typedef {{interval: string}}
    @protected
  ###
  params: {interval: 'day'}

  ###*
    @type {lempera.trafficCounter.viewer.users.Collection}
  ###
  @users

  ###*
    @constructor
    @extends {este.app.Presenter}
  ###
  constructor: ->
    super()
    @view = new lempera.trafficCounter.viewer.users.list.View

  ###*
    @override
    @param {Object=} params
  ###
  load: (@params = {interval: 'day'}) ->
    @users = new lempera.trafficCounter.viewer.users.Collection
    @users.setUrl '/users/?interval='+ params.interval
    @storage.query @users

  ###*
    Pass loaded data to view if loading was successful.
    @override
  ###
  show: ->
    @view.users = @users
    @view.params = @params