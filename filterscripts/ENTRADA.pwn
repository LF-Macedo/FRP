#include <a_samp>


new Text:PublicTD[4];


public OnFilterScriptInit()
{
    PublicTD[0] = TextDrawCreate(-28.000000, -25.000000, ".");
	TextDrawTextSize(PublicTD[0], 689.000000, 87.000000);
	TextDrawLetterSize(PublicTD[0], 0.262499, 55.350002);
	TextDrawBackgroundColor(PublicTD[0], 255);
	TextDrawSetProportional(PublicTD[0], 1);
	TextDrawSetSelectable(PublicTD[0], 0);
	TextDrawSetOutline(PublicTD[0], 1);
	TextDrawBoxColor(PublicTD[0], 156);
	TextDrawSetShadow(PublicTD[0], 0);
	TextDrawAlignment(PublicTD[0], 1);
	TextDrawColor(PublicTD[0], -1);
	TextDrawUseBox(PublicTD[0], 1);
	TextDrawFont(PublicTD[0], 1);

	PublicTD[1] = TextDrawCreate(251.000000, 179.000000, "FUTURE");
    TextDrawTextSize(PublicTD[1], 371.500000, 17.000000);
	TextDrawLetterSize(PublicTD[1], 0.737498, 3.449997);
	TextDrawBackgroundColor(PublicTD[1], -186);
	TextDrawSetProportional(PublicTD[1], 0);
	TextDrawSetSelectable(PublicTD[1], 0);
	TextDrawSetOutline(PublicTD[1], 0);
	TextDrawAlignment(PublicTD[1], 1);
	TextDrawSetShadow(PublicTD[1], 2);
	TextDrawBoxColor(PublicTD[1], 0);
	TextDrawColor(PublicTD[1], -1);
	TextDrawUseBox(PublicTD[1], 0);
	TextDrawFont(PublicTD[1], 2);

	
	PublicTD[2] = TextDrawCreate(257.000000, 210.000000, "ROLE");
    TextDrawTextSize(PublicTD[2], 400.000000, 17.000000);
	TextDrawLetterSize(PublicTD[2], 0.600000, 2.000000);
	TextDrawBackgroundColor(PublicTD[2], -256);
	TextDrawSetProportional(PublicTD[2], 1);
	TextDrawSetSelectable(PublicTD[2], 0);
	TextDrawSetOutline(PublicTD[2], 1);
	TextDrawAlignment(PublicTD[2], 1);
	TextDrawColor(PublicTD[2], 65535);
	TextDrawSetShadow(PublicTD[2], 0);
	TextDrawBoxColor(PublicTD[2], 0);
	TextDrawUseBox(PublicTD[2], 1);
	TextDrawFont(PublicTD[2], 1);

	PublicTD[3] = TextDrawCreate(310.000000, 210.000000, "PLAY"); 
    TextDrawTextSize(PublicTD[3], 400.000000, 17.000000);
	TextDrawLetterSize(PublicTD[3], 0.600000, 2.000000);
	TextDrawBackgroundColor(PublicTD[3], -256);
	TextDrawSetProportional(PublicTD[3], 1);
	TextDrawSetSelectable(PublicTD[3], 0);
	TextDrawSetOutline(PublicTD[3], 1);
	TextDrawAlignment(PublicTD[3], 1);
	TextDrawSetShadow(PublicTD[3], 0);
	TextDrawBoxColor(PublicTD[3], 0);
	TextDrawUseBox(PublicTD[3], 1);
	TextDrawColor(PublicTD[3], -1);
	TextDrawFont(PublicTD[3], 1);
	return 1;
}

public OnFilterScriptExit()
{
	return 1;
}

public OnPlayerConnect(playerid)
{
	TextDrawShowForPlayer(playerid, PublicTD[0]);
	TextDrawShowForPlayer(playerid, PublicTD[1]);
	TextDrawShowForPlayer(playerid, PublicTD[2]);
	TextDrawShowForPlayer(playerid, PublicTD[3]);
	return 1;
}

public OnPlayerSpawn(playerid)
{
	TextDrawDestroy(PublicTD[0]);
	TextDrawDestroy(PublicTD[1]);
	TextDrawDestroy(PublicTD[2]);
	TextDrawDestroy(PublicTD[3]);
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	return 1;
}
