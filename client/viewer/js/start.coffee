###*
  @fileoverview lempera.trafficCounter.viewer.start.
###

goog.provide 'lempera.trafficCounter.viewer.start'

goog.require 'este.app.create'
goog.require 'este.storage.Rest'
goog.require 'lempera.trafficCounter.viewer.traffic.Presenter'
goog.require 'lempera.trafficCounter.viewer.users.Presenter'
goog.require 'lempera.trafficCounter.viewer.user.Presenter'
goog.require 'lempera.trafficCounter.component.Loading'

###*
  @param {Object} data JSON from server
###
lempera.trafficCounter.viewer.start = (data) ->

  viewer = este.app.create 'viewer', true
  viewer.storage = new este.storage.Rest(data['baseUrl']+'/api/v1/')
  viewer.addRoutes
    '/traffic/:interval': new lempera.trafficCounter.viewer.traffic.Presenter
    '/users/:interval': new lempera.trafficCounter.viewer.users.Presenter
    '/user/:ip/:interval': new lempera.trafficCounter.viewer.user.Presenter

# viewer loading progress bar
  loadingElement = document.getElementById 'loading'
  loading = new lempera.trafficCounter.component.Loading viewer
  loading.decorate loadingElement

  viewer.redirect lempera.trafficCounter.viewer.traffic.Presenter, {interval:'day'}

  viewer.start()

goog.exportSymbol 'lempera.trafficCounter.viewer.start', lempera.trafficCounter.viewer.start