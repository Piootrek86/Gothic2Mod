// --------------------------------------------------------------- //
//                    WSZYSTKIE HOOKI BY PIOOTREK86                //

func void Hook_Init()
{	
	MEM_Info("*                                                                        *");
	MEM_Info("*                                                                        *");
	MEM_Info("*                                                                        *");
	MEM_Info("*                                                                        *");
	MEM_Info("*                                                                        *");
	MEM_Info("***************************** PIOOTREK86 *********************************");
	MEM_Info("*                                                                        *");
	MEM_Info("*                                                                        *");
	MEM_Info("*                                                                        *");
	MEM_Info("*                                                                        *");
	MEM_Info("*                                                                        *");
	MEM_Info("*                                                                        *");
	MEM_Info("*                                                                        *");
	MEM_Info("*                                                                        *");
	MEM_Info("*                                                                        *");
	
	const int done1 = 0;
	const int done2 = 0;
	const int done3 = 0;
	const int done4 = 0;
	const int done5 = 0;
	const int done6 = 0;
	const int done7 = 0;
	
	var int x;
	var int y;
	
	
	
	
    
	x = Print_Screen[PS_X] /2;			// Wartość dla pozycji X
	y = Print_Screen[PS_Y] - 52;		// Wartość dla pozycji Y
	
	if(!done1)
    {HookEngineF(oCNpc__OpenInventory,     6, NPCWLACZAEKWIPUNEK);done1 = 1;	// okno ekwipunku otwarcie
	};
	
	if(!done2)
	{HookEngineF(oCNpc__CloseInventory,     6, NPCWYLACZAEKWIPUNEK);done2 = 1;	// okno ekwipunku zamkniecie
	};
	
	if(!done3)
	{HookEngineF(4707920,6, OKNO_STATYSTYK_OTWORZ);done3 = 1;	// okno statystyk otwarcie
	};
	
	if(!done4)
	{HookEngineF(4713296,7, OKNO_STATYSTYK_ZAMKNIJ);done4 = 1;	// okno statystyk zamkniecie
	};
	
	if(!done5)
	{HookEngineF(7647008,5, oCNpcOnTouch);done5 = 1;	// oCNpc::OnTouch(zCVob
	};
	
	if(!done6)
	{FF_ApplyExt(Talenty_Init,1,1);done6 = 1;
	};
	



};


