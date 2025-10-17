fx_version "cerulean"
games { "gta5" }

lua54 'yes'
author 'Codex Factory https://codexfactory.tech'
version '1.0.0'

shared_script {
    "@ox_lib/init.lua",
    "config.lua",
}

client_scripts {
    "client/*.lua"
}

dependencies {
    "ox_lib",
}
