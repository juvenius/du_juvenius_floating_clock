{
   "slots":{
      "0":{
         "name":"core",
         "type":{
            "events":[
               
            ],
            "methods":[
               
            ]
         }
      },
      "1":{
         "name":"slot2",
         "type":{
            "events":[
               
            ],
            "methods":[
               
            ]
         }
      },
      "2":{
         "name":"slot3",
         "type":{
            "events":[
               
            ],
            "methods":[
               
            ]
         }
      },
      "3":{
         "name":"slot4",
         "type":{
            "events":[
               
            ],
            "methods":[
               
            ]
         }
      },
      "4":{
         "name":"slot5",
         "type":{
            "events":[
               
            ],
            "methods":[
               
            ]
         }
      },
      "5":{
         "name":"slot6",
         "type":{
            "events":[
               
            ],
            "methods":[
               
            ]
         }
      },
      "6":{
         "name":"slot7",
         "type":{
            "events":[
               
            ],
            "methods":[
               
            ]
         }
      },
      "7":{
         "name":"slot8",
         "type":{
            "events":[
               
            ],
            "methods":[
               
            ]
         }
      },
      "8":{
         "name":"slot9",
         "type":{
            "events":[
               
            ],
            "methods":[
               
            ]
         }
      },
      "9":{
         "name":"slot10",
         "type":{
            "events":[
               
            ],
            "methods":[
               
            ]
         }
      },
      "-1":{
         "name":"unit",
         "type":{
            "events":[
               
            ],
            "methods":[
               
            ]
         }
      },
      "-3":{
         "name":"player",
         "type":{
            "events":[
               
            ],
            "methods":[
               
            ]
         }
      },
      "-2":{
         "name":"construct",
         "type":{
            "events":[
               
            ],
            "methods":[
               
            ]
         }
      },
      "-4":{
         "name":"system",
         "type":{
            "events":[
               
            ],
            "methods":[
               
            ]
         }
      },
      "-5":{
         "name":"library",
         "type":{
            "events":[
               
            ],
            "methods":[
               
            ]
         }
      }
   },
   "handlers":[
      {
         "code":"time = system.getUtcTime() + hour_offset * 3600  \nupdate_clock(time)",
         "filter":{
            "args":[
               {
                  "value":"clock"
               }
            ],
            "signature":"tick(timerId)",
            "slotKey":"-1"
         },
         "key":"0"
      },
      {
         "code":"-- SLOT: system | filter:Start()\n-- initial vars\nunit.setTimer(\"clock\", 1)\nsecond_digit = 0\n\n-- inicial value of the arrow test\nx = 0\ndigit_6 = 0\ndigit_5 = 0\ndigit_4 = 0\ndigit_3 = 0\ndigit_2 = 0\ndigit_1 = 0\nold_digit_6 = -1\nold_digit_5 = -1\nold_digit_4 = -1\nold_digit_3 = -1\nold_digit_2 = -1\nold_digit_1 = -1\n\ndigit_x = -28 -- export\ndigit_y = 0.75 -- export\ndigit_z = -61 -- export\norientation = \"side\" -- export (front, side)\nhour_offset = -4 -- export\n\nif orientation == \"side\" then\n    tougle_side = 1\n    tougle_front = 0\nelse\n    tougle_side = 0\n    tougle_front = 1\nend\nid_digit_6 = core.spawnNumberSticker(digit_6, digit_y, digit_x, digit_z, orientation)\nid_digit_5 = core.spawnNumberSticker(digit_5, digit_y + (0.5 * tougle_front), digit_x + (0.5 * tougle_side), digit_z,\n    orientation)\nid_digit_4 = core.spawnNumberSticker(digit_4, digit_y + (1.25 * tougle_front), digit_x + (1.25 * tougle_side), digit_z,\n    orientation)\nid_digit_3 = core.spawnNumberSticker(digit_3, digit_y + (1.75 * tougle_front), digit_x + (1.75 * tougle_side), digit_z,\n    orientation)\nid_digit_2 = core.spawnNumberSticker(digit_2, digit_y + (2.50 * tougle_front), digit_x + (2.50 * tougle_side), digit_z,\n    orientation)\nid_digit_1 = core.spawnNumberSticker(digit_1, digit_y + (3 * tougle_front), digit_x + (3 * tougle_side), digit_z,\n    orientation)\n\nfunction update_clock(n)\n\n    -- n to d,h,m,s  \n    local day = math.floor(n / (24 * 3600))\n    n = n % (24 * 3600)\n    local hour = math.floor(n / 3600)\n    n = n % 3600\n    local minutes = math.floor(n / 60)\n    n = n % 60\n    local seconds = math.floor(n)\n\n    -- h,m,s to text   \n    hour_text = tostring(hour)\n    if string.len(hour_text) < 2 then\n        hour_text = \"0\" .. hour_text\n    end\n\n    minutes_text = tostring(minutes)\n    if string.len(minutes_text) < 2 then\n        minutes_text = \"0\" .. minutes_text\n    end\n\n    seconds_text = tostring(seconds)\n    if string.len(seconds_text) < 2 then\n        seconds_text = \"0\" .. seconds_text\n    end\n\n    -- print text  \n    digit_6 = hour_text:sub(1, 1)\n    if not (digit_6 == old_digit_6) then\n        core.deleteSticker(id_digit_6)\n        id_digit_6 = core.spawnNumberSticker(digit_6, digit_y, digit_x, digit_z, orientation)\n        old_digit_6 = digit_6\n    end\n\n    digit_5 = hour_text:sub(2, 2)\n    if not (digit_5 == old_digit_5) then\n        core.deleteSticker(id_digit_5)\n        id_digit_5 = core.spawnNumberSticker(digit_5, digit_y + (0.5 * tougle_front), digit_x + (0.5 * tougle_side),\n            digit_z, orientation)\n        old_digit_5 = digit_5\n    end\n\n    digit_4 = minutes_text:sub(1, 1)\n    if not (digit_4 == old_digit_4) then\n        core.deleteSticker(id_digit_4)\n        id_digit_4 = core.spawnNumberSticker(digit_4, digit_y + (1.25 * tougle_front), digit_x + (1.25 * tougle_side),\n            digit_z, orientation)\n        old_digit_4 = digit_4\n    end\n\n    digit_3 = minutes_text:sub(2, 2)\n    if not (digit_3 == old_digit_3) then\n        core.deleteSticker(id_digit_3)\n        id_digit_3 = core.spawnNumberSticker(digit_3, digit_y + (1.75 * tougle_front), digit_x + (1.75 * tougle_side),\n            digit_z, orientation)\n        old_digit_3 = digit_3\n    end\n\n    digit_2 = seconds_text:sub(1, 1)\n    if not (digit_2 == old_digit_2) then\n        core.deleteSticker(id_digit_2)\n        id_digit_2 = core.spawnNumberSticker(digit_2, digit_y + (2.50 * tougle_front), digit_x + (2.50 * tougle_side),\n            digit_z, orientation)\n        old_digit_2 = digit_2\n    end\n\n    digit_1 = seconds_text:sub(2, 2)\n    core.deleteSticker(id_digit_1)\n    id_digit_1 = core.spawnNumberSticker(digit_1, digit_y + (3 * tougle_front), digit_x + (3 * tougle_side), digit_z,\n        orientation)\n\nend\n\n",
         "filter":{
            "args":[
               
            ],
            "signature":"start()",
            "slotKey":"-1"
         },
         "key":"1"
      }
   ],
   "methods":[
      
   ],
   "events":[
      
   ]
}
