#> Print a list of all players in the registry to the sender
#> Macro arguments:
#>  `exclude` : a selector that can prevent players from accessing this function
#>  `denial_function` : a function or command to run on excluded players
#>  `header` : a header for the player list
#>  `format_string` : a translatable format string containing "%s" for formatting a player's name
#>  `format_color` : the color of the message
#>  `format_italic` : whether to italicize the message or not
#>  `format_bold` : whether to bolden the message or not
#>  `footer` : a footer for the player list  
#> Example usage: function registry:print/print_registry {exclude: "tag=exclude_tag",\
                                                    denial_function: "tellraw @s \"You cannot use this.\"",\
                                                    header: "\"text\":\"List of players\"",\
                                                    format_string: "%s",\
                                                    format_color: "green",\
                                                    format_italic: false,\
                                                    format_bold: false,\
                                                    footer: "\translate\":\"pack.string.example_footer\""}

# Excluded players are not allowed to use this
$execute if entity @s[$(exclude)] run $(denial_function)
$execute if entity @s[$(exclude)] run return fail

# Print to player
$tellraw @s {$(header),"color":"$(format_color)","italic":$(format_italic),"bold":$(format_bold)}
$data merge storage registry:player_registry {idx:0,format:{str:"$(format_string)",color:"$(format_color)",italic:"$(format_italic)",bold:"$(format_bold)"}}
function registry:print/recursive_print with storage registry:player_registry
$tellraw @s {$(footer),"color":"$(format_color)","italic":$(format_italic),"bold":$(format_bold)}
