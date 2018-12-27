// By Piootrek86 (Piotr Pasik) //
// email: piootrek86@op.pl     //
//-----------------------------//
func void dnitygodnia()
{
	if dzien ==7
		{
		dzien = dzien - 6;
		if tydzien == 4 {tydzien = 1;};
		if tydzien < 4	{tydzien = tydzien +1;};
		
		}
	else
		{

		dzien = dzien +1;
		MEM_Info("-------------------->>>>>>>>>>>>>         Doda³em +1 do numeru dnia");
		};

};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////// ODŒWIE¯ANIE RUTYN NPC     //////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
func void odswiezamrutyny ()
{
// RUTYNY NPC ODSWIEZANIE    NPC,        RUTYNA
	Npc_ExchangeRoutine (NONE_100_Xardas,"START");		// Odœwie¿a rutyne Xardasa

};

func void panelek()		// W³¹czanie i wy³¹czanie informacji na ekranie podczas gry
{	

if(MEM_KeyState(KEY_I)==KEY_PRESSED ) 	// Je¿eli wciœniety klawisz I
{ 	

	if wlaczone ==1		// Je¿eli informacje s¹ ju¿ w³¹czone
	{	
		wlaczone =0;	// Wy³¹czam je
		MEM_Info("-------------------->>>>>>>>>>>>>         Wylaczam  menu info na pulpicie ------------*********************");
	}
	else 				// w innym wypadku czyli je¿eli informacje s¹ wy³¹czone
	{	
		wlaczone =1;	// W³¹czam je
		MEM_Info("-------------------->>>>>>>>>>>>>         Wlanczone jest menu info na pulpicie ------------*********************");
	};

};
};

// ----------------------------- ******************************************************* --------------------------------------- //

