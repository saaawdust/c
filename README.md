# c

c is a library that provides timekeeping functionality for Roblox.

c can be downloaded from the `releases` section of this github.

A primary goal was to enable timezone functionality that can be used, mainly to schedule events.

## Functionality

To use c, simply require it.

```lua
local c = require(path.to.c)
```

`time` is the simplest object in c as it is just a number in seconds. You can construct different amounts of `time` by using `second`, `minute`, `hour`, or `day`. You can add 2 `time` objects together by passing the current amount of time as the second parameter

```lua
local hour = c.hour
local minute = c.minute

hour(5, minute(10)) -- 5h, 10m
```

you can check if an object is or isn't `time` by using `some` and `none`

```lua
local some = c.some
local none = c.none

local second = c.second

-- Returns if the object is `time`
some(5) -- true; `time` is just a number, so this is just 5 seconds
some(second(10)) -- true
some("foo") -- false
some(false) -- false

-- Returns if the object isn't `time`, a shorthand for `not some`
none(5) -- false
none(second(10)) -- false
none("foo") -- true
none(false) -- false

```

You can use `time` to also get the time of the server / client using `now`

```lua
local time = c.time

local hour = c.hour

time.now() -- The current time
time.ago(hour(5)) -- 5 hours ago
time.after(hour(10)) -- In 10 hours
```

Finally, you can use the `timezone` functions to switch between timezones

```lua
local timezone = c.timezone

local hour = c.hour

timezone.here() -- A string representing your timezone, e.g "EST"
timezone.difference("EST", "BST") -- Returns the difference between 2 timezones; E.x -6, as EST is 6 hours behind BST
timezone.now("EST") -- Returns the current time in a timezone
timezone.convert("EST", "BST", hour(0)) -- Converts the given time in timezone A to timezone B. In this example, as EST is 6 hours behind BST, it would be 6 hours
```

Months and years are currently not supported.
