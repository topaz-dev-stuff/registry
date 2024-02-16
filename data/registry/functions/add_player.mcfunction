#> Add the sending player to the registry

data merge storage registry:player_registry {temp:{name:"",id:-1}}
loot spawn ~ -64 ~ loot registry:playerhead
data modify storage registry:player_registry temp.name set from entity @e[type=item,limit=1,nbt={Item:{tag:{registry_player_name:1b}}}] Item.tag.SkullOwner.Name
kill @e[type=item,nbt={Item:{tag:{registry_player_name:1b}}}]
scoreboard players add $count registry 1
execute store result storage registry:player_registry temp.id int 1 run scoreboard players get $count registry
data modify storage registry:player_registry players append from storage registry:player_registry temp
