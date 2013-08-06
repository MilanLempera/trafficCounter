###*
  @fileoverview A table sorter define events and styles for collection sorting service.
  The TABLE should use a THEAD containing TH elements for the table column headers.

  Class is inspired by goog.ui.TableSorter.
###

goog.provide 'lempera.trafficCounter.component.TableSorter'

goog.require 'este.ui.Component'
goog.require 'lempera.trafficCounter.component.tablesorter.Event'

goog.require 'goog.dom'

class lempera.trafficCounter.component.TableSorter extends este.ui.Component

  ###*
    @param {goog.dom.DomHelper=} domHelper Optional DOM helper.
    @constructor
    @extends {este.ui.Component}
  ###
  constructor: (domHelper) ->
    super domHelper

  ###*
    The current sort column of the table, or -1 if none.
    @type {number}
    @protected
  ###
  columnIndex_: -1

  ###*
    Whether the last sort was in reverse.
    @type {boolean}
    @protected
  ###
  reversed_: false

  ###*
    Row number (in <thead>) to use for sorting.
    @type {number}
    @protected
  ###
  sortableHeaderRowIndex_: 0

  ###*
    Table sorter events.
    @enum {string}
  ###
  @EventType:
    BEFORESORT: 'beforesort'
    SORT: 'sort'
    AFTERSORT: 'aftersort'

  ###*
    @override
  ###
  canDecorate: (element) ->
    element.tagName == goog.dom.TagName.TABLE

  ###*
    @override
  ###
  registerEvents: ->
    table = @getElement()
    headerRow = table.tHead.rows[@sortableHeaderRowIndex_]

    @on headerRow, goog.events.EventType.CLICK, @onHeaderClick
    return

  ###*
   @param {goog.events.Event} e
   @return {HTMLTableCellElement}
   @private
  ###
  getClickedColumn: (e) ->
    #Determine what column was clicked.
    #TODO(robbyw): If this table cell contains another table, this could break.
    target =  (`/** @type {Node} */`) e.target
    goog.dom.getAncestorByTagNameAndClass target, goog.dom.TagName.TH

  ###*
    If the user clicks on the same column, sort it in reverse of what it is
    now.  Otherwise, sort forward.
    @param  {number} nextColumnIndex
    @return {boolean}
  ###
  getNextReversed: (nextColumnIndex)->
    if nextColumnIndex == @columnIndex_
      reversed = !@reversed_
    else
      reversed = false

  ###*
    @param {goog.events.Event} e
    @protected
  ###
  onHeaderClick: (e) ->
    clickedColumn = @getClickedColumn e
    sortingColumn = clickedColumn.getAttribute 'mil-tablesorter-column'
    return unless goog.isString sortingColumn

    columnIndex = clickedColumn.cellIndex
    nextReversed = @getNextReversed(columnIndex)

    beforeSortEvent = new lempera.trafficCounter.component.tablesorter.Event lempera.trafficCounter.component.TableSorter.EventType.BEFORESORT,
      sortingColumn, nextReversed
    return unless this.dispatchEvent beforeSortEvent

    sortEvent = new lempera.trafficCounter.component.tablesorter.Event lempera.trafficCounter.component.TableSorter.EventType.SORT,
      sortingColumn, nextReversed
    return unless this.dispatchEvent sortEvent

    @applySortingChanges columnIndex, nextReversed

    afterSortEvent = new lempera.trafficCounter.component.tablesorter.Event lempera.trafficCounter.component.TableSorter.EventType.AFTERSORT,
      sortingColumn, nextReversed
    this.dispatchEvent afterSortEvent

  ###*
    @param {number} columnIndex
    @param {boolean} reversed
    @protected
  ###
  applySortingChanges: (columnIndex, reversed) ->
    @removeSortingClass @columnIndex_, @reversed_
    @reversed_ = reversed
    @columnIndex_ = columnIndex
    @applySortingClass @columnIndex_, @reversed_

  ###*
    @param {number} columnIndex
    @param {boolean} reversed
    @protected
  ###
  removeSortingClass: (columnIndex, reversed) ->
    oldHeader = @getHeaderColumnByIndex columnIndex
    return unless oldHeader

    className = @getClassName reversed
    goog.dom.classes.remove oldHeader, className

  ###*
    @param {number} columnIndex
    @param {boolean} reversed
    @protected
  ###
  applySortingClass: (columnIndex, reversed) ->
    newHeader = @getHeaderColumnByIndex columnIndex
    return unless newHeader

    className = @getClassName reversed
    goog.dom.classes.add newHeader, className

  ###*
    @param {boolean} reversed
    @protected
  ###
  getClassName: (reversed) ->
    if reversed
      goog.getCssName 'mil-tablesorter-sorted-reversed'
    else
      goog.getCssName 'mil-tablesorter-sorted'

  ###*
    @param {number} index
    @protected
  ###
  getHeaderColumnByIndex: (index) ->
    if index < 0
      return

    table = @getElement()
    headers = table.tHead.rows[@sortableHeaderRowIndex_].cells
    headers[index]
