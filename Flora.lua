import "CubePlugins.HerbalismHelper.GeneralFunctions";

--[[
From https://lotro-wiki.com/wiki/Herbalism_Flora
    Dwarfsbeard is found in North Ithilien and the Wastes. Yields 1 Phial of Umber Extract.
    Elfspear is only found in North Ithilien. Yields 1 Phial of Verdant Extract.
    Southron's Crown is only found in North Ithilien. Yields 1 Phial of Crimson Extract.
    Horsetail is found in North Ithilien and the Wastes. Yields 2 Phials of Umber Extract.
    Oxlip is only found in North Ithilien. Yields 2 Phials of Verdant Extract.
    Vetchling is only found in North Ithilien. Yields 2 Phials of Crimson Extract.
    Drakewort is only found in North Ithilien. Yields 3 phials of assorted extracts.
    Bell-o-Dale is found stream-side in North Ithilien. Yields 3 phials of assorted extracts.
    Buckthorn is found near ruins/bridges in North Ithilien. Yields 4-5 phials of assorted extracts.
    Rock-rose is often found on rock outcroppings and cliff-sides in North Ithilien. Yields 4-5 phials of assorted extracts.
    Larkspur is found streams-side in North Ithilien and the Wastes. Yields 4-5 phials of assorted extracts.

]]

PHIAL_CRIMSON = 1;
PHIAL_UMBER = 2;
PHIAL_VERDANT = 3;
PHIAL_GOLDEN = 4;
PHIAL_VIOLET = 5;
PHIAL_AMBER = 6;
PHIAL_SAPPHIRE = 7;

HerbalismPhialLookupEn = {
    [PHIAL_CRIMSON] = "Crimson",
    [PHIAL_UMBER] = "Umber",
    [PHIAL_VERDANT] = "Verdant",
    [PHIAL_GOLDEN] = "Golden",
    [PHIAL_VIOLET] = "Violet",
    [PHIAL_AMBER] = "Amber",
    [PHIAL_SAPPHIRE] = "Sapphire",
}

HerbalismPhialLookup = HerbalismPhialLookupEn;

FLORA_DWARFSBEARD = 1;
FLORA_ELFSPEAR = 2;
FLORA_SOUTHRONS_CROWN = 3;
FLORA_HORSETAIL = 4;
FLORA_OXLIP = 5;
FLORA_VETCHLING = 6;
FLORA_DRAKEWORT = 7;
FLORA_BELL_O_DALE = 8;
FLORA_BUCKTHORN = 9;
FLORA_ROCK_ROSE = 10;
FLORA_LARKSPUR = 11;
FLORA_WRAITHSCOWL = 12;
FLORA_DUSKNETTLE = 13;
FLORA_BONEMALLOW = 14;
FLORA_EVENGLEAM = 15;
FLORA_MOURNWEED = 16;
FLORA_EYE_OF_NIGHT = 17;

HerbalismFloraLookupEn = {
    ["Dwarfsbeard"] = FLORA_DWARFSBEARD,
    ["Elfspear"] = FLORA_ELFSPEAR,
    ["Southron's Crown"] = FLORA_SOUTHRONS_CROWN,
    ["Horsetail"] = FLORA_HORSETAIL,
    ["Oxlip"] = FLORA_OXLIP,
    ["Vetchling"] = FLORA_VETCHLING,
    ["Drakewort"] = FLORA_DRAKEWORT,
    ["Bell-o-Dale"] = FLORA_BELL_O_DALE,
    ["Buckthorn"] = FLORA_BUCKTHORN,
    ["Rock-rose"] = FLORA_ROCK_ROSE,
    ["Larkspur"] = FLORA_LARKSPUR,
    ["Wraithscowl"] = FLORA_WRAITHSCOWL,
    ["Dusknettle"] = FLORA_DUSKNETTLE,
    ["Bonemallow"] = FLORA_BONEMALLOW,
    ["Evengleam"] = FLORA_EVENGLEAM,
    ["Mournweed"] = FLORA_MOURNWEED,
    ["Eye-of-Night"] = FLORA_EYE_OF_NIGHT,
}

HerbalismFloraLookup = HerbalismFloraLookupEn;

function FloraYieldsToString(flora)
    local isFatefulToolkitEquipped = IsFatefulToolkitEquipped();

    local text = nil;

    local expectedMinMax = nil;

    -- for each drop type, produce something like: Bonemallow: 2-4 Phials of Violet Extract
    for key, value in ipairs(flora.YIELDS) do
        local count = "";
        if (value.MIN == value.MAX) then
            if (isFatefulToolkitEquipped) then
                count = (value.MIN + 1);
            else
                count = value.MIN;
            end
        else
            if (isFatefulToolkitEquipped) then
                if (value.MIN == 0) then
                    count = value.MIN .. "-" .. (value.MAX + 1);
                else
                    count = (value.MIN + 1) .. "-" .. (value.MAX + 1);
                end
            else
                count = value.MIN .. "-" .. value.MAX;
            end
        end

        -- This is only for console output, no need to localize.
        local phial = "Phials";
        if (count == 1) then
            phial = "Phial";
        end

        local yield = count .. " " .. phial .. " of " .. HerbalismPhialLookup[value.PHIAL] .. " Extract";
        if (text) then
            text = text .. " / " .. yield;

            local min = flora.YIELDS.MIN;
            local max = flora.YIELDS.MAX;

            if (isFatefulToolkitEquipped) then
                min = min + 1;
                max = max + #flora.YIELDS;
            end
            if (min == max) then
                expectedMinMax = " (" .. min  .. " total)";
            else
                expectedMinMax = " (" .. min .. "-" .. max .. " total)";
            end
        else
            text = flora.NAME .. ": " .. yield;
        end

    end

    if (expectedMinMax) then
        text = text .. expectedMinMax;
    end

    return text;
