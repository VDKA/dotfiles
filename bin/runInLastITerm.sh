#!/usr/bin/osascript

on run argv
  tell application "iTerm2"
    tell current window
      tell current session
        write text "" & item 1 of argv & "" newline YES
      end tell
    end tell
  end tell
end run

