# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "~/workSpace/zic"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "Music Session"; then

  # Create a new window inline within session layout definition.
  new_window "In-line Window"

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
