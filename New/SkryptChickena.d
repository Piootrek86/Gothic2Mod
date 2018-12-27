func void open_chest()
{ 
    var oCNpc her; her = Hlp_GetNpc(hero);
    var oCMobLockable chest; chest = Mem_PtrToInst(her.focus_vob);
    
    if !Hlp_Is_oCMobLockable(her.focus_vob) { return; };
    if !her.focus_vob { return; };
    
    if (Hlp_Is_oCMobLockable(her.focus_vob) & oCMobLockable_bitfield_locked)
     {
          Print ("to mob lackable!"); 
		  Print_TextFieldColored(20,20,"Testuje nowy text",FONT_ScreenSmall,20,-1);
		 
   chest.bitfield = oCMobLockable_bitfield_autoOpen;
   } 
          else 
         {
Print ("to nie mob lockable!");   

      };
};



