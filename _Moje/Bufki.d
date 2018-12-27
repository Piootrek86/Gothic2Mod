func void deadly_poison_damage(var int bh) {
    var int ptr; ptr = Buff_GetNpc(bh);
    if (!ptr) { return; }; // Kann passieren, falls z.B. die Welt gewechselt wurde

    var c_npc n; n = _^(ptr);
	
	if (n.attribute[ATR_HITPOINTS] >0)
		{
			Npc_ChangeAttribute(n, ATR_HITPOINTS, -3); // 3 Schaden
			Wld_PlayEffect("spellFX_SWARM",n,n,1,1,1,FALSE); 
		};
};

func void deadly_poison_damage_remove(var int bh) {
    var int ptr; ptr = Buff_GetNpc(bh);
    if (!ptr) { return; }; // Kann passieren, falls z.B. die Welt gewechselt wurde

    var c_npc n; n = _^(ptr);
    Npc_ChangeAttribute(n, ATR_HITPOINTS, -3); // 3 Schaden
	if (n.attribute[ATR_HITPOINTS] <=0)
		{
			B_GivePlayerXP(n.level*10);
		};
};

func void deadly_poison_damage_apply(var int bh) {
    var int ptr; ptr = Buff_GetNpc(bh);
    if (!ptr) { return; }; // Kann passieren, falls z.B. die Welt gewechselt wurde
    var c_npc n; n = _^(ptr);
    Npc_ChangeAttribute(n, ATR_HITPOINTS, -3); // 3 Schaden
	Wld_PlayEffect("spellFX_SWARM",n,n,1,1,1,FALSE);    
};


instance deadly_poison(lCBuff) 
{
    name = "Zatruta Strzała";
    bufftype = BUFF_BAD;
    durationMS = 10*1000; 									//10 Sekunden lang
    tickMS = 1000; 											// Jede Sekunde
	OnApply = SAVE_GetFuncID(deadly_poison_damage_apply);
	OnRemoved = SAVE_GetFuncID(deadly_poison_damage_remove);
		
    onTick = SAVE_GetFuncID(deadly_poison_damage); 			// Every second, after 1 second, the damage should be applied
		
    buffTex = "POISON.TGA";
};

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////		 Podpalenie  					//////////////////////////////////

func void ognista_strzala_damage(var int bh) {
    var int ptr; ptr = Buff_GetNpc(bh);
    if (!ptr) { return; }; // Kann passieren, falls z.B. die Welt gewechselt wurde

    var c_npc n; n = _^(ptr);
	
	if (n.attribute[ATR_HITPOINTS] >0)
	{
		Npc_ChangeAttribute(n, ATR_HITPOINTS, -3); // 3 Schaden
		Wld_PlayEffect("spellFX_FIRESPELL_HUMANSMOKE",n,n,1,1,1,FALSE);   
	};
};

func void ognista_strzala_damage_remove(var int bh) {
    var int ptr; ptr = Buff_GetNpc(bh);
    if (!ptr) { return; }; // Kann passieren, falls z.B. die Welt gewechselt wurde

    var c_npc n; n = _^(ptr);
    Npc_ChangeAttribute(n, ATR_HITPOINTS, -3); // 3 Schaden
	if (n.attribute[ATR_HITPOINTS] <=0)
		{
			B_GivePlayerXP(n.level*10);
		};
};

func void ognista_strzala_damage_apply(var int bh) {
    var int ptr; ptr = Buff_GetNpc(bh);
    if (!ptr) { return; }; // Kann passieren, falls z.B. die Welt gewechselt wurde
    var c_npc n; n = _^(ptr);
    Npc_ChangeAttribute(n, ATR_HITPOINTS, -3); // 3 Schaden
	
	//Wld_PlayEffect("spellFX_FIRESPELL_HUMANSMOKE",n,n,1,1,1,FALSE);    
};


instance ognista_strzala(lCBuff) {
        name = "Ognista Strzała";
        bufftype = BUFF_GOOD;
        durationMS = 10*1000; //10 Sekunden lang
        tickMS = 1000; // Jede Sekunde
		OnApply = SAVE_GetFuncID(ognista_strzala_damage_apply);
		OnRemoved = SAVE_GetFuncID(ognista_strzala_damage_remove);
		
        onTick = SAVE_GetFuncID(ognista_strzala_damage); // Every second, after 1 second, the damage should be applied
		
        buffTex = "ramka.tga";
};


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////		Magiczna strzala 				//////////////////////////////////

func void magiczna_strzala_damage(var int bh) {
    var int ptr; ptr = Buff_GetNpc(bh);
    if (!ptr) { return; }; // Kann passieren, falls z.B. die Welt gewechselt wurde

    var c_npc n; n = _^(ptr);
	
	if (n.attribute[ATR_HITPOINTS] >0)
	{
		Npc_ChangeAttribute(n, ATR_HITPOINTS, -3); // 3 Schaden
		Wld_PlayEffect("spellFX_Sleep_TARGET",n,n,1,1,1,FALSE);   
	};
};

func void magiczna_strzala_damage_remove(var int bh) {
    var int ptr; ptr = Buff_GetNpc(bh);
    if (!ptr) { return; }; // Kann passieren, falls z.B. die Welt gewechselt wurde

    var c_npc n; n = _^(ptr);
    Npc_ChangeAttribute(n, ATR_HITPOINTS, -3); // 3 Schaden
	if (n.attribute[ATR_HITPOINTS] <=0)
		{
			B_GivePlayerXP(n.level*10);
		};
};

func void magiczna_strzala_damage_apply(var int bh) {
    var int ptr; ptr = Buff_GetNpc(bh);
    if (!ptr) { return; }; // Kann passieren, falls z.B. die Welt gewechselt wurde
    var c_npc n; n = _^(ptr);
    Npc_ChangeAttribute(n, ATR_HITPOINTS, -3); // 3 Schaden
	
	Wld_PlayEffect("spellFX_Sleep_TARGET",n,n,1,1,1,FALSE);    
};


instance magiczna_strzala(lCBuff) {
        name = "Magiczna Strzała";
        bufftype = BUFF_GOOD;
        durationMS = 1*1000; //10 Sekunden lang
        tickMS = 1000; // Jede Sekunde
		OnApply = SAVE_GetFuncID(magiczna_strzala_damage_apply);
		OnRemoved = SAVE_GetFuncID(magiczna_strzala_damage_remove);
		
        onTick = SAVE_GetFuncID(magiczna_strzala_damage); // Every second, after 1 second, the damage should be applied
		
        buffTex = "ramka.tga";
};