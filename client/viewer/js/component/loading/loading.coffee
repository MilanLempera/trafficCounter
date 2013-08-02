###*
  @fileoverview page loading visualization
###

goog.provide 'lempera.trafficCounter.component.Loading'

goog.require 'este.ui.Component'
goog.require 'este.App'

goog.require 'goog.dom'
goog.require 'goog.dom.classes'
goog.require 'goog.string'

class lempera.trafficCounter.component.Loading extends este.ui.Component

  ###*
    @param {este.App} app
    @param {string=} opt_label
    @constructor
    @extends {este.ui.Component}
  ###
  constructor: (@app, @opt_label = 'Loading') ->
    super()

  ###*
    @type {este.App}
    @protected
  ###
  app: null

  ###*
    @type {string}
    @protected
  ###
  label: ''

  ###*
    @type {boolean}
    @protected
  ###
  loading: false


  ###*
    @type {?number}
    @protected
  ###
  timer: null

  ###*
   @protected
    @override
  ###
  decorateInternal: (element) ->
    super element

    goog.dom.classes.add @getElement(), 'hidden'

    labelElement = @dom_.createElement 'span'
    labelElement.innerHTML = @opt_label + ' '
    goog.dom.appendChild @getElement(), labelElement

    dotsElement = @dom_.createElement 'span'
    goog.dom.classes.add dotsElement, 'dots'
    goog.dom.appendChild @getElement(), dotsElement

  ###*
    @override
  ###
  registerEvents: ->
    @on @app, este.App.EventType.LOAD, @onLoadingStart
    @on @app, este.App.EventType.SHOW, @onLoadingStop
    return

  ###*
    @param {goog.events.Event} e
    @protected
  ###
  onLoadingStart: (e) ->
    goog.dom.classes.remove @getElement(), 'hidden'
    @startAnimation()

  ###*
    @param {goog.events.BrowserEvent} e
    @protected
  ###
  onLoadingStop: (e) ->
    @stopAnimation()
    goog.dom.classes.add @getElement(), 'hidden'

  ###*
    @protected
  ###
  startAnimation: () ->
    @loading = true
    @animateDots()



  ###*
    @protected
  ###
  animateStep: () ->
    dotsElement = @getElementByClass 'dots'
    dotsElement.innerHTML = goog.string.repeat '.', @n++
    @n = 1 if @n > 3

  ###*
    @protected
  ###
  animateDots: () ->
    clearInterval @timer
    @n = 0
    @animateStep()

    callback = goog.bind @animateStep, @
    @timer = setInterval ->
      callback()
    , 250

  ###*
    @protected
  ###
  stopAnimation: () ->
    @loading = false
    clearInterval @timer


