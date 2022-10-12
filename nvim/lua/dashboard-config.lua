local db = require('dashboard')
local home = os.getenv('HOME')

db.header_pad = 12

--[===[db.custom_header = {
[[   _   _ ______ ______      _______ __  __  ]],
[[  | \ | |  ____/ __ \ \    / /_   _|  \/  | ]],
[[  |  \| | |__ | |  | \ \  / /  | | | \  / | ]],
[[  | . ` |  __|| |  | |\ \/ /   | | | |\/| | ]],
[[  | |\  | |___| |__| | \  /   _| |_| |  | | ]],
[[  |_| \_|______\____/   \/   |_____|_|  |_| ]],
}--]===]
--[===[db.custom_header = {
[[⠀⠀⠀⠀⠀⠀                  ⠀⠀⠀⠀⠀⠀              ]],
[[⠀⠀⠀⠀                      ⠀⠀⠀⠀              ]],
[[⠀⠀⠀     ⠀⠀⠀       ⣶⣶⣶⣶⡆⠀⠀⠀⠀⠀⠀    ⠀⠀⠀        ]],
[[⠀⠀    ⠀⠀⠀⠀⠀       ⠛⠛⢻⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀           ]],
[[⠀    ⠀⠀⠀⠀⠀⠀⠀⠀       ⢀⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀           ]],
[[⠀    ⠀⠀⠀⠀⠀⠀⠀       ⢀⣾⣿⣿⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀          ]],
[[⠀    ⠀⠀⠀⠀⠀⠀       ⢠⣿⣿⡟⢹⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀         ⠀ ]],
[[⠀    ⠀⠀⠀⠀       ⠀⣰⣿⣿⠏⠀⠀⢻⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀          ]],
[[⠀    ⠀⠀       ⠀⠀⣴⣿⡿⠃⠀⠀⠀⠈⢿⣿⣷⣤⣤⡆⠀⠀         ⠀  ]],
[[⠀⠀           ⠀⠀⠾⠿⠿⠁⠀⠀⠀⠀⠀⠘⣿⣿⡿⠿⠛⠀             ]],
[[⠀⠀⠀⠀⠀⠀                                      ]],
[[⠀⠀⠀⠀⠀⠀⠀⠀                                    ]],
[[                                            ]],
[[   _   _ ______ ______      _______ __  __  ]],
[[  | \ | |  ____/ __ \ \    / /_   _|  \/  | ]],
[[  |  \| | |__ | |  | \ \  / /  | | | \  / | ]],
[[  | . ` |  __|| |  | |\ \/ /   | | | |\/| | ]],
[[  | |\  | |___| |__| | \  /   _| |_| |  | | ]],
[[  |_| \_|______\____/   \/   |_____|_|  |_| ]],
}]===]--
--[===[db.custom_header = {
[[ NNNNNNNN        NNNNNNNNEEEEEEEEEEEEEEEEEEEEEE     OOOOOOOOO     VVVVVVVV           VVVVVVVVIIIIIIIIIIMMMMMMMM               MMMMMMMM]],
[[ N:::::::N       N::::::NE::::::::::::::::::::E   OO:::::::::OO   V::::::V           V::::::VI::::::::IM:::::::M             M:::::::M]],
[[ N::::::::N      N::::::NE::::::::::::::::::::E OO:::::::::::::OO V::::::V           V::::::VI::::::::IM::::::::M           M::::::::M]],
[[ N:::::::::N     N::::::NEE::::::EEEEEEEEE::::EO:::::::OOO:::::::OV::::::V           V::::::VII::::::IIM:::::::::M         M:::::::::M]],
[[ N::::::::::N    N::::::N  E:::::E       EEEEEEO::::::O   O::::::O V:::::V           V:::::V   I::::I  M::::::::::M       M::::::::::M]],
[[ N:::::::::::N   N::::::N  E:::::E             O:::::O     O:::::O  V:::::V         V:::::V    I::::I  M:::::::::::M     M:::::::::::M]],
[[ N:::::::N::::N  N::::::N  E::::::EEEEEEEEEE   O:::::O     O:::::O   V:::::V       V:::::V     I::::I  M:::::::M::::M   M::::M:::::::M]],
[[ N::::::N N::::N N::::::N  E:::::::::::::::E   O:::::O     O:::::O    V:::::V     V:::::V      I::::I  M::::::M M::::M M::::M M::::::M]],
[[ N::::::N  N::::N:::::::N  E:::::::::::::::E   O:::::O     O:::::O     V:::::V   V:::::V       I::::I  M::::::M  M::::M::::M  M::::::M]],
[[ N::::::N   N:::::::::::N  E::::::EEEEEEEEEE   O:::::O     O:::::O      V:::::V V:::::V        I::::I  M::::::M   M:::::::M   M::::::M]],
[[ N::::::N    N::::::::::N  E:::::E             O:::::O     O:::::O       V:::::V:::::V         I::::I  M::::::M    M:::::M    M::::::M]],
[[ N::::::N     N:::::::::N  E:::::E       EEEEEEO::::::O   O::::::O        V:::::::::V          I::::I  M::::::M     MMMMM     M::::::M]],
[[ N::::::N      N::::::::NEE::::::EEEEEEEE:::::EO:::::::OOO:::::::O         V:::::::V         II::::::IIM::::::M               M::::::M]],
[[ N::::::N       N:::::::NE::::::::::::::::::::E OO:::::::::::::OO           V:::::V          I::::::::IM::::::M               M::::::M]],
[[ N::::::N        N::::::NE::::::::::::::::::::E   OO:::::::::OO              V:::V           I::::::::IM::::::M               M::::::M]],
[[ NNNNNNNN         NNNNNNNEEEEEEEEEEEEEEEEEEEEEE     OOOOOOOOO                 VVV            IIIIIIIIIIMMMMMMMM               MMMMMMMM]],
}--]===]
db.custom_header = {
[[ ███╗░░██╗███████╗░█████╗░██╗░░░██╗██╗███╗░░░███╗]],
[[ ████╗░██║██╔════╝██╔══██╗██║░░░██║██║████╗░████║]],
[[ ██╔██╗██║█████╗░░██║░░██║╚██╗░██╔╝██║██╔████╔██║]],
[[ ██║╚████║██╔══╝░░██║░░██║░╚████╔╝░██║██║╚██╔╝██║]],
[[ ██║░╚███║███████╗╚█████╔╝░░╚██╔╝░░██║██║░╚═╝░██║]],
[[ ╚═╝░░╚══╝╚══════╝░╚════╝░░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝]],
}

db.center_pad = 4

db.custom_center = {
      {icon = '  ',
      desc = 'New Session',
      shortcut = '',
      action ='NewFile'},
      {icon = '  ',
      desc = 'File Browser',
      action =  'FileBrowser',
      shortcut = ''},
      {icon = ' ',
      desc = 'Quit',  
      action = 'q',
      shortcut = ''},
    }
local proc = assert(io.popen('/home/gagan/.local/bin/print-quote'))
local output = proc:read('*all')
proc:close()
mytable = {}
mytable[1] = output
db.custom_footer = mytable

db.footer_pad = 4


