#> Perform some action when the sender clicks on a name in the registry
#> Macro arguments:
#>  `function` : a function to run

# actual data is 1-indexed but the array is 0-indexed
scoreboard players remove @s registry_action 1
execute store result storage registry:player_registry action.id int 1 run scoreboard players get @s registry_action

data modify storage registry:player_registry action.function set value "$(function)"
function registry:action/get_params with storage registry:player_registry action
$$(function) with storage registry:player_registry action
