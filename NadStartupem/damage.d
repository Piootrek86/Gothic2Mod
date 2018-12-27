class oSDamageDescriptor {
    var int validFields;         // zDWORD 0x00
    
    var int attackerVob;         // zCVob* 0x04
    var int attackerNpc;         // oCNpc* 0x08
    var int hitVob;             // zCVob* 0x0C
    var int hitPfx;                // oCVisualFX* 0x10
    var int itemWeapon;         // oCItem* 0x14
        
    var int spellID;            // zDWORD 0x18
    var int spellCat;             // zDWORD 0x1C
    var int spellLevel;            // zDWORD 0x20
    
    var int dmgMode;            // zDWORD 0x24
    var int weaponMode;            // zDWORD 0x28
    
    var int dmgArray[8];         // zDWORD[8] 0x2C Vermutlich vor Abzug der Rüstungswerte
    var int dmgTotal;            // zREAL 0x4C // Nach Abzug der Rüstungswerte?
    var int dmgMultiplier;        // zREAL 0x50
    
    var int locationHit[3];     // zVEC3 0x54
    var int directionFly[3];    // zVEC3 0x58
    
    var string visualFXStr;        // zSTRING 0x5C
    
    var int duration;            // zREAL 0x60
    var int interval;             // zREAL 0x64
    var int dmgPerInterval;        // zREAL 0x68
    var int dmgDontKill;        // zBOOL 0x6C
    
    var int bitfield; // 1 -> Once, 2 -> finished, 4 -> isDead, 8 -> isUnconscious
    
    var int azimuth;            // zREAL 0x74
    var int elevation;            // zREAL 0x78
    var int timeCurrent;        // zREAL 0x7C
    var int dmgReal;            // zREAL 0x80
    var int dmgEffective;        // zREAL 0x84
    var int dmgArrayEffective[8]; // zDWORD[8] 0x104 // Vermutlich nach Abzug der Rüstungswerte, ohne Mindestschaden
    var int vobParticleFX;        // zCVob* 0x108
    var int particleFX;            // zCParticleFX* 0x10C
    var int visualFX;            // zCVisualFX* 0x110
}; 






