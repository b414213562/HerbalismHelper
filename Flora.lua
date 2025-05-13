
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

DWARFSBEARD = 1;
ELFSPEAR = 2;
SOUTHRONS_CROWN = 3;
HORSETAIL = 4;
OXLIP = 5;
VETCHLING = 6;
DRAKEWORT = 7;
BELL_O_DALE = 8;
BUCKTHORN = 9;
ROCK_ROSE = 10;
LARKSPUR = 11;
WRAITHSCOWL = 12;
DUSKNETTLE = 13;
BONEMALLOW = 14;
EVENGLEAM = 15;
MOURNWEED = 16;
EYE_OF_NIGHT = 17;

HerbalismFloraNamesEn = {
    [DWARFSBEARD] = "Dwarfsbeard",
    [ELFSPEAR] = "Elfspear",
    [SOUTHRONS_CROWN] = "Southron's Crown",
    [HORSETAIL] = "Horsetail",
    [OXLIP] = "Oxlip",
    [VETCHLING] = "Vetchling",
    [DRAKEWORT] = "Drakewort",
    [BELL_O_DALE] = "Bell-o-Dale",
    [BUCKTHORN] = "Buckthorn",
    [ROCK_ROSE] = "Rock-rose",
    [LARKSPUR] = "Larkspur",
    [WRAITHSCOWL] = "Wraithscowl",
    [DUSKNETTLE] = "Dusknettle",
    [BONEMALLOW] = "Bonemallow",
    [EVENGLEAM] = "Evengleam",
    [MOURNWEED] = "Mournweed",
    [EYE_OF_NIGHT] = "Eye-of-Night",
}

HerbalismFloraNames = HerbalismFloraNamesEn;

HerbalismFloraLookupEn = {
    ["Dwarfsbeard"] = DWARFSBEARD,
    ["Elfspear"] = ELFSPEAR,
    ["Southron's Crown"] = SOUTHRONS_CROWN,
    ["Horsetail"] = HORSETAIL,
    ["Oxlip"] = OXLIP,
    ["Vetchling"] = VETCHLING,
    ["Drakewort"] = DRAKEWORT,
    ["Bell-o-Dale"] = BELL_O_DALE,
    ["Buckthorn"] = BUCKTHORN,
    ["Rock-rose"] = ROCK_ROSE,
    ["Larkspur"] = LARKSPUR,
    ["Wraithscowl"] = WRAITHSCOWL,
    ["Dusknettle"] = DUSKNETTLE,
    ["Bonemallow"] = BONEMALLOW,
    ["Evengleam"] = EVENGLEAM,
    ["Mournweed"] = MOURNWEED,
    ["Eye-of-Night"] = EYE_OF_NIGHT,
}

HerbalismFloraLookup = HerbalismFloraLookupEn;

HerbalismFloraEn = {
    [DWARFSBEARD] = {
        ["FOUND_IN"] = "North Ithilien and the Wastes",
        ["YIELDS"] = "1 Phial of Umber Extract",
    },
    [ELFSPEAR] = {
        ["FOUND_IN"] = "North Ithilien",
        ["YIELDS"] = "1 Phial of Verdant Extract",
    },
    [SOUTHRONS_CROWN] = {
        ["FOUND_IN"] = "North Ithilien",
        ["YIELDS"] = "1 Phial of Crimson Extract",
    },
    [HORSETAIL] = {
        ["FOUND_IN"] = "North Ithilien and the Wastes",
        ["YIELDS"] = "2 Phials of Umber Extract",
    },
    [OXLIP] = {
        ["FOUND_IN"] = "North Ithilien",
        ["YIELDS"] = "2 Phials of Verdant Extract",
    },
    [VETCHLING] = {
        ["FOUND_IN"] = "North Ithilien",
        ["YIELDS"] = "2 Phials of Crimson Extract",
    },
    [DRAKEWORT] = {
        ["FOUND_IN"] = "North Ithilien",
        ["YIELDS"] = "3 phials of assorted extracts",
    },
    [BELL_O_DALE] = {
        ["FOUND_IN"] = "North Ithilien",
        ["YIELDS"] = "3 phials of assorted extracts",
        -- Sample loots:
        -- [1 Phial of Sapphire Extract], [1 Phial of Verdant Extract], [1 Phial of Crimson Extract]
        -- [2 Phials of Verdant Extract], [1 Phial of Crimson Extract]
        -- [3 Phials of Verdant Extract]
        -- 
    },
    [BUCKTHORN] = {
        ["FOUND_IN"] = "North Ithilien",
        ["YIELDS"] = "4-5 phials of assorted extracts",
        -- Sample loots:
        -- [2 Phials of Verdant Extract], [2 Phials of Umber Extract]
    },
    [ROCK_ROSE] = {
        ["FOUND_IN"] = "North Ithilien",
        ["YIELDS"] = "4-5 phials of assorted extracts",
        -- Sample loots:
        -- [3 Phials of Crimson Extract], [1 Phials of Umber Extract], [1 Phials of Verdant Extract]
    },
    [LARKSPUR] = {
        ["FOUND_IN"] = "North Ithilien and the Wastes",
        ["YIELDS"] = "4-5 phials of assorted extracts",
        -- Sample loots:
        -- [3 Phials of Umber Extract], [2 Phials of Verdant Extract]
        -- [2 Phials of Umber Extract], [2 Phials of Verdant Extract]
        -- [4 Phials of Umber Extract]
        -- [2 Phials of Umber Extract], [1 Phial of Crimson Extract], [2 Phials of Verdant Extract]
        -- [3 Phials of Umber Extract], [1 Phial of Crimson Extract]
        -- 
    },
    [WRAITHSCOWL] = {
        ["FOUND_IN"] = "The Wastes (during day)",
        ["YIELDS"] = "1-2 Phials of Violet Extract",
    },
    [DUSKNETTLE] = {
        ["FOUND_IN"] = "The Wastes",
        ["YIELDS"] = "2-4 Phial of Violet Extract",
    },
    [BONEMALLOW] = {
        ["FOUND_IN"] = "The Wastes",
        ["YIELDS"] = "2-4 Phial of Violet Extract",
    },
    [EVENGLEAM] = {
        ["FOUND_IN"] = "The Wastes",
        ["YIELDS"] = "1-2 Phials of Golden Extract",
    },
    [MOURNWEED] = {
        ["FOUND_IN"] = "The Wastes",
        ["YIELDS"] = "1-2 Phials of Golden Extract",
    },
    [EYE_OF_NIGHT] = {
        ["FOUND_IN"] = "The Wastes (during night)",
        ["YIELDS"] = "2-3 Phials of Golden Extract",
    },
};

HerbalismFlora = HerbalismFloraEn;
