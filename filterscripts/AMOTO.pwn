#include <a_samp>
#include <zcmd>


public OnFilterScriptInit()
{
    AddStaticPickup(19607, 23, -1973.9192, 180.8490, 26.6284, 0);
    AddStaticPickup(19607, 23, 2841.3347, 1360.5601, 10.7733, 0);
    AddStaticPickup(19607, 23, 930.4918, -1109.4164, 24.2090, 0);
    AddStaticPickup(19607, 23, 1696.9816, -1866.6749, 12.5122, 0);
    return 1;
}

CMD:ir(playerid, params[])
{
	SetPlayerInterior(playerid, 18);
	SetPlayerPos(playerid, 1710.433715,-1669.379272,20.225049);
}

CMD:sair(playerid, params[])
{
	SetPlayerInterior(playerid, 0);
	SetPlayerPos(playerid, -1973.9192, 180.8490, 26.6284);
}

CMD:alugarmoto(playerid, params[])
{
    if(IsPlayerInRangeOfPoint(playerid, 10.0, 2841.3347, 1360.5601, 10.7733))
	{
		if(GetPlayerMoney(playerid) >= 100)
		{
 			new IDVEH;
			IDVEH = CreateVehicle(462, 2841.3347, 1360.5601, 10.7733, 0, 1, 1, 250);
			PutPlayerInVehicle(playerid, IDVEH, 0);
			SendClientMessage(playerid, 0xFF030FFF, "[FRP] Voce pagou R$100 pelo aluguel da moto!");
			GivePlayerMoney(playerid, -100);
			return 1;
		}
		else
		{
			SendClientMessage(playerid, 0xFF030FFF, "[FRP] Voce nao tem R$100 para alugar uma moto!");
			return 1;
		}
	} 
	if(IsPlayerInRangeOfPoint(playerid, 10.0, 1696.9816,-1866.6749,13.5545))
	{
		if(GetPlayerMoney(playerid) >= 100)
		{
 			new IDVEH;
			IDVEH = CreateVehicle(462, 1696.9816,-1866.6749,13.5545, 0, 1, 1, 250);
			PutPlayerInVehicle(playerid, IDVEH, 0);
			SendClientMessage(playerid, 0xFF030FFF, "[FRP] Voce pagou R$100 pelo aluguel da moto!");
			GivePlayerMoney(playerid, -100);
			return 1;
		}
		else
		{
			return 1;
		}
	} 
	if(IsPlayerInRangeOfPoint(playerid, 10.0, -1973.9192, 180.8490, 27.6875))
	{
		if(GetPlayerMoney(playerid) >= 100)
		{
 			new IDVEH;
			IDVEH = CreateVehicle(462, -1973.9192, 180.8490, 27.6875, 0, 1, 1, 250);
			PutPlayerInVehicle(playerid, IDVEH, 0);
			SendClientMessage(playerid, 0xFF030FFF, "[FRP] Voce pagou R$100 pelo aluguel da moto!");
			GivePlayerMoney(playerid, -100);
			return 1;
		}
		else
		{
			SendClientMessage(playerid, 0xFF030FFF, "[FRP] Voce nao tem R$100 para alugar uma moto!");
			return 0;
		}
	} 
	if(IsPlayerInRangeOfPoint(playerid, 10.0, 930.4918,-1109.4164,24.2090))
	{
		if(GetPlayerMoney(playerid) >= 100)
		{
 			new IDVEH;
			IDVEH = CreateVehicle(462, 930.4918,-1109.4164,24.2090, 0, 1, 1, 250);
			PutPlayerInVehicle(playerid, IDVEH, 0);
			SendClientMessage(playerid, 0xFF030FFF, "[FRP] Voce pagou R$100 pelo aluguel da moto!");
			GivePlayerMoney(playerid, -100);
			return 0;
		}
		else
		{
			SendClientMessage(playerid, 0xFF030FFF, "[FRP] Voce nao tem R$100 para alugar uma moto!");
			return 1;
		}
	} 
	else
	{
		SendClientMessage(playerid, 0xFF9C9CF6, "[FRP] Voce nao esta no local adequado para alugar uma moto!");
	}
	return 1;
}