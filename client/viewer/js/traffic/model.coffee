###*
  @fileoverview traffic model
###
goog.provide 'lempera.trafficCounter.viewer.traffic.Model'

goog.require 'este.Model'

class lempera.trafficCounter.viewer.traffic.Model extends este.Model

  schema:
    'downloadFormated':
      'meta': (self) ->
        goog.format.fileSize(self.get('download'))
    'uploadFormated':
      'meta': (self) ->
        goog.format.fileSize(self.get('upload'))
    'totalFormated':
      'meta': (self) ->
        goog.format.fileSize(self.get('total'))

  ###*
    @param {Object=} json
    @constructor
    @extends {este.Model}
  ###
  constructor: (json) ->
    super json

