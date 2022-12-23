plib.Require( 'language' )

local language = language
local file = file

local messageClasses = {
    ['point_message'] = true,
    ['env_message'] = true,
    ['env_hudhint'] = true,
    ['game_text'] = true
}

local function updateGameText( ent )
    if messageClasses[ ent:GetClass() ] then
        local placeholder = ent.pt_placeholder or ent:GetInternalVariable( 'message' )
        ent.pt_placeholder = placeholder

        ent:SetKeyValue( 'message', language.GetPhrase( placeholder ) )
    end
end

language.AddFolder( file.Path( 'resource/localization', language.Get() ), 'GAME' )
hook.Add('OnEntityCreated', 'PLib - Translate', updateGameText)

hook.Add('LanguageChanged', 'PLib - Translate', function( _, languageCode )
    language.AddFolder( file.Path( 'resource/localization', languageCode ), 'GAME' )

    for _, ent in ipairs( ents.GetAll() ) do
        updateGameText( ent )
    end
end)

if game.SinglePlayer() or not game.IsDedicated() then
    hook.Add('PlayerInitialSpawn', 'PLib - Translate', function(ply )
        if ply:IsListenServerHost() then
            hook.Remove( 'PlayerInitialSpawn', 'PLib - Translate' )
            language.Set( ply:GetInfo( 'gmod_language' ) )
        end
    end)
end