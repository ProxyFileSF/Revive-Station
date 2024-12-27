-- ᴄᴏɴꜰɪɢ ꜱᴇᴛᴛɪɴɢꜱ
Config = {}

Config.ignoreJobs = false -- 🇮​​🇫​ ​🇹​​🇷​​🇺​​🇪​, ​🇪​​🇻​​🇪​​🇳​ ​🇮​​🇫​ ​🇸​​🇴​​🇲​​🇪​​🇴​​🇳​​🇪​ ​🇫​​🇷​​🇴​​🇲​ ​🇹​​🇭​​🇪​ ​🇲​​🇪​​🇩​​🇮​​🇨​ ​🇹​​🇪​​🇦​​🇲​ ​🇮​​🇸​ ​🇴​​🇳​​🇱​​🇮​​🇳​​🇪​ ​🇵​​🇱​​🇦​​🇾​​🇪​​🇷​​🇸​ ​🇨​​🇦​​🇳​ ​🇷​​🇪​​🇻​​🇮​​🇻​​🇪​ ​🇵​​🇪​​🇴​​🇵​​🇱​​🇪​ ​🇺​​🇸​​🇮​​🇳​​🇬​ ​🇹​​🇭​​🇪​ ​🇷​​🇪​​🇻​​🇮​​🇻​​🇪​ ​🇸​​🇹​​🇦​​🇹​​🇮​​🇴​​🇳​
Config.minJobPlys = 1 -- ​🇹​​🇭​​🇪​ ​🇲​​🇮​​🇳​​🇮​​🇲​​🇺​​🇲​ ​🇦​​🇲​​🇴​​🇺​​🇳​​🇹​ ​🇴​​🇫​ ​🇲​​🇪​​🇩​​🇮​​🇨​​🇸​ ​🇳​​🇪​​🇪​​🇩​​🇪​​🇩​ ​🇹​​🇴​ Deactivate ​🇹​​🇭​​🇪​ 🇷​​🇪​​🇻​​🇮​​🇻​​🇪​ ​🇸​​🇹​​🇦​​🇹​​🇮​​🇴​​🇳 ​🇵​​🇺​​🇹​ 0️ ​🇹​​🇴​ ​🇩​​🇮​​🇸​​🇦​​🇧​​🇱​​🇪​
Config.checkJobs = {'ambulance', 'medic'} -- ​🇹​​🇭​​🇪​​🇸​​🇪​ ​🇦​​🇷​​🇪​ ​🇹​​🇭​​🇪​ ​🇯​​🇴​​🇧​​🇸​ ​🇹​​🇭​​🇦​​🇹​ ​🇦​​🇷​​🇪​ ​🇬​​🇴​​🇮​​🇳​​🇬​ ​🇹​​🇴​ ​🇧​​🇪​ ​🇨​​🇭​​🇪​​🇨​​🇰​​🇪​​🇩​ ​🇫​​🇴​​🇷​ ​🇸​​🇴​​🇲​​🇪​​🇴​​🇳​​🇪​ ​🇴​​🇳​​🇱​​🇮​​🇳​​🇪​
Config.revivePrice = 5000 -- ​🇹​​🇭​​🇮​​🇸​ ​🇮​​🇸​ ​🇭​​🇴​​🇼​ ​🇲​​🇺​​🇨​​🇭​ ​🇾​​🇴​​🇺​ ​🇼​​🇦​​🇳​​🇹​ ​🇹​​🇭​​🇪​​🇲​ ​🇹​​🇴​ ​🇧​​🇪​ ​🇨​​🇭​​🇦​​🇷​​🇬​​🇪​​🇩​ ​🇫​​🇴​​🇷​ ​🇴​​🇳​​🇪​ ​🇷​​🇪​​🇻​​🇮​​🇻​​🇪​

Config.blipConfig = {
    ['enableBlip'] = true,
    ['blipMinimap'] = false,
    ['blipSprite'] = 403,
    ['blipScale'] = 0.8,
    ['blipColour'] = 35,
    ['blipName'] = "Revive Station",
}

Config.DrawMarkerLocation = vec3(299.4710, -579.9677, 43.2588) -- ​​🇹​​🇭​​🇮​​🇸​ ​🇮​​🇸​​ ​🇹​​🇭​​🇪​ ​🇵​​🇴​​🇸​​🇮​​🇹​​🇮​​🇴​​🇳​ ​🇴​​🇫​ ​🇹​​🇭​​🇪​ ​🇲​​🇦​​🇷​​🇰​​🇪​​🇷​
Config.MarkerColor = { -- 🇨​​🇭​​🇦​​🇳​​🇬​​🇪​ ​🇹​​🇭​​🇮​​🇸​ ​🇮​​🇫​ ​🇾​​🇴​​🇺​ ​🇼​​🇦​​🇳​​🇹​ ​🇹​​🇴​ ​🇨​​🇭​​🇦​​🇳​​🇬​​🇪​ ​🇹​​🇭​​🇪​ ​🇲​​🇦​​🇷​​🇰​​🇪​​🇷​​​ ​🇨​​🇴​​🇱​​🇴​​🇷​
    r = 255,
    g = 127,
    b = 0,
    a = 100
}

Config.Messages = { -- 🇹​​🇭​​🇪​​🇸​​🇪​ ​🇦​​🇷​​🇪​ ​🇹​​🇭​​🇪​ ​🇲​​🇪​​🇸​​🇸​​🇦​​🇬​​🇪​​🇸​, ​🇮​​🇫​ ​🇾​​🇴​​🇺​ ​🇼​​🇦​​🇳​​🇹​ ​🇹​​🇴​ ​🇨​​🇭​​🇦​​🇳​​🇬​​🇪​ ​🇹​​🇭​​🇪​​🇲​
    ['useANumber'] = 'Bitte gebe eine Zahl ein!',
    ['personWasRevived'] = 'Die Person wurde erfolgreich wiederbelebt.',
    ['personNotDead'] = 'Die Person ist noch am Leben.',
    ['idisNothere'] = 'Angegebener Spieler ist nicht in der nähe!',
    ['noMoney'] = 'Du hast kein Geld um diese Person wiederzubeleben!',
    ['enoughtmedics'] = 'Es sind genügend Mediziner im Dienst!',
    ['presstoOpen'] = 'Drücke ~INPUT_CONTEXT~ um die Revivestation zu öffnen!'
}

Config.Notify = { -- ​🇹​​🇭​​🇮​​🇸​ ​🇮​​🇸​ ​🇼​​🇭​​🇪​​🇷​​🇪​ ​🇾​​🇴​​🇺​ ​🇵​​🇺​​🇹​ ​🇾​​🇴​​🇺​​🇷​ ​🇳​​🇴​​🇹​​🇮​​🇫​​🇾​ ​🇸​​🇾​​🇸​​🇹​​🇪​​🇲​ ​🇴​​🇰​​🇴​​🇰​​🇳​​🇴​​🇹​​🇮​​🇫​​🇾​ ​🇪​​🇹​​🇨​.
    trigger = 'okokNotify:Alert',
    title = 'Benachrichtigung',
    time = 5000,
    typeError = 'error',
    typeSuccess = 'success',
    typeInfo = 'info',
}
