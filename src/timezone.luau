--////////////////////////////////////////////////////////////
--//
--// c - Simple & fast time manipulation library
--// Copyright (C) 2023-2024 Gunshot Sound Studios
--//
--// This software is provided 'as-is', without any express or implied warranty.
--// In no event will the authors be held liable for any damages arising from the use of this software.
--//
--// Permission is granted to anyone to use this software for any purpose,
--// including commercial applications, and to alter it and redistribute it freely,
--// subject to the following restrictions:
--//
--// 1. The origin of this software must not be misrepresented;
--//    you must not claim that you wrote the original software.
--//    If you use this software in a product, an acknowledgment
--//    in the product documentation would be appreciated but is not required.
--//
--// 2. Altered source versions must be plainly marked as such,
--//    and must not be misrepresented as being the original software.
--//
--// 3. This notice may not be removed or altered from any source distribution.
--//
--////////////////////////////////////////////////////////////

local types = require(script.Parent.types)
local none = require(script.Parent.none)

local timezoneDifferences = {
	UNKNOWN = 0,
	GMT = 0,
	UTC = 0,
	EST = -5,
	EDT = -4,
	CST = -6,
	CDT = -5,
	MST = -7,
	MDT = -6,
	PST = -8,
	PDT = -7,
	BST = 1,
	CET = 1,
	CEST = 2,
	EET = 2,
	EEST = 3,
	IST = 5.5,
	WET = 0,
	WEST = 1,
	AEST = 10,
	AEDT = 11,
	ACST = 9.5,
	ACDT = 10.5,
	AWST = 8,
	NZST = 12,
	NZDT = 13,
	HST = -10,
	AKST = -9,
	AKDT = -8,
	ART = -3,
	BRST = -2,
	BRT = -3,
	CLT = -3,
	CLST = -4,
	COT = -5,
	PET = -5,
	AST = -4,
	ADT = -3,
}

local timezone = {}

function timezone.here(): types.timezone
	local UTC = os.date("!*t")
	local localDate = os.date("*t")
	local differenceHour = localDate.hour - UTC.hour
	local differenceMinute = localDate.min - UTC.min
	
	if differenceMinute ~= 0 then
		differenceHour += (differenceMinute / 60)
	end

	for k, v in pairs(timezoneDifferences) do
		if v == differenceHour then
			return k
		end
	end
	
	return "UNKNOWN"
end

function timezone.difference(timezoneA: types.timezone, timezoneB: types.timezone): number
	local err = ""
	if not timezoneA then
		err += `{timezoneA} does not exist!\n`
	end
	
	if not timezoneB then
		err += `{timezoneB} does not exist!`
	end
	
	if err ~= "" then error(err) end
	
	return timezoneDifferences[timezoneB] - timezoneDifferences[timezoneA]
end

function timezone.now(timezone: types.timezone)
	if not timezoneDifferences[timezone] then
		error(`{timezone} does not exist!`)
	end
	
	local UTC = os.date("!*t")
	local timeDifference = timezoneDifferences[timezone]
	
	local flatHour = math.floor(timeDifference)
	if flatHour ~= timeDifference then
		local flatTime = timeDifference - math.floor(timeDifference)
		UTC.min += flatTime * 60
	end
	
	local value = 0
	UTC.hour += flatHour

	local daySeconds = UTC.day * 86400
	local hourSeconds = UTC.hour * 3600
	local minuteSeconds = UTC.min * 60

	return daySeconds + hourSeconds + minuteSeconds + UTC.sec
end

function timezone.convert(timezoneA: types.timezone, timezoneB: types.timezone, time: types.time)
	if none(time) then
		error("a valid time object was not provided")
	end 
	
	local difference = timezone.difference(timezoneA, timezoneB)
	return time + (difference * 3600)
end

return timezone
