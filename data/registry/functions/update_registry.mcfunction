#> Update the storage that stores a mapping of players to numerical IDs
#> Macro arguments:
#>  `filter`: a selector to include players
#> Example usage: function registry:update_registry {filter:"sort=arbitrary,tag=filter_tag"}

data merge storage registry:player_registry {players:[]}
scoreboard players set $count registry 0
$execute as @a[$(filter)] run function registry:add_player
execute store result storage registry:player_registry count int 1 run scoreboard players get $count registry
