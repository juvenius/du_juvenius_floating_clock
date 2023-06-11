-- Juvenius' floating clock 1.01
-- https://github.com/juvenius/du_juvenius_floating_clock
--
-- instalation:
-- Only to places 2 needed to copy/paste code. Please take care on the on the specified slot/filter , 
--   1) unit / tick(clock)
--   2) unit / filter: start()
-- copy from start to end on each case.
----------------------------------------------------------------------------------------

--start---------------------------------------------------------------------------------
--slot: unit / tick(clock)

time = system.getUtcTime() + hour_offset * 3600  
update_clock(time)

--end-----------------------------------------------------------------------------------

--start---------------------------------------------------------------------------------
-- SLOT: system | filter:Start()
-- initial vars
unit.setTimer("clock", 1)
second_digit = 0

-- inicial value of the arrow test
x = 0
digit_6 = 0
digit_5 = 0
digit_4 = 0
digit_3 = 0
digit_2 = 0
digit_1 = 0
old_digit_6 = -1
old_digit_5 = -1
old_digit_4 = -1
old_digit_3 = -1
old_digit_2 = -1
old_digit_1 = -1

digit_x = -28 -- export
digit_y = 0.75 -- export
digit_z = -61 -- export
orientation = "side" -- export (front, side)
hour_offset = -4 -- export

if orientation == "side" then
    tougle_side = 1
    tougle_front = 0
else
    tougle_side = 0
    tougle_front = 1
end
id_digit_6 = core.spawnNumberSticker(digit_6, digit_y, digit_x, digit_z, orientation)
id_digit_5 = core.spawnNumberSticker(digit_5, digit_y + (0.5 * tougle_front), digit_x + (0.5 * tougle_side), digit_z,
    orientation)
id_digit_4 = core.spawnNumberSticker(digit_4, digit_y + (1.25 * tougle_front), digit_x + (1.25 * tougle_side), digit_z,
    orientation)
id_digit_3 = core.spawnNumberSticker(digit_3, digit_y + (1.75 * tougle_front), digit_x + (1.75 * tougle_side), digit_z,
    orientation)
id_digit_2 = core.spawnNumberSticker(digit_2, digit_y + (2.50 * tougle_front), digit_x + (2.50 * tougle_side), digit_z,
    orientation)
id_digit_1 = core.spawnNumberSticker(digit_1, digit_y + (3 * tougle_front), digit_x + (3 * tougle_side), digit_z,
    orientation)

function update_clock(n)

    -- n to d,h,m,s  
    local day = math.floor(n / (24 * 3600))
    n = n % (24 * 3600)
    local hour = math.floor(n / 3600)
    n = n % 3600
    local minutes = math.floor(n / 60)
    n = n % 60
    local seconds = math.floor(n)

    -- h,m,s to text   
    hour_text = tostring(hour)
    if string.len(hour_text) < 2 then
        hour_text = "0" .. hour_text
    end

    minutes_text = tostring(minutes)
    if string.len(minutes_text) < 2 then
        minutes_text = "0" .. minutes_text
    end

    seconds_text = tostring(seconds)
    if string.len(seconds_text) < 2 then
        seconds_text = "0" .. seconds_text
    end

    -- print text  
    digit_6 = hour_text:sub(1, 1)
    if not (digit_6 == old_digit_6) then
        core.deleteSticker(id_digit_6)
        id_digit_6 = core.spawnNumberSticker(digit_6, digit_y, digit_x, digit_z, orientation)
        old_digit_6 = digit_6
    end

    digit_5 = hour_text:sub(2, 2)
    if not (digit_5 == old_digit_5) then
        core.deleteSticker(id_digit_5)
        id_digit_5 = core.spawnNumberSticker(digit_5, digit_y + (0.5 * tougle_front), digit_x + (0.5 * tougle_side),
            digit_z, orientation)
        old_digit_5 = digit_5
    end

    digit_4 = minutes_text:sub(1, 1)
    if not (digit_4 == old_digit_4) then
        core.deleteSticker(id_digit_4)
        id_digit_4 = core.spawnNumberSticker(digit_4, digit_y + (1.25 * tougle_front), digit_x + (1.25 * tougle_side),
            digit_z, orientation)
        old_digit_4 = digit_4
    end

    digit_3 = minutes_text:sub(2, 2)
    if not (digit_3 == old_digit_3) then
        core.deleteSticker(id_digit_3)
        id_digit_3 = core.spawnNumberSticker(digit_3, digit_y + (1.75 * tougle_front), digit_x + (1.75 * tougle_side),
            digit_z, orientation)
        old_digit_3 = digit_3
    end

    digit_2 = seconds_text:sub(1, 1)
    if not (digit_2 == old_digit_2) then
        core.deleteSticker(id_digit_2)
        id_digit_2 = core.spawnNumberSticker(digit_2, digit_y + (2.50 * tougle_front), digit_x + (2.50 * tougle_side),
            digit_z, orientation)
        old_digit_2 = digit_2
    end

    digit_1 = seconds_text:sub(2, 2)
    core.deleteSticker(id_digit_1)
    id_digit_1 = core.spawnNumberSticker(digit_1, digit_y + (3 * tougle_front), digit_x + (3 * tougle_side), digit_z,
        orientation)

end
--end-----------------------------------------------------------------------------------

