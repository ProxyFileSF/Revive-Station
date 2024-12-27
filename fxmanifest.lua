fx_version 'cerulean'
game 'gta5'

author 'ProxyFile'
description 'A simple Revive Station'
version '1.0.0'

lua54 'yes'

client_scripts {
    'client/main.lua',
    'config.lua'
}

server_scripts {
    'server/main.lua',
    'config.lua'
}

shared_script 'config.lua'

ui_page 'html/ui.html'

files {
    'html/ui.html',
    'html/ui_javascript.js',
    'html/style.css',
    'html/jquery-3.7.1.min.js',
    'html/assets/*'
}

escrow_ignore {
    'html/ui.html',
    'html/style.css',
    'assets/*',
    'config.lua'
}
