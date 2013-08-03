###*
  @fileoverview lempera.trafficCounter.viewer.traffic.View.
###
goog.provide 'lempera.trafficCounter.viewer.traffic.View'

goog.require 'este.app.View'
goog.require 'este.Model.Event'
goog.require 'lempera.trafficCounter.component.TableSorter'
goog.require 'lempera.trafficCounter.component.tablesorter.Event'
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
    @update()
    @initTableSorter()
    super()

  ###*
    @protected
  ###
  update: ->
    data ={}
    data.interval = @params.interval
    data.records = @traffic.toJson()
    html = lempera.trafficCounter.viewer.traffic.templates.main data
    este.dom.merge @getElement(), html
    return

  ###*
    @protected
  ###
  initTableSorter: ->
    tableElement = document.getElementsByTagName("table")[0]
    @tableSorter = new lempera.trafficCounter.component.TableSorter
    @tableSorter.decorate tableElement

  ###*
    @override
  ###
  registerEvents: ->
    @on @traffic, este.Model.EventType.UPDATE, @update
    @on @tableSorter, lempera.trafficCounter.component.TableSorter.EventType.SORT, @sorting

  ###*
   @type {lempera.trafficCounter.component.tablesorter.Event} e
   @protected
  ###
  sorting: (e)->
    @traffic.sort
      reversed: e.reversed, by: (item)  ->
        item.get(e.column)
    @update()
    return

