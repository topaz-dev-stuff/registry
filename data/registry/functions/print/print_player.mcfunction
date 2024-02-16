#> Print a single player's name

$tellraw @s [{"translate":"$(str)","color":"$(color)","italic":$(italic),"bold":$(bold),"with":[{"text":"$(name)"}],"clickEvent":{"action":"run_command","value":"/trigger registry_action set $(id)"}}]
