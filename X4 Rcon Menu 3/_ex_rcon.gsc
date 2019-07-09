//**********************************************************************************
//                                                                                  
//        _   _       _        ___  ___      _        ___  ___          _             
//       | | | |     | |       |  \/  |     | |       |  \/  |         | |            
//       | |_| | ___ | |_   _  | .  . | ___ | |_   _  | .  . | ___   __| |___       
//       |  _  |/ _ \| | | | | | |\/| |/ _ \| | | | | | |\/| |/ _ \ / _` / __|      
//       | | | | (_) | | |_| | | |  | | (_) | | |_| | | |  | | (_) | (_| \__ \      
//       \_| |_/\___/|_|\__, | \_|  |_/\___/|_|\__, | \_|  |_/\___/ \__,_|___/      
//                       __/ |                  __/ |                               
//                      |___/                  |___/                                
//                                                                                  
//                       Website: http://www.holymolymods.com                       
//*********************************************************************************

#include extreme\_ex_utils;

init()
{
                level.ex_rcon_enable = [[level.ex_dvardef]]("ex_rcon_enable", 0, 0, 1, "int");

	     // If Rcon is disabled then there's nothing else to do here
	        if ( level.ex_rcon_enable == 0 )
		return;

	        if ( level.ex_rcon_enable == 1 ) {
		// Initialize the mod information and the title for the screen
		level.ex_rcon_title = [[level.ex_dvardef]]( "ex_rcon_title", getDvar( "sv_hostname" ), "", "", "string");
		
		// Load the messages to display
		totalLinesRcon = 22;
		level.ex_sv_map = [];
		level.ex_map_name = [];
		for ( iLine = 1; iLine <= totalLinesRcon; iLine++ ) {
			level.ex_sv_map[ iLine - 1 ] = [[level.ex_dvardef]]( "ex_sv_map_" + iLine, "", "", "", "string");
	                level.ex_map_name[ iLine - 1 ] = [[level.ex_dvardef]]( "ex_map_name_" + iLine, "", "", "", "string");
		}
	
		level thread monitorRconMenu();   
		level thread onPlayerConnect( totalLinesRcon );

	}
}

monitorRconMenu()
{
   while (1)
   {
      wait 2;

      map = getDvar( "ui_map" );
      if ( map != "" )
      {
         setDvar( "ui_map", "" );
         setDvar( "mapname", getDvar( "ex_sv_map_" + map ) );

         curRot = getDvar( "sv_maprotationcurrent" );
         newRot = " gametype " + getDvar( "g_gametype" ) + " map " + getDvar( "mapname" ) + curRot;
         setDvar( "sv_maprotationcurrent", newRot );

         // close all menus so they will see the "changeing map" message :)
         players = level.players;
         for (i = 0; i < players.size; i++)
            if ( isDefined( players[i] ) ) // fixed the error here :)
            {
               players[i] closeMenu();
               players[i] closeInGameMenu();
            }

         iprintlnbold( "^3An Admin is Changing the Map" );
         wait 3;

         exitLevel( false );
         return;
      }
   }
}
onPlayerConnect( totalLinesRcon )
{
	for(;;)
	{
		level waittill("connecting", player);

		player thread setServerInformation( totalLinesRcon );
	}
}

setServerInformation( totalLinesRcon )
{
	self endon("disconnect");


		// Set the title of the rcon screen
		self setClientDvar( "ui_rcon_title", level.ex_rcon_title );
	
		// Set the information lines into the ui_rcon_line_N variables
		for ( iLine = 0; iLine < totalLinesRcon; iLine++ ) {
			
			self setClientDvar( "ui_map_name_" + iLine, level.ex_map_name[ iLine ] );
		}
	
}
