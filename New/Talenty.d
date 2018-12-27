func void Talenty_Init ()
{
	var int Inteligencja;
	var int Stamina;
	var int Stamina_Max;
	var int Ammo;
	
	Inteligencja = TAL_CreateTalent();
	Stamina = TAL_CreateTalent();
	Stamina_Max = TAL_CreateTalent();
	Ammo = TAL_CreateTalent();
	
	////// BOHATER
	TAL_SetValue(PC_Hero, Inteligencja, 1);
	TAL_SetValue(PC_Hero, Stamina, 100);
	TAL_SetValue(PC_Hero, Stamina_Max, 100);
	TAL_SetValue(PC_Hero, Ammo, 1);	
	
	////// TESTER
	TAL_SetValue(BDT_1021_LeuchtturmBandit, Ammo, 3);	
	var C_ITEM equippedbow;
	equippedbow = Npc_GetEquippedRangedWeapon(BDT_1021_LeuchtturmBandit);
	equippedbow.munition = ItRw_arrow3;   // ustawia jako amonicje zwykla strzale

};


// funkcje
// ************************************************
