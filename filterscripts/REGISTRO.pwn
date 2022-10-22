#include <a_samp>
#include <dof2>


#define VERDE                   0x21DD00FF
#define VERMELHO                0xFF030FFF
#define VERMELHO_ESCURO         0xE60000FF
#define VERMELHO_CLARO          0xFB0000FF
#define AMARELO                 0xFFFF00FF
#define LARANJA                 0xF97804FF
#define AZUL_CLARO              0x00C2ECFF
#define ROXO                    0xB360FDFF
#define BRANCO		    		0xFFFFFFFF
#define PRETO                   0x000000FF
#define AZUL                    0x1229FAFF
#define VERDE_CLARO             0x38FF06FF
#define ROSA_CHOQUE             0xE100E1FF
#define VERDE_ESCURO            0x008040FF
#define CINZA                   0xCECECEFF
#define ROSA                    0xF148FF0
#define CINZA_ESCURO       		0x626262FF
#define VERDE_AGUA       		0x03D687FF



#define DIALOG_REGISTRO    		4672
#define DIALOG_LOGIN            4673
#define DIALOG_BANIDO           4674

new StringContas[256];
new String[128];


public OnFilterScriptInit()
{
    return 1;
}

public OnFilterScriptExit()
{
    
    return 1;
}

public OnPlayerConnect(playerid)
{
    format(StringContas, sizeof(StringContas), "FRP/Contas/%s.txt", Nome(playerid));
    if(!DOF2_FileExists(StringContas))
    {
        format(String, sizeof(String), "{F1FC14}Conta: {FFFFFF}%s\n{F1FC14}Status: {FC1E1E}Nao registrada.\n\n{FFFFFF}Digite uma senha para se registrar\nem nosso servidor.", Nome(playerid));
		ShowPlayerDialog(playerid, DIALOG_REGISTRO, DIALOG_STYLE_PASSWORD, "{fc52f7}BEM-VINDO AO FUTURE ROLEPLAY", String, "Registrar", "Sair");
        return 1;
    }
    else
    {
        format(String, sizeof(String), "{F1FC14}Conta: {FFFFFF}%s\n{F1FC14}Status: {28FC14}Registrada.\n\n{FFFFFF}Digite sua senha para Logar", Nome(playerid));
		ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "{fc52f7}BEM-VINDO FUTURE ROLEPLAY", String, "Logar", "Sair");
		return 1;
    }
    return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
    new File[56],Float:pPosX[MAX_PLAYERS], Float:pPosY[MAX_PLAYERS], Float:pPosZ[MAX_PLAYERS], Float:pPosA[MAX_PLAYERS],pInterior[MAX_PLAYERS];
    format(File, 56, "LLADMIN/Contas/%s.txt", Nome(playerid)); // Cria o "caminho" at� o local onde ser� salvo o Arquivo com a posi��o do Player
    GetPlayerPos(playerid, pPosX[playerid], pPosY[playerid], pPosZ[playerid]); // Pega a Posi��o do Player em X, Y e Z, e converte para "pPosX", "pPosY" e "pPosZ", respectivamente.
    GetPlayerFacingAngle(playerid, pPosA[playerid]); // Pega o �ngulo do Player em A e converte para pPosA, logo pPosA = �ngulo do Player
    pInterior[playerid] = GetPlayerInterior(playerid); // Pega o interior do Player, que fica armazenado em pInterior.
    if(!DOF2_FileExists(File)) // Checa se a File existe
    {
		DOF2_CreateFile(File);
	}
    DOF2_SetFloat(File, "PosX", pPosX[playerid]); // Escreve dentro do Arquivo: "PosX = pPosX (posi��o que pegamos antes, lembra ?)
    DOF2_SetFloat(File, "PosY", pPosY[playerid]); // Escreve dentro do Arquivo: "PosY = pPosY (posi��o que pegamos antes, lembra ?)
   	DOF2_SetFloat(File, "PosZ", pPosZ[playerid]); // Escreve dentro do Arquivo: "PosZ = pPosZ (posi��o que pegamos antes, lembra ?)
    DOF2_SetFloat(File, "PosA", pPosA[playerid]); // Escreve dentro do Arquivo: "PosA = pPosA (posi��o que pegamos antes, lembra ?)
    DOF2_SetInt(File, "Interior", pInterior[playerid]); // Escreve dentro do Arquivo: "Interior = pInterior (interior que pegamos antes, lembra ?)
	DOF2_SetInt(File, "VW", GetPlayerVirtualWorld(playerid));
    DOF2_SetInt(StringContas, "Skin", GetPlayerSkin(playerid));
	DOF2_SetInt(StringContas, "Grana", GetPlayerMoney(playerid)); 
   	DOF2_SaveFile(); // Salva o arquivo.
    DOF2_Exit();
    return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(dialogid == DIALOG_REGISTRO)
	{
	    if(response)
	    {
	        if(!strlen(inputtext))
	        {
	            SendClientMessage(playerid, VERMELHO, "Digite uma senha para se registrar");
	            format(String, sizeof(String), "{F1FC14}Conta: {FFFFFF}%s\n{F1FC14}Status: {FC1E1E}Nao registrada.\n\n{FFFFFF}Digite uma senha para se registrar\nem nosso servidor.", Nome(playerid));
		    	ShowPlayerDialog(playerid, DIALOG_REGISTRO, DIALOG_STYLE_PASSWORD, "    {fc52f7}BEM-VINDO FUTURE ROLEPLAY", String, "Registrar", "Sair");
	            return 1;
			}
			format(StringContas, sizeof(StringContas), "FRP/Contas/%s.txt", Nome(playerid));
			DOF2_CreateFile(StringContas);
			DOF2_SetString(StringContas, "Senha", inputtext);
			DOF2_SetInt(StringContas, "Grana", 0);
            GivePlayerMoney(playerid, 1000);
            ShowPlayerDialog(playerid, SEXO, DIALOG_STYLE_LIST, "{fc52f7}[FRP] SELECIONE O SEXO DO PERSONAGEM", "{FFFFFF}MASCULINO\n{FFFF00}FEMININO", "SELECIONAR", "CANCELAR");
			return 1;
		}
		else
		{
		    SendClientMessage(playerid, VERMELHO, "[FRP] Voce nao quis se registrar e por isso foi kickado!");
			DOF2_RemoveFile("FRP/Contas/%s.txt");
			Kick(playerid);
			return 1;
		}
	}
}
	if(dialogid == SEXO)
	{
		if(response)
		{
			if(listitem == 0)
			{
			SpawnPlayer(playerid);
			TogglePlayerSpectating(playerid, 0); 
            SetSpawnInfo(playerid, 0, 78, 1701.5032, -1667.9645, 20.2358, 90.0000, 0, 0, 0, 0, 0, 0);
			DOF2_SetInt(StringContas, "Skin", GetPlayerSkin(playerid));
			SendClientMessage(playerid, VERDE, "[FRP] Voce escolheu que seu personagem sera masculino!");
			SendClientMessage(playerid, LARANJA, "============== [ {FFFFFF}Future Roleplay{F97804} ] =============");
			SendClientMessage(playerid, LARANJA, "Bem-vindo a cidade do Future Roleplay!");
			SendClientMessage(playerid, LARANJA, "Acesse nosso discord pelo link: {FFFFFF}discord.gg/GSK3jecbWM");
			SendClientMessage(playerid, LARANJA, "Ajude nossa cidade a crescer, chame amigos para jogar com voce!");
			SendClientMessage(playerid, LARANJA, "===========================================");
			}
			if(listitem == 1)
			{
			SpawnPlayer(playerid);
			TogglePlayerSpectating(playerid, 0);
            SetSpawnInfo(playerid, 0, 77, 1701.5032, -1667.9645, 20.2358, 90.0000, 0, 0, 0, 0, 0, 0); 
			DOF2_SetInt(StringContas, "Skin", GetPlayerSkin(playerid));
			SendClientMessage(playerid, VERDE, "[FRP] Voce escolheu que seu personagem sera feminino!");
			SendClientMessage(playerid, LARANJA, "============== [ {FFFFFF}Future Roleplay{F97804} ] =============");
			SendClientMessage(playerid, LARANJA, "Bem-vindo a cidade do Future Roleplay!");
			SendClientMessage(playerid, LARANJA, "Acesse nosso discord pelo link: {FFFFFF}discord.gg/GSK3jecbWM");
			SendClientMessage(playerid, LARANJA, "Ajude nossa cidade a crescer, chame amigos para jogar com voce!");
			SendClientMessage(playerid, LARANJA, "===========================================");
			return 1;
			}
		}
    if(dialogid == DIALOG_LOGIN)
	{
	    if(response)
	    {
	        if(!strlen(inputtext))
	        {
	            format(String, sizeof(String), "{F1FC14}Conta: {FFFFFF}%s\n{F1FC14}Status: {28FC14}Registrada.\n\n{FFFFFF}Digite sua senha para Logar", Nome(playerid));
	            SendClientMessage(playerid, VERMELHO, "[FRP] Digite sua senha para se logar");
		    	ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "{FC14E9}BEM-VINDO FUTURE ROLEPLAY", String, "Logar", "Sair");
             	return 1;
			}
			format(StringContas, sizeof(StringContas), "FRP/Contas/%s.txt", Nome(playerid));
			if(strcmp(inputtext, DOF2_GetString(StringContas, "Senha"), false))
			{
                format(String, sizeof(String), "{F1FC14}Conta: {FFFFFF}%s\n{F1FC14}Status: {28FC14}Registrada.\n\n{FFFFFF}Digite sua senha para Logar", Nome(playerid));
                SendClientMessage(playerid, VERMELHO_CLARO, "[FRP] Senha incorreta!");
		    	ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "{FC14E9}BEM-VINDO FUTURE ROLEPLAY - FRP", String, "Logar", "Sair");
				return 1;
			}
			else 
			{
                SpawnPlayer(playerid);
                SetCameraBehindPlayer(playerid);
                SetPlayerPos(playerid, DOF2_GetFloat(StringContas, "PosX"),  DOF2_GetFloat(StringContas, "PosY"), DOF2_GetFloat(StringContas, "PosZ"));
                SetPlayerVirtualWorld(playerid, DOF2_GetInt(StringContas, "VW"));
	            SetPlayerInterior(playerid, DOF2_GetInt(StringContas, "Interior"));
                SetPlayerFacingAngle(playerid, DOF2_GetFloat(StringContas, "PosA"));
	            SetPlayerSkin(playerid, DOF2_GetInt(StringContas, "Skin"));
	            GivePlayerMoney(playerid, DOF2_GetInt(StringContas, "Grana"));
				SendClientMessage(playerid, CINZA, "Logado Com sucesso!");
				SendClientMessage(playerid, LARANJA, "============== [ {FFFFFF}Future Roleplay{F97804} ] =============");
				SendClientMessage(playerid, LARANJA, "Bem-vindo a cidade do Future Roleplay!");
				SendClientMessage(playerid, LARANJA, "Acesse nosso discord pelo link: {FFFFFF}discord.gg/GSK3jecbWM");
				SendClientMessage(playerid, LARANJA, "Voce foi setado na ultima posicao onde saiu do jogo.");
				SendClientMessage(playerid, LARANJA, "===========================================");
				return 1;
			}
		}
		else
		{
		    SendClientMessage(playerid, VERMELHO, "[FRP] Voce nao quis se Logar e por isso foi kickado!");
			Kick(playerid);
			return 1;
		}
	}

stock Nome(playerid)
{
	new pNome[MAX_PLAYER_NAME];
	GetPlayerName(playerid, pNome, 24);
	return pNome;
}