## This class manage all the game events
extends Node

# Calendar related events
signal next_month_on_calendar_displayed()
signal prev_month_on_calendar_displayed()
signal next_day_started(event: NextDayStartedEvent)
signal player_selected_day(event: PlayerSelectedDayEvent)