end

HerbalismFloraEn = {
    [FLORA_DWARFSBEARD] = {
        ["NAME"] = "Dwarfsbeard",
        ["FOUND_IN"] = "North Ithilien and the Wastes",
        ["YIELDS"] = {
            [1] = {
                ["PHIAL"] = PHIAL_UMBER,
                ["MIN"] = 1,
                ["MAX"] = 1,
            };
        };
    },
    [FLORA_ELFSPEAR] = {
        ["NAME"] = "Elfspear",
        ["FOUND_IN"] = "North Ithilien",
        ["YIELDS"] = {
            [1] = {
                ["PHIAL"] = PHIAL_VERDANT,
                ["MIN"] = 1,
                ["MAX"] = 1,
            };
        };
    },
    [FLORA_SOUTHRONS_CROWN] = {
        ["NAME"] = "Southron's Crown",
        ["FOUND_IN"] = "North Ithilien",
        ["YIELDS"] = {
            [1] = {
                ["PHIAL"] = PHIAL_CRIMSON,
                ["MIN"] = 1,
                ["MAX"] = 1,
            };
        };
    },
    [FLORA_HORSETAIL] = {
        ["NAME"] = "Horsetail",
        ["FOUND_IN"] = "North Ithilien and the Wastes",
        ["YIELDS"] = {
            [1] = {
                ["PHIAL"] = PHIAL_UMBER,
                ["MIN"] = 2,
                ["MAX"] = 2,
            };
        };
    },
    [FLORA_OXLIP] = {
        ["NAME"] = "Oxlip",
        ["FOUND_IN"] = "North Ithilien",
        ["YIELDS"] = {
            [1] = {
                ["PHIAL"] = PHIAL_VERDANT,
                ["MIN"] = 2,
                ["MAX"] = 2,
            };
        };
    },
    [FLORA_VETCHLING] = {
        ["NAME"] = "Vetchling",
        ["FOUND_IN"] = "North Ithilien",
        ["YIELDS"] = {
            [1] = {
                ["PHIAL"] = PHIAL_CRIMSON,
                ["MIN"] = 2,
                ["MAX"] = 2,
            };
        };
    },
    [FLORA_DRAKEWORT] = {
        ["NAME"] = "Drakewort",
        ["FOUND_IN"] = "North Ithilien",
        -- Sample loots:
        -- [Phial of Umber Extract], [2 Phials of Verdant Extract]
        -- [Phial of Crimson Extract], [2 Phials of Umber Extract]
        -- [2 Phials of Crimson Extract], [Phial of Verdant Extract]
        --
        ["YIELDS"] = {
            [1] = {
                ["PHIAL"] = PHIAL_CRIMSON,
                ["MIN"] = 0,
                ["MAX"] = 3,
            };
            [2] = {
                ["PHIAL"] = PHIAL_UMBER,
                ["MIN"] = 0,
                ["MAX"] = 3,
            };
            [3] = {
                ["PHIAL"] = PHIAL_VERDANT,
                ["MIN"] = 0,
                ["MAX"] = 3,
            };
            ["MIN"] = 3;
            ["MAX"] = 3;
        };
    },
    [FLORA_BELL_O_DALE] = {
        ["NAME"] = "Bell-o-Dale",
        ["FOUND_IN"] = "North Ithilien", -- and the wastes?!?
        -- Sample loots:
        -- [1 Phial of Sapphire Extract], [1 Phial of Verdant Extract], [1 l of Crimson Extract]
        -- [2 Phials of Verdant Extract], [1 Phial of Crimson Extract]
        -- [3 Phials of Verdant Extract]
        -- 
        ["YIELDS"] = {
            [1] = {
                ["PHIAL"] = PHIAL_CRIMSON,
                ["MIN"] = 0,
                ["MAX"] = 3,
            };
            [2] = {
                ["PHIAL"] = PHIAL_VERDANT,
                ["MIN"] = 0,
                ["MAX"] = 3,
            };
            ["MIN"] = 3;
            ["MAX"] = 3;
        };
    },
    [FLORA_BUCKTHORN] = {
        ["NAME"] = "Buckthorn",
        ["FOUND_IN"] = "North Ithilien",
        -- Sample loots:
        -- [2 Phials of Verdant Extract], [2 Phials of Umber Extract]
        -- [3 Phials of Verdant Extract], [1 Phials of Crimson Extract]
        ["YIELDS"] = {
            [1] = {
                ["PHIAL"] = PHIAL_CRIMSON,
                ["MIN"] = 0,
                ["MAX"] = 5,
            };
            [2] = {
                ["PHIAL"] = PHIAL_UMBER,
                ["MIN"] = 0,
                ["MAX"] = 5,
            };
            [3] = {
                ["PHIAL"] = PHIAL_VERDANT,
                ["MIN"] = 0,
                ["MAX"] = 5,
            };
            ["MIN"] = 4;
            ["MAX"] = 5;
        };
    },
    [FLORA_ROCK_ROSE] = {
        ["NAME"] = "Rock-rose",
        ["FOUND_IN"] = "North Ithilien",
        -- Sample loots:
        -- [3 Phials of Crimson Extract], [1 Phials of Umber Extract], [1 Phials of Verdant Extract]
        -- [4 Phials of Crimson Extract]
        -- [2 Phials of Crimson Extract], [1 Phials of Verdant Extract], [2 Phials of Umber Extract]
        -- [4 Phials of Crimson Extract], [Phial of Umber Extract]
        --
        ["YIELDS"] = {
            [1] = {
                ["PHIAL"] = PHIAL_CRIMSON,
                ["MIN"] = 0,
                ["MAX"] = 5,
            };
            [2] = {
                ["PHIAL"] = PHIAL_UMBER,
                ["MIN"] = 0,
                ["MAX"] = 5,
            };
            [3] = {
                ["PHIAL"] = PHIAL_VERDANT,
                ["MIN"] = 0,
                ["MAX"] = 5,
            };
            ["MIN"] = 4;
            ["MAX"] = 5;
        };
    },
    [FLORA_LARKSPUR] = {
        ["NAME"] = "Larkspur",
        ["FOUND_IN"] = "North Ithilien and the Wastes",
        -- Sample loots:
        -- [3 Phials of Umber Extract], [1 Phial of Crimson Extract]
        -- [3 Phials of Umber Extract], [2 Phials of Verdant Extract]
        -- [2 Phials of Umber Extract], [2 Phials of Verdant Extract]
        -- [4 Phials of Umber Extract]
        -- [2 Phials of Umber Extract], [1 Phial of Crimson Extract], [2 Phials of Verdant Extract]
        -- [3 Phials of Umber Extract], [1 Phial of Crimson Extract], [1 Phials of Verdant Extract]
        -- 
        ["YIELDS"] = {
            [1] = {
                ["PHIAL"] = PHIAL_CRIMSON,
                ["MIN"] = 0,
                ["MAX"] = 5,
            };
            [2] = {
                ["PHIAL"] = PHIAL_UMBER,
                ["MIN"] = 0,
                ["MAX"] = 5,
            };
            [3] = {
                ["PHIAL"] = PHIAL_VERDANT,
                ["MIN"] = 0,
                ["MAX"] = 5,
            };
            ["MIN"] = 4;
            ["MAX"] = 5;
        };
    },
    [FLORA_WRAITHSCOWL] = {
        ["NAME"] = "Wraithscowl",
        ["FOUND_IN"] = "The Wastes (during day)",
        ["YIELDS"] = {
            [1] = {
                ["PHIAL"] = PHIAL_VIOLET,
                ["MIN"] = 1,
                ["MAX"] = 2,
            };
        };
    },
    [FLORA_DUSKNETTLE] = {
        ["NAME"] = "Dusknettle",
        ["FOUND_IN"] = "The Wastes",
        ["YIELDS"] = {
            [1] = {
                ["PHIAL"] = PHIAL_VIOLET,
                ["MIN"] = 2,
                ["MAX"] = 4,
            };
        };
    },
    [FLORA_BONEMALLOW] = {
        ["NAME"] = "Bonemallow",
        ["FOUND_IN"] = "The Wastes",
        ["YIELDS"] = {
            [1] = {
                ["PHIAL"] = PHIAL_VIOLET,
                ["MIN"] = 2,
                ["MAX"] = 4,
            };
        };
    },
    [FLORA_EVENGLEAM] = {
        ["NAME"] = "Evengleam",
        ["FOUND_IN"] = "The Wastes",
        ["YIELDS"] = {
            [1] = {
                ["PHIAL"] = PHIAL_GOLDEN,
                ["MIN"] = 1,
                ["MAX"] = 2,
            };
        };
    },
    [FLORA_MOURNWEED] = {
        ["NAME"] = "Mournweed",
        ["FOUND_IN"] = "The Wastes",
        ["YIELDS"] = {
            [1] = {
                ["PHIAL"] = PHIAL_GOLDEN,
                ["MIN"] = 1,
                ["MAX"] = 2,
            };
        };
    },
    [FLORA_EYE_OF_NIGHT] = {
        ["NAME"] = "Eye-of-Night",
        ["FOUND_IN"] = "The Wastes (during night)",
        ["YIELDS"] = {
            [1] = {
                ["PHIAL"] = PHIAL_GOLDEN,
                ["MIN"] = 2,
                ["MAX"] = 4,
            };
        };
    },
};

HerbalismFlora = HerbalismFloraEn;
