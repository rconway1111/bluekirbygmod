/*   _                                
    ( )                               
   _| |   __   _ __   ___ ___     _ _ 
 /'_` | /'__`\( '__)/' _ ` _ `\ /'_` )
( (_| |(  ___/| |   | ( ) ( ) |( (_| |
`\__,_)`\____)(_)   (_) (_) (_)`\__,_) 

	DImage

*/

PANEL = {}

/*---------------------------------------------------------

---------------------------------------------------------*/
function PANEL:Init()


end

/*---------------------------------------------------------

---------------------------------------------------------*/
function PANEL:Paint()

	derma.SkinHook( "Paint", "Bevel", self )
	return true
	
end



derma.DefineControl( "DBevel", "", PANEL, "DPanel" )