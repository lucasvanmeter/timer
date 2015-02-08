class Clock

	constructor: ->
		@start = Date.now()

	read: ->
		return Date.now() - @start

	set: (t) ->
		@start = Date.now() - t

class StopWatch extends Clock
	
	constructor: ->
		@clock = new Clock()
		@now = @clock.time()
		@pause = true

	read: ->
		if @pause
			return @now
		return @clock.time()

	pause: ->
		if not @pause
			@now = @clock.time()
		@pause = true

	unpause: ->
		if @pause
			@clock.set @now
		@pause = false

#attach to global namespace
window.Clock = Clock
window.StopWatch = StopWatch