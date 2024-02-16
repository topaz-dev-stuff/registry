#> Print the players in the registry

$scoreboard players set $idx registry $(idx)
$scoreboard players set $count registry $(count)

# Base case - failure
execute if score $count registry < $idx registry run return fail

$data modify storage registry:player_registry players[$(idx)] merge value $(format)
$function registry:print/print_player with storage registry:player_registry players[$(idx)]

# Base case - success
execute if score $count registry = $idx registry run return run scoreboard players get $count registry

# Recurse
scoreboard players add $idx registry 1
execute store result storage registry:player_registry idx int 1 run scoreboard players get $idx registry
function registry:print/recursive_print with storage registry:player_registry
