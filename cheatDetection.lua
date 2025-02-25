-- cheatDetection.lua

-- Функция для проверки использования запрещенных Lua-функций
function isCheatingWithLua(player)
    -- Здесь можно добавить список запрещенных Lua-функций
    local forbiddenFunctions = {
        "setPedWeaponSkill",  -- Функция для изменения навыков оружия
        "setPedArmor",        -- Функция для изменения брони
        "setPlayerMoney",     -- Функция для изменения денег игрока
        "setPlayerHealth",    -- Функция для изменения здоровья
    }

    -- Проверяем каждый из запрещенных методов на наличие в текущем скрипте
    for _, func in ipairs(forbiddenFunctions) do
        if player:hasCalledLuaFunction(func) then
            return true
        end
    end

    return false
end

-- Пример использования
addEvent("onPlayerExecuteLuaScript", true)
addEventHandler("onPlayerExecuteLuaScript", resourceRoot, function(player, script)
    if isCheatingWithLua(player) then
        -- Если подозреваем, что игрок использует читы, кикаем его
        kickPlayer(player, "Вы использовали запрещенный Lua-скрипт!")
    end
end)
