func int GetModel(var int npc)
{
    CALL__thiscall(MEM_InstToPtr(npc), 7571232);
    return CALL_RetValAsInt();
};


 
func int AniIsActive(var c_npc slf, var string aniname)
{
    var int ptr; ptr = GetModel(slf);
    const int zCModel_AniIsActive     =     5727888;    //0x00576690


    CALL_zStringPtrParam(Str_Upper(aniname));
    CALL__thiscall(ptr, zCModel_AniIsActive);
    return CALL_RetValAsInt();    
};


func int MEM_KeyHold(var int key1, var int key2)
{
    if((MEM_KeyState(key1) == KEY_HOLD && key1)
    || (MEM_KeyState(key2) == KEY_HOLD && key2))
    {
        return true;
    };
    return false;
};


func oCItem Hlp_GetItem(var int ID)
{
    var zCPar_Symbol symb; symb = _^ (MEM_GetSymbolByIndex (ID));
    MEM_PtrToInst (symb.offset);
};


func int oCNpc_GetSlotItem(var c_npc slf, var string slot)
{
    CALL_zStringPtrParam(STR_Upper(slot));
    CALL__thiscall(_@(slf), 7544720);
    return CALL_RetValAsPtr();
};


func void Equip_FarWeapon (var C_NPC slf, var int ItemInst) {


    if (!Npc_HasItems (slf, ItemInst)) {
        CreateInvItems (slf, ItemInst, 1);
    };


    if (!Npc_GetInvItem(slf, ItemInst)) {
        MEM_AssertFail("Unexpected behaviour in EquipWeapon.");
        return;
    };


    if ((item.mainflag == ITEM_KAT_NF) && (Npc_HasReadiedMeleeWeapon(slf)))
    || ((item.mainflag == ITEM_KAT_FF) && (Npc_HasReadiedRangedWeapon(slf))) {
        MEM_Warn ("EquipWeapon: Caller wants to equip a weapon while weapon of the same type is readied. Ignoring request.");
        return;
    };


    if (item.flags & ITEM_ACTIVE)
    && (!EquipWeapon_TogglesEquip) {
        /* calling EquipWeapon would unequip the weapon. */
        MEM_Info ("EquipWeapon: This weapon is already equipped. Ignoring request.");
        return;
    };


    const int oCNpc__EquipFarWeapon = 7578384; //  0x0073A310
    CALL_PtrParam(_@(item));
    CALL__thiscall(_@(slf), oCNpc__EquipFarWeapon);
};




func void oCNpc_UseItem(var c_npc slf, var int ItemInst) 
{
    if (!Npc_HasItems (slf, ItemInst)) {
        CreateInvItems (slf, ItemInst, 1);
    };
    
    if (!Npc_GetInvItem(slf, ItemInst)) {
     return;
    };
    
    CALL_PtrParam(_@(item));
    CALL__thiscall(_@(slf), oCNpc__UseItem); 
};