ESX = exports["es_extended"]:getSharedObject()
local alreadyOpen = false

function SetDisplay(bool)
    alreadyOpen = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "ui",
        status = bool,

    })
end

RegisterNUICallback("exit", function(data, cb)
    SetDisplay(false)
end)

function startChecking(data)
    local PiD = data.PlayerID
    local PaType = data.PaymentType
    local ClosestPl, ClosestPlDist = ESX.Game.GetClosestPlayer(Config.DrawMarkerLocation)
    local trgtHealth = GetEntityHealth(GetPlayerPed(ClosestPl))

    if not (PiD == "") then
        if(ClosestPlDist < 3.0) then
            if(tostring(PiD) == tostring(GetPlayerServerId(ClosestPl))) then
                if(trgtHealth <= 0) then
                    SetDisplay(false)
                    TriggerServerEvent("ps_revive_station:revive", PaType, GetPlayerServerId(ClosestPl))
                else
                    TriggerEvent(Config.Notify.trigger, Config.Notify.title, Config.Messages['personNotDead'], Config.Notify.time, Config.Notify.typeInfo)
                end
            else
                TriggerEvent(Config.Notify.trigger, Config.Notify.title, Config.Messages['idisNothere'], Config.Notify.time, Config.Notify.typeInfo)
            end
        else
            TriggerEvent(Config.Notify.trigger, Config.Notify.title, Config.Messages['idisNothere'], Config.Notify.time, Config.Notify.typeInfo)
        end
    else
        TriggerEvent(Config.Notify.trigger, Config.Notify.title, Config.Messages['useANumber'], Config.Notify.time, Config.Notify.typeError)
    end
end

RegisterNUICallback('cardpay', function(data) startChecking(data) end)
RegisterNUICallback('cashpay', function(data) startChecking(data) end)

Citizen.CreateThread(function()
    local x,y,z = table.unpack(Config.DrawMarkerLocation)
    local playerDistance = nil

    if(Config.blipConfig['enableBlip']) then
        blip = AddBlipForCoord(x, y, z)
        SetBlipSprite(blip, Config.blipConfig['blipSprite'])
        SetBlipScale(blip, Config.blipConfig['blipScale'])
        SetBlipColour(blip, Config.blipConfig['blipColour'])
        SetBlipAsShortRange(blip, true)
        if(Config.blipConfig['blipMinimap']) then
            SetBlipDisplay(blip, 5)
        else
            SetBlipDisplay(blip, 4)
        end
        

        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.blipConfig['blipName'])
        EndTextCommandSetBlipName(blip)
    end

    while true do
        playerDistance = #(GetEntityCoords(PlayerPedId()) - Config.DrawMarkerLocation)
        if(playerDistance < 100) then
            
            DrawMarker(1, x, y, z, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, Config.MarkerColor.a, false, false, 2, false, nil, nil, false)
            if(playerDistance < 1.5) then
                if not (alreadyOpen) then
                    ESX.ShowHelpNotification('Drücke ~INPUT_CONTEXT~ um die Revivestation zu öffnen!', true, true)
                    if(IsControlJustPressed(0, 38)) then
                        SetDisplay(true)
                    end
                end
            end
        end
        Citizen.Wait(1)
    end
end)