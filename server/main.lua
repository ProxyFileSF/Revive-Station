ESX = exports["es_extended"]:getSharedObject()

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