func void statystykinaekranie ()
{	
	
	var int x;
	var int y;
	var int i;
	var int hp;
	var int mp;
	var int exp;
	var int intval;
	var int inte;
	
	var string s;			// string punkty hp i hp max
	var string s1;			// punkty mp
	var string s2;			// punkty exp
	var string s3;			// string "Mana" i punkty mp i mp max
	var string s4;			// string "Zycie" i punkty hp i hp max
	var string s5;			// string "Doswiadczenie" i punkty exp i exp max

	var string day;
	var string PTK_HP_NAZWA;	// string nazwy wyswietlanej przed hp i hp max (Zycie)
	var string PTK_MP_NAZWA;	// string nazwy wyswietlanej przed mp i mp max (Mana)
	var string PTK_EXP_NAZWA;	// string nazwy wyswietlanej przed exp i exp max (Doswiadczenie)
	var string PTK_HP;			// string wyswietlanej ilosci hp
	var string PTK_HP_MAX;		// string wyswietlanej ilosci hp max
	var string PTK_MP;			// string wyswietlanej ilosci mp
	var string PTK_MP_MAX;		// string wyswietlanej ilosci mp max
	var string PTK_EXP;			// string wyswietlanej ilosci exp
	var string PTK_EXP_MAX;		// string wyswietlanej ilosci exp next
	
	PTK_HP_NAZWA = "¯ycie: ";
	PTK_MP_NAZWA = "Mana: ";
	PTK_EXP_NAZWA = "Doœwiadczenie: ";
	PTK_HP = ConcatStrings (IntToString(hero.attribute[ATR_HITPOINTS])," / ");		// Zapisuje do string punkty hp (ATR_HITPOINTS)
	PTK_HP_MAX =ConcatStrings (IntToString(hero.attribute[ATR_HITPOINTS_MAX]),"");	// Zapisuje do string punkty hp max (ATR_HITPOINTS_MAX)
	PTK_MP = ConcatStrings (IntToString(hero.attribute[ATR_MANA])," / ");			// Zapisuje do string punkty mp (ATR_MANA)
	PTK_MP_MAX =ConcatStrings (IntToString(hero.attribute[ATR_MANA_MAX]),"");		// Zapisuje do string punkty mp max (ATR_MANA_MAX)
	PTK_EXP = ConcatStrings (IntToString(hero.exp)," / ");							// Zapisuje do string punkty exp 
	PTK_EXP_MAX =ConcatStrings (IntToString(hero.exp_next),"");						// Zapisuje do string punkty exp next 

	s=ConcatStrings (PTK_HP, PTK_HP_MAX);	// Laczy  stringi  PTK_HP i PTK_HP_MAX
	s1=ConcatStrings (PTK_MP,PTK_MP_MAX);	// Laczy dwa stringi PTK_MP i PTK_MP_MAX
	s2=ConcatStrings (PTK_EXP,PTK_EXP_MAX);	// Laczy dwa stringi PTK_MP i PTK_MP_MAX
	s3=ConcatStrings (PTK_MP_NAZWA, s1);	// Laczy  stringi  PTK_MP_NAZWA i s1 (PTK_MP i PTK_MP_MAX)
	s4=ConcatStrings (PTK_HP_NAZWA, s);		// Laczy  stringi  PTK_HP_NAZWA i s (PTK_HP i PTK_HP_MAX)
	s5=ConcatStrings (PTK_EXP_NAZWA, s2);	// Laczy  stringi  PTK_MP_NAZWA i s1 (PTK_MP i PTK_MP_MAX)

	intval = TAL_GetValue(self, Inteligencja);
	var string valint;
	valint		= ConcatStrings (IntToString(intval),"");

	x = Print_Screen[PS_X] /2;			// Wartoœæ dla pozycji X
	y = Print_Screen[PS_Y] - 52;		// Wartoœæ dla pozycji Y

	Print_DeleteText(i);	// Usówa z ekranu text i - Dzieñ tygodnia
	Print_DeleteText(hp);	// Usówa z ekranu text hp - Punkty hp i hp max
	Print_DeleteText(mp);	// Usówa z ekranu text mp - Punkty mp i mp max
	Print_DeleteText(exp);	// Usówa z ekranu text exp - Punkty exp i exp next
				
	// Przypisuje nazwy dni tygodnia do stringa day //---------------------------------------------------------------------------------//
	if dzien == 1 {day = "Poniedzia³ek";};  // Dzien jeden = Poniedziale
	if dzien == 2 {day = "Wtorek";};		// Dzien dwa = Wtorek
	if dzien == 3 {day = "Œroda";};			// Dzien trzy = Œroda
	if dzien == 4 {day = "Czwartek";};		// Dzieñ cztery = Czwartek
	if dzien == 5 {day = "Pi¹tek";};		// Dzieñ piêæ = Pi¹tek
	if dzien == 6 {day = "Sobota";};		// Dzieñ szeœæ = Sobota
	if dzien == 7 {day = "Niedziela";};		// Dzieñ siedem = Niedziela
	//*******-----------------------------------------------------------------------------------------------------------------********//
	
	// Je¿eli informacje na ekranie zostan¹ w³¹czone : 	//----------------------------------------------------------------------------//
	//																																  //
	//                                                   TUTAJ WPISUJEMY CO CHCEMY BY SIE DZIA£O GDY W£¥CZYMY INFORMACJE GUZIKIEM I   //
	//													//----------------------------------------------------------------------------//
	//																																  //
	
	if wlaczone ==1
	{	
		//          	     x, y, text,   font,       		 color,                time
		i = Print_ExtPxl(4, 2, day, FONT_ScreenSmall, RGBA(255, 255, 255, 255), -1); 			// Wyswietla nazwe dni
		hp = Print_ExtPxl(x-x+40, y, s4, FONT_ScreenSmall, RGBA(255, 255, 255, 255), -1); 		// Wyswietla text hp - Punkty hp i hp max
		mp = Print_ExtPxl(x+x-190, y, s3, FONT_ScreenSmall, RGBA(255, 255, 255, 255), -1); 		// Wyswietla text mp - Punkty mp i mp max
		exp = Print_ExtPxl(x-130, y, s5, FONT_ScreenSmall, RGBA(255, 255, 255, 255), -1); 		// Wyswietla text exp - Punkty exp i exp next
	
	}

	// Je¿eli informacje na ekranie zostan¹ wy³¹czone : 	//----------------------------------------------------------------------------//
	//													   //  																		  	 //
	//                                                    //TUTAJ WPISUJEMY CO CHCEMY BY SIE DZIA£O GDY WY£¥CZYMY INFORMACJE GUZIKIEM I //
	//												     //----------------------------------------------------------------------------//
	//																																  //
	
	else
	{
		Print_DeleteText(i);	// Usówa z ekranu text i - Dzieñ tygodnia
		Print_DeleteText(hp);	// Usówa z ekranu text hp - Punkty hp i hp max
		Print_DeleteText(mp);	// Usówa z ekranu text mp - Punkty mp i mp max
		Print_DeleteText(exp);	// Usówa z ekranu text exp - Punkty exp i exp next
	
	};
	
	//----------------------------------------------//

	if (MEM_Game.pause_screen && wlaczone==1)		// Je¿eli pauza w grze jest w³¹czona
    {
			Print_DeleteText(i);	// Usówa z ekranu text i - Dzieñ tygodnia
			Print_DeleteText(hp);	// Usówa z ekranu text hp - Punkty hp i hp max
			Print_DeleteText(mp);	// Usówa z ekranu text mp - Punkty mp i mp max
			Print_DeleteText(exp);	// Usówa z ekranu text exp - Punkty exp i exp next

    };
	
	/////////// TEST -         GUZIK K ////////////////////////////////////
	if(MEM_KeyState(KEY_K)==KEY_PRESSED ) 	// Je¿eli wciœniety klawisz K
	{	
		var oCNpc her;	her = Hlp_GetNpc(hero);
		var c_npc oth;	oth = MEM_PtrToInst(her.focus_vob);
		
		// DMG_OnDmg(oth, her, 300, dmgTotal);
		
	if(Hlp_Is_oCNpc(her.focus_Vob))
	{	
		Buff_Apply(oth, deadly_poison);	
	};
		hero.exp = hero.exp +490;
	};
	
	// ---------------------------------------------------------------------------------------------------- //
	//																										//
	//							ODŒWIE¯ANIE RUTYN NPC														//
	//																										//
	//						NPC , nazwa rutyny do odœwie¿enia												//
	//																										//
	// ---------------------------------------------------------------------------------------------------- //
	
	Npc_ExchangeRoutine (NONE_100_Xardas,"Rtn_Start_100");		// Odœwie¿a rutyne Xardasa

};

