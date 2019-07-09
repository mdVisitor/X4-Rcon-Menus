


************************************************************************************
*                                                                                  *
*        _   _       _        ___  ___      _        ___  ___          _           *   
*       | | | |     | |       |  \/  |     | |       |  \/  |         | |          *   
*       | |_| | ___ | |_   _  | .  . | ___ | |_   _  | .  . | ___   __| |___       *
*       |  _  |/ _ \| | | | | | |\/| |/ _ \| | | | | | |\/| |/ _ \ / _` / __|      *
*       | | | | (_) | | |_| | | |  | | (_) | | |_| | | |  | | (_) | (_| \__ \      *
*       \_| |_/\___/|_|\__, | \_|  |_/\___/|_|\__, | \_|  |_/\___/ \__,_|___/      *
*                       __/ |                  __/ |                               *
*                      |___/                  |___/                                *
*                                                                                  *
*                       Website: http://www.holymolymods.com                       *
************************************************************************************
* This was edited for Extreme mod but I'll explain what I did and where so it can be
  adapted to ANY mod! All credit to T3ch at Openwarfare!

* In the _ex_main.gsc I added this to init the _ex_rcon.gsc Place at the end of main()

        // Rcon Menu
        level thread extreme\_ex_rcon::init();

* The _ex_rcon.gsc was added to the extreme folder server side

* Add the _quickmessages.gsc to your maps/mp/gametypes folder server side

        game["rconmenu"] = "rconmenu";
        precacheMenu("rconmenu");

* Add the maprotation.cfg's to your config folder server side

* add the rc.str to your english/localizedstrings in mod raw files

* Add rcon.cfg to your config folder server side and execute it in the server.cfg

     wait
     exec config/rcon.cfg

* Add the rconmenu.menu to your mod raw files in ui_mp/scriptmenus

* Add wm_quickmessage.menu to your mod raw files ui_mp/

                itemDef
                {
                        name	                "window"
                        group	                ingamebox
                        visible	                1
                        rect	                16 68 0 0
                        origin	                ORIGIN_QUICKMESSAGEWINDOW
                        forecolor	        1 1 1 1
                        textfont	        UI_FONT_NORMAL
                        textstyle	        ITEM_TEXTSTYLE_SHADOWED
                        textscale	        TEXTSIZE_SMALL
                        textaligny	        8
                        text	                "4. Rcon Menu"
                        decoration
                }
                execKey "4" { close quickmessage; open rconmenu } 

* Add this to your mod.csv

menufile,ui_mp/scriptmenus/rconmenu.menu
menufile,ui_mp/wm_quickmessage.menu
localize,rc

* This is for Extreme so if using a different mod you'll have to activate the _quickmessages.gsc 
  and _rcon.gsc as well in the mod.csv depending on how you want to init it.

* I'm sure you'll figure it out but if not, here's my e-mail

  fcsparrowhawk@sasktel.net

* If any bugs or errors let me know. If you add something cool, let me know! :)
