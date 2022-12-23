plib.Require( 'language' )

local engine_ActiveGamemode = engine.ActiveGamemode
local RunConsoleCommand = RunConsoleCommand
local language = language
local file = file
local list = list

-- Terrortown
list.Set( 'TTT Languages', 'pt', 'Português (Brasil)' )
list.Set( 'TTT Languages', 'it', 'Italiano' )
list.Set( 'TTT Languages', 'en', 'English' )
list.Set( 'TTT Languages', 'ru', 'Русский' )
list.Set( 'TTT Languages', 'fr', 'Français' )
list.Set( 'TTT Languages', 'ja', '日本語' )
list.Set( 'TTT Languages', 'sv', 'Swedish chef' )
list.Set( 'TTT Languages', 'zh', '简体中文' )
list.Set( 'TTT Languages', 'de', 'Deutsch' )
list.Set( 'TTT Languages', 'es', 'Español' )

local function updateTerrorTown( languageCode )
    if (engine_ActiveGamemode() == 'terrortown') then
        RunConsoleCommand('ttt_language', list.Get( 'TTT Languages' )[ languageCode ] or 'English')
    end
end

hook.Add('LanguageChanged', 'PLib - Translate', function( _, languageCode )
    language.AddFolder( file.Path( 'resource/localization', languageCode ), 'GAME' )

    -- Sandbox
    if GAMEMODE and GAMEMODE.IsSandboxDerived then
        RunConsoleCommand( 'spawnmenu_reload' )
    end

    updateTerrorTown( languageCode )
end)

local current = language.Get()
language.AddFolder( file.Path( 'resource/localization', current ), 'GAME' )
updateTerrorTown( current )