extends Node

func reset_button_connections(button: Button):
	for signal_name in button.get_signal_list():
		for connection in button.get_signal_connection_list(signal_name.name):
			button.disconnect(signal_name.name, connection.callable)