func int DMG_OnDmg(var int victimPtr, var int attackerPtr, var int dmg, var int dmgDescriptorPtr) {

var oSDamageDescriptor dmgDesc; dmgDesc = _^(dmgDescriptorPtr);

var c_npc slf; slf = _^(attackerptr);
var c_npc oth; oth = _^(victimPtr);	

var int defense;
var int activespell;
var int spelldmg;
var int lastspell;
var int Ammo;
var int AmmoV;
var int AmmoVO;

var string dmg2;
var string dmg3;
var string dmg4;

var string w0;
var string w;
var string w1;
var string w2;
var string w3;
var string w4;
var string w5;
var string krytyczne;

dmg2 = "Zada³eœ ";
dmg3 = " Obra¿eñ";
dmg4 = "Otrzyma³eœ ";
krytyczne = " krytycznych";

var int actveInteligencja;

var int ChanceForCrit;
ChanceForCrit = 0;
var int losowydmg;
losowydmg = wpnDmg * Hlp_Random (10);
var int szansa;
szansa = Hlp_Random (100);



////////////////////////////////////////////////////////////////////////////////////
///////////////////// *************** CZARY *************** ////////////////////////
/////// Obra¿enia s¹ zale¿ne : czar_dmg - defense + inteligencja ///////////////////

activespell = Npc_GetActiveSpell(slf);
actveInteligencja = Tal_GetValue (slf, Inteligencja);
defense = oth.protection[PROT_MAGIC];

if(Npc_GetActiveSpell(slf) == SPL_FIRESTORM)
    {	
        dmg = SPL_DAMAGE_InstantFireball+actveInteligencja-defense;
    }
	
else if(Npc_GetActiveSpell(slf) == SPL_ChargeZap )
    {	
        dmg = SPL_Damage_ChargeZap*slf.aivar[AIV_SpellLevel]+actveInteligencja-defense;
		
    }
	
else if(Npc_GetActiveSpell(slf) == SPL_ChargeFireball )
    {	
        dmg = SPL_Damage_ChargeFireball*slf.aivar[AIV_SpellLevel]+actveInteligencja-defense;

    };	

if(Npc_GetActiveSpell(slf) != -1)
    {
		
		w0 = ConcatStrings (IntToString(dmg),"");
		w=ConcatStrings (dmg2, w0);	
		w1=ConcatStrings (w, dmg3);	
		w2= ConcatStrings (dmg4, w0);	
		w3=ConcatStrings (w2, dmg3);
		
		
    if Npc_IsPlayer (slf) && dmg >= 0 
        {
			PrintS_Pow(w1, RGBA(236, 213, 64, 1)); //Zolty
        }
		
	else if Npc_IsPlayer (slf) && dmg < 0
		{	
			dmg = 0;
			w0 = ConcatStrings (IntToString(dmg),"");
			w=ConcatStrings (dmg2, w0);	
			w1=ConcatStrings (w, dmg3);	
			PrintS_Pow(w1, RGBA(236, 213, 64, 1)); //Zolty

		}
 
	else if Npc_IsPlayer (oth) && dmg >= 0
		{
			PrintS_Pow(w3, RGBA(255, 0, 0, 1)); //Czerwony
		}
 
	else if Npc_IsPlayer (oth) && dmg < 0
		{
			w0 = ConcatStrings (IntToString(dmg),"");
			w=ConcatStrings (dmg2, w0);	
			w1=ConcatStrings (w, dmg3);	
			dmg = 0;
			PrintS_Pow(w3, RGBA(255, 0, 0, 1)); //Czerwony
		};
 
	};

////////////////////////////////////////////////////////////////////////////////	
//////////			 walka na piêœci			////////////////////////////////
if(Npc_IsInFightMode(slf,FMODE_FIST)) //
{

dmg = (slf.attribute[ATR_STRENGTH] -oth.protection[PROT_BLUNT]);
w0 = ConcatStrings (IntToString(dmg),"");
w=ConcatStrings (dmg2, w0);	
w1=ConcatStrings (w, dmg3);	
w2= ConcatStrings (dmg4, w0);	
w3=ConcatStrings (w2, dmg3);

 
 if Npc_IsPlayer (slf) && dmg >= 0
 {
	PrintS_Pow(w1, RGBA(236, 213, 64, 1)); //Zolty
 };
 
  if Npc_IsPlayer (slf) && dmg < 0
 {	dmg = 0;
	PrintS_Pow(w1, RGBA(236, 213, 64, 1)); //Zolty
 };
 
 
 if Npc_IsPlayer (oth)	&& dmg >= 0
 {
	PrintS_Pow(w3, RGBA(255, 0, 0, 1)); //Czerwony
 };
 
 if Npc_IsPlayer (oth) && dmg < 0
 {
	dmg = 0;
	PrintS_Pow(w3, RGBA(255, 0, 0, 1)); //Czerwony
 };
 
}; 

if (Npc_HasReadiedWeapon(slf))
{
	var c_item wpn; wpn = Npc_GetReadiedWeapon(slf);
	var int wpnDmg; wpnDmg = wpn.damageTotal;
    var int armRes; 

	if wpn.damagetype == DAM_EDGE	{ armRes = oth.protection[PROT_EDGE]; } ;
	if wpn.damagetype == DAM_BLUNT 	{ armRes = oth.protection[PROT_BLUNT]; };
	if wpn.damagetype == DAM_POINT 	{ armRes = oth.protection[PROT_POINT]; };
	if wpn.damagetype == DAM_FIRE 	{ armRes = oth.protection[PROT_FIRE]; };
	if wpn.damagetype == DAM_MAGIC 	{ armRes = oth.protection[PROT_MAGIC]; };


if ((ITEM_2HD_AXE || ITEM_2HD_SWD || ITEM_AXE ||ITEM_SWD) & wpn.flags)	// Je¿eli broñ ITEM_2HD_AXE || ITEM_2HD_SWD || ITEM_AXE ||ITEM_SWD
{

dmg = (wpnDmg+ slf.attribute[ATR_STRENGTH]);							// damage = obra¿enia broni + si³a
}

if ((ITEM_BOW || ITEM_CROSSBOW) & wpn.flags)							// Je¿eli broñ £uk lub kusza
{

dmg = (wpnDmg+ slf.attribute[ATR_DEXTERITY]);							// damage = obra¿enia broni + zrêcznoœæ

};


if (ITEM_2HD_AXE & wpn.flags)											// Je¿eli broñ dwurêczna AXE
{ 
ChanceForCrit = slf.HitChance[NPC_TALENT_2H];							// Szansa na obra¿enia krytyczne = Umiejêtnoœæ walki broni¹ dwurêczn¹
};

if (ITEM_2HD_SWD & wpn.flags)
{ 
ChanceForCrit = slf.HitChance[NPC_TALENT_2H];
};

if (ITEM_SWD & wpn.flags)
{ 
ChanceForCrit = slf.HitChance[NPC_TALENT_1H];
};

if (ITEM_AXE & wpn.flags)
{ 
ChanceForCrit = slf.HitChance[NPC_TALENT_1H];
};


if (ITEM_BOW & wpn.flags)
{ 	
TAL_SetValue(BDT_1021_LeuchtturmBandit, Ammo, 3);	
AmmoV = TAL_GetValue(slf, Ammo);
AmmoVO = TAL_GetValue(oth, Ammo);
ChanceForCrit = slf.HitChance[NPC_TALENT_BOW];
};

if (ITEM_CROSSBOW & wpn.flags)
{ 
ChanceForCrit = slf.HitChance[NPC_TALENT_CROSSBOW];
};

////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////// OBRA¯ENIA KRYTYCZNE	////////////////////////////////////
if(szansa <= chanceForCrit) 
	{	

		dmg = (dmg-armRes) * 2 + losowydmg;
		w0 = ConcatStrings (IntToString(dmg),"");
		w=ConcatStrings (dmg2, w0);	
		w1=ConcatStrings (w, dmg3);	
		w2= ConcatStrings (dmg4, w0);	
		w3=ConcatStrings (w2, dmg3);
		w4=ConcatStrings (w1, krytyczne);
		w5=ConcatStrings (w3, krytyczne);


	if Npc_IsPlayer (slf) && dmg >= 0
	{	


		if AmmoV == 2	// Zatruta
		{
			if Hlp_Random (99) <=25
			{
				Buff_Apply(oth, deadly_poison);
			};
		};
		
		if AmmoV == 3	// Podpalona
		{	
			Buff_Apply(oth, ognista_strzala);	
		};
		
		if AmmoV == 4	// Podpalona
		{
			Buff_ApplyOrRefresh(oth, magiczna_strzala);	
		};

		PrintS_Pow(w4, RGBA(252, 76, 7,1)); //Pomarañczowy
		
	};
 
	if Npc_IsPlayer (slf) && dmg < 0
	{	
		dmg =0;
		PrintS_Pow(w4, RGBA(252, 76, 7,1)); //Pomarañczowy
	};
 
 
	if Npc_IsPlayer (oth)	&& dmg >= 0 
	{	
		if AmmoV == 2	// Zatruta
			{	
			if Hlp_Random (99) <=25
				{
					Buff_ApplyOrRefresh(oth, deadly_poison);		// Nak³ada zatrucie
				};
			};
		
		if AmmoV == 3	// Podpalona
			{
				Buff_ApplyOrRefresh(oth, ognista_strzala);	
			};
			
		if AmmoV == 4	// Podpalona
			{
				Buff_ApplyOrRefresh(oth, magiczna_strzala);	
			};
			
			PrintS_Pow(w5, RGBA(225, 19, 166, 1)); //Ró¿owy
	};
 
	if Npc_IsPlayer (oth) && dmg < 0
	{
		dmg =0;
		PrintS_Pow(w5, RGBA(225, 19, 166, 1)); //Ró¿owy
	};
 	
};

/////////////////////////////////////////////////////////////////////////
////////////////////// TUTAJ S¥ OBLICZANE OBRA¯ENIA NIE KRYTYCZNE	/////
if(szansa > chanceForCrit)
{		
	var int los;
    los = r_MinMax(-30,30);
	dmg = (dmg-armRes)+los;

	w0 = ConcatStrings (IntToString(dmg),"");
	w=ConcatStrings (dmg2, w0);	
	w1=ConcatStrings (w, dmg3);	
	w2= ConcatStrings (dmg4, w0);	
	w3=ConcatStrings (w2, dmg3);


	if Npc_IsPlayer (slf) && dmg >= 0
	{	

		if AmmoV == 2	// Zatruta
		{	
			if Hlp_Random (99) <=25
			{
				Buff_ApplyOrRefresh(oth, deadly_poison);		// Nak³ada zatrucie
			};
		};
		
		if AmmoV == 3	// Podpalona
		{	
			Buff_ApplyOrRefresh(oth, ognista_strzala);	
		};
		
		if AmmoV == 4	// Podpalona
		{
			Buff_ApplyOrRefresh(oth, magiczna_strzala);	
		};

		PrintS_Pow(w1, RGBA(236, 213, 64, 1)); //Zolty
		
	};
 
	if Npc_IsPlayer (slf) && dmg < 0
	{
		dmg = 0;
		w0 = ConcatStrings (IntToString(dmg),"");
		w=ConcatStrings (dmg2, w0);	
		w1=ConcatStrings (w, dmg3);	
		PrintS_Pow(w1, RGBA(236, 213, 64, 1)); //Zolty
	
	};
	
	
	if Npc_IsPlayer (oth)	&& dmg >= 0 							// KOMPUTER - SLF,  GRACZ - OTH
	{	
		
		if AmmoV == 2	// Zatruta
		{	
			if Hlp_Random (99) <=25
			{
				Buff_ApplyOrRefresh(oth, deadly_poison);		// Nak³ada zatrucie
			};
		};
		
		if AmmoV == 3	// Podpalona
		{	
			Buff_ApplyOrRefresh(oth, ognista_strzala);	
		};
		
		if AmmoV == 4	// Podpalona
		{
			Buff_ApplyOrRefresh(oth, magiczna_strzala);	
		};
		
		PrintS_Pow(w3, RGBA(255, 0, 0, 1)); //Czerwony

	};
 
	if Npc_IsPlayer (oth) && dmg < 0
	{
		dmg = 0;
		w0 = ConcatStrings (IntToString(dmg),"");
		w2= ConcatStrings (dmg4, w0);	
		w3=ConcatStrings (w2, dmg3);

		PrintS_Pow(w3, RGBA(255, 0, 0, 1)); //Czerwony
	};
};
};
	return dmg;
};














var int _DMG_DmgDesc;

func void _DMG_OnDmg_Post() {
    EDI = DMG_OnDmg(EBP, MEM_ReadInt(MEM_ReadInt(ESP+644)+8), EDI, _DMG_DmgDesc);
};

func void _DMG_OnDmg_Pre() {
    _DMG_DmgDesc = ESI; // I'm preeeeetty sure it won't get moved in the meantime...
};

func void InitDamage() {
    const int dmg = 0;
    if (dmg) { return; };
    HookEngineF(6736583/*0x66CAC7*/, 5, _DMG_OnDmg_Post);
    const int oCNpc__OnDamage_Hit = 6710800;
    HookEngineF(oCNpc__OnDamage_Hit, 7, _DMG_OnDmg_Pre);
    dmg = 1;
}; 


