#> Create the storage and scoreboards used by the datapack

data merge storage registry:player_registry {count:0,players:[],action:{function:"",id:-1}}
scoreboard objectives add registry dummy
scoreboard objectives add registry_print trigger
scoreboard objectives add registry_action trigger
