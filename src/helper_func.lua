---Returns Mod ID of target card's source mod
---@param card Card
---@return string? 
function Blockbuster.get_mod_id_from_card(card)
    if card then
        -- convert card to just the center
        local _center = nil

        if type(card) == "string" then
            _center = G.P_CENTERS[card]
        else 
            _center = card.config and card.config.center
        end

        if _center and _center.original_mod then
            return _center.original_mod.id
        end

        if _center and not _center.original_mod then
            return "Vanilla"
        end
    else
        return nil
    end
    
end