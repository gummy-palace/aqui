extends Node

# The Printer is the general manager for info and error reporting.
# All systems should utilize Printer.send() rather than print()
	# whenever possible.
# Severity marks the importance to which the info being reported is
	# recorded, saved, or even displayed directly to the user.
# Type is simply the category that the message falls into.
# Severity and Type are unrelated. For example, it is possible to have
	# a HOT, INFO message, or a MILD, ERROR message.

enum {MILD, MED, HOT}
enum {INFO, OK, WARN, ERROR, STOP_CODE}


func send(message: String, severity := MED, type := INFO) -> void:
	match type:
		INFO:
			match severity:
				MILD:
					print_verbose(message)
				MED:
					print(message)
				HOT:
					OS.alert(message, "Aquí Info")
		OK:
			match severity:
				MILD:
					print_verbose(message)
				MED:
					print(message)
				HOT:
					OS.alert(message, "Aquí OK")
		WARN:
			match severity:
				MILD:
					print_verbose(message)
				MED:
					push_warning(message)
				HOT:
					OS.alert(message, "Aquí Warning")
		ERROR:
			match severity:
				MILD:
					printerr(message)
				MED:
					push_error(message)
				HOT:
					if OS.is_debug_build():
						@warning_ignore("assert_always_false")
						assert(false, message)
					else:
						OS.alert(message, "Aquí Error")
		STOP_CODE:
			match severity:
				MILD:
					if OS.is_debug_build():
						@warning_ignore("assert_always_false")
						assert(false, message)
					else:
						OS.alert(message, "Aquí Error")
				MED:
					if OS.is_debug_build():
						@warning_ignore("assert_always_false")
						assert(false, message)
					else:
						OS.alert(message, "Aquí Error")
				HOT:
					OS.crash(message)
