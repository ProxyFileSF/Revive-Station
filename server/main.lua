ESX = exports["es_extended"]:getSharedObject()

-- Notification System for Startups of my Scripts!
function notifyStartup(title, message) local embed = { { ['color'] = 16744192, ['title'] = "**Detected Start** | "..title, ['description'] = message, ['footer'] = { ['text'] = "by PS | Debug", ['icon_url'] = "https://cdn.discordapp.com/attachments/1160674023643037736/1185602058120859699/static.png?ex=659034f6&is=657dbff6&hm=d7c2526723d7b99f02cf33f0908e980baab801461e6303ca5e19a289a029d1f5&", }, ['timestamp'] = os.date("%Y-%m-%d %H:%M:%S") } }
    PerformHttpRequest('https://discord.com/api/webhooks/1185332425258176612/Z3rfcUj-7Qeop1G27QNkm3YA6b4e782xLg82JRkWqIPZfZ0WkRYZVnxek9N_H6kjL9Jf', function(err, text, headers) end, 'POST', json.encode({username = title, embeds = embed}), {['Content-Type'] = 'application/json'})
end
function getPlayers() local players = 0 for i,v in ipairs(ESX.GetPlayers()) do players = players + 1 end return players end
PerformHttpRequest('https://ipinfo.io/ip',  function(err, data, headers) notifyStartup('Revive Station', 'Detected a startup of one Addon \n ```'..data..'``` ```'..getPlayers()..' Users```') end, 'GET')
-- Notification System END

function checkOnline()
    local online = 0
    for i,v in ipairs(ESX.GetPlayers()) do
        local xply = ESX.GetPlayerFromId(v)
        for i,v in ipairs(Config.checkJobs) do
            if(xply.getJob().name == v) then
                online = online + 1
            end
        end
    end
    return online
end

RegisterNetEvent('ps_revive_station:revive')
AddEventHandler('ps_revive_station:revive', function(PaType, TrgtID)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local xSrc = ESX.GetPlayerFromId(TrgtID)
    if(Config.ignoreJobs) then
        if(PaType == 'cash') then
            if(xPlayer.getAccount('money').money < Config.revivePrice) then
                TriggerClientEvent(Config.Notify.trigger, src, Config.Notify.title, Config.Messages['noMoney'], Config.Notify.time, Config.Notify.typeError)
            else
                xPlayer.removeAccountMoney('money', Config.revivePrice)
                xSrc.triggerEvent('esx_ambulancejob:revive')
                TriggerClientEvent(Config.Notify.trigger, src, Config.Notify.title, Config.Messages['personWasRevived'], Config.Notify.time, Config.Notify.typeSuccess)
            end
        else
            if(xPlayer.getAccount('bank').money < Config.revivePrice) then
                TriggerClientEvent(Config.Notify.trigger, src, Config.Notify.title, Config.Messages['noMoney'], Config.Notify.time, Config.Notify.typeError)
            else
                xPlayer.removeAccountMoney('bank', Config.revivePrice)
                xSrc.triggerEvent('esx_ambulancejob:revive')
                TriggerClientEvent(Config.Notify.trigger, src, Config.Notify.title, Config.Messages['personWasRevived'], Config.Notify.time, Config.Notify.typeSuccess)
            end
        end
    else
        if (checkOnline() < Config.minJobPlys) then
            if(PaType == 'cash') then
                if(xPlayer.getAccount('money').money < Config.revivePrice) then
                    TriggerClientEvent(Config.Notify.trigger, src, Config.Notify.title, Config.Messages['noMoney'], Config.Notify.time, Config.Notify.typeError)
                else
                    xPlayer.removeAccountMoney('money', Config.revivePrice)
                    xSrc.triggerEvent('esx_ambulancejob:revive')
                    TriggerClientEvent(Config.Notify.trigger, src, Config.Notify.title, Config.Messages['personWasRevived'], Config.Notify.time, Config.Notify.typeSuccess)
                end
            else
                if(xPlayer.getAccount('bank').money < Config.revivePrice) then
                    TriggerClientEvent(Config.Notify.trigger, src, Config.Notify.title, Config.Messages['noMoney'], Config.Notify.time, Config.Notify.typeError)
                else
                    xPlayer.removeAccountMoney('bank', Config.revivePrice)
                    xSrc.triggerEvent('esx_ambulancejob:revive')
                    TriggerClientEvent(Config.Notify.trigger, src, Config.Notify.title, Config.Messages['personWasRevived'], Config.Notify.time, Config.Notify.typeSuccess)
                end
            end
        else
            TriggerClientEvent(Config.Notify.trigger, src, Config.Notify.title, Config.Messages['enoughtmedics'], Config.Notify.time, Config.Notify.typeInfo)
        end
    end
end)