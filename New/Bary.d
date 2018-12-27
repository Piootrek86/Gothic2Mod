instance Bar_1(GothicBar) {

 
     x = Print_Screen[PS_X] /2;			// Wartość dla pozycji X
	 y = Print_Screen[PS_Y] - 52;		// Wartość dla pozycji Y
	x = x;
    y = y+30;
};

func void Example_1() {
    // Example_1 könnte damit zB. in Init_Global aufgerufen werden
    FF_ApplyOnce(Loop_1);
};

func void Loop_1() {
    // Example_1 bringt diese Schleife zum laufen. Hier soll die Bar einmalig konstruiert und dann an die EXP des Helden angepasst werden:
    var int MyBar;
    if(!Hlp_IsValidHandle(MyBar)) {
        MyBar = Bar_Create(Bar_1); // Unsere Bar_1
    };

    // Der Rest ist wohl selbsterklärend:
    Bar_SetMax(MyBar, hero.exp_next);
    Bar_SetValue(MyBar, hero.exp);
};