// ------------------------ ************************************************ ----------------------------------- //

func void NPCWLACZAEKWIPUNEK (var C_Npc self)
{	
	if wlaczone == 1

	{	
		
		var oCNpc her;	her = Hlp_GetNpc(hero);
		var c_npc oth;	oth = MEM_PtrToInst(her.focus_vob);
		
		
		if(Hlp_Is_oCNpc(her.focus_Vob))
		{
		
		AI_PlayAni	(oth,"S_PEE");
		
	
		PrintS_Ext(oth.name, RGBA(13, 180, 36, 1));
		};
		
		if(Hlp_Is_oCMobContainer(her.focus_vob))
		{FF_ApplyExt(open_chest,1,1);};
		
		
		wylaczylemekwipunekpodczasotwieraniaekwipunku = 1;
		wlaczone =0;
	};
};

func void NPCWYLACZAEKWIPUNEK ()
{	
	if wylaczylemekwipunekpodczasotwieraniaekwipunku ==1
	{	
		var oCNpc her;	her = Hlp_GetNpc(hero);
		var c_npc oth;	oth = MEM_PtrToInst(her.focus_vob);
		Npc_ClearAIQueue(oth);
		wylaczylemekwipunekpodczasotwieraniaekwipunku = 0;
		wlaczone =1;
	};
};

func void OKNO_STATYSTYK_OTWORZ ()			// Tutaj stworze nowe menu statystyk
{	
	Print_DeleteText(sala);	
	sala = Print_ExtPxl(424, 122, "TEST - W£¥CZONE OKNO STATYSTK", FONT_ScreenSmall, RGBA(255, 255, 255, 255), -1); 
	
		
};

func void OKNO_STATYSTYK_ZAMKNIJ ()
{	
	Print_DeleteText(sala);	
	sala = Print_ExtPxl(124, 122, "TEST - OKNO WY£¥CZONE ", FONT_ScreenSmall, RGBA(255, 255, 255, 255), 2000); 
	
		
};

func void oCNpcOnTouch ()
{	

// NARAZIE PUSTO
//if(!her.focus_Vob || !Hlp_Is_oCNpc(her.focus_Vob)) {return;}
		
};


