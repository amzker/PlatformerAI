# Platformer AI

as name suggets you will be playing against AI 

# MAIN TODO:
- Now is the time to improve code quality [ done, atleast at my level]
 

# Latest commit: [INFO]
- updated code and made it better

# credits 

- Multiplayer: i copied whole code from here: https://github.com/BitR13x/2DGodotMultiplayer.git
- assests : GDQuest probabaly
- NEAT : https://github.com/pastra98/NEAT_for_Godot
- Music: i really don't remember, but it was free to use music.

for WAN you will need to do UDP port forwarding

# Download:
- check release part. you can download for android,windows,linux & web
- for web you need to start http server at . dir of web 

# **TODO**:
- clearup levels & train AI for that level [ done ]
- Create Gun Enemies
- Fix stupid codes such as one in AI.gd [ done ]
- let's use coins collected as fitness function and setup coins as path [ done ]
- Level Generator and auto AI trainer 
- gravity(point,reverse) [done/learned]
- randomly dropping enemies [done]
- WAN & LAN [done]
- AI vs AI (just need to do place_bodies and standalone.new()) [i will do it later, first let's make atleast 10 levels]

# DIR_TREE:
```
.
├── AI
│   ├── AIvsPlayer.gd
│   ├── AIvsPlayer.tscn
│   ├── TrainAI.gd
│   └── TrainAI.tscn
├── assets
│   ├── images
│   │   ├── 2639912_save_icon.png
│   │   ├── 2639912_save_icon.png.import
│   │   ├── aBSs4o7eAJupCvRQGcvgET-1200-80.jpg.import
│   │   ├── background.png
│   │   ├── background.png.import
│   │   ├── bumper.png
│   │   ├── bumper.png.import
│   │   ├── coin.png
│   │   ├── coin.png.import
│   │   ├── enemy.png
│   │   ├── enemy.png.import
│   │   ├── font_default.tres
│   │   ├── font_title.tres
│   │   ├── icon.png
│   │   ├── icon.png.import
│   │   ├── iStock-neurons_2500-1200x800.webp.import
│   │   ├── lava2.jpg
│   │   ├── lava2.jpg.import
│   │   ├── lava.jpg
│   │   ├── lava.jpg.import
│   │   ├── light.png
│   │   ├── light.png.import
│   │   ├── minimie.jpg
│   │   ├── minimie.jpg.import
│   │   ├── montserrat_extrabold.otf
│   │   ├── nn.jpg.import
│   │   ├── player.png
│   │   ├── player.png.import
│   │   ├── play.png
│   │   ├── play.png.import
│   │   ├── portal.png
│   │   ├── portal.png.import
│   │   ├── stonflor.jpg
│   │   ├── stonflor.jpg.import
│   │   ├── tileset.png
│   │   ├── tileset.png.import
│   │   └── tileset.tres
│   ├── music
│   │   ├── background music.tscn
│   │   ├── bgmusic2.mp3
│   │   ├── bgmusic2.mp3.import
│   │   ├── bgmusic.mp3
│   │   ├── bgmusic.mp3.import
│   │   ├── coin.wav
│   │   ├── coin.wav.import
│   │   ├── drums.wav
│   │   ├── drums.wav.import
│   │   ├── jump.wav
│   │   ├── jump.wav.import
│   │   ├── level_complete.wav
│   │   ├── level_complete.wav.import
│   │   ├── loss.wav
│   │   └── loss.wav.import
│   ├── themes
│   │   └── testtheme.tres
│   └── tiles
│       ├── invertedtile.tres
│       ├── lavatiles.tres
│       ├── maintileset.tres
│       ├── slowspeed.tres
│       └── speedtile.tres
├── default_bus_layout.tres
├── default_env.tres
├── export_presets.cfg
├── icon.png
├── icon.png.import
├── joystick
│   ├── textures
│   │   ├── joystick_base_outline.png
│   │   ├── joystick_base_outline.png.import
│   │   ├── joystick_tip_arrows.png
│   │   ├── joystick_tip_arrows.png.import
│   │   ├── joystick_tip.png
│   │   └── joystick_tip.png.import
│   ├── virtual_joystick.gd
│   └── virtual_joystick.tscn
├── LICENSE
├── NEAT_code
│   ├── agent.gd
│   ├── ga.gd
│   ├── genome.gd
│   ├── innovations.gd
│   ├── links.gd
│   ├── neuralnet.gd
│   ├── neurons.gd
│   ├── params.gd
│   ├── species.gd
│   └── utils.gd
├── NEAT_usability
│   ├── camera
│   │   ├── ZoomPanCam.gd
│   │   └── ZoomPanCam.tscn
│   ├── fonts
│   │   ├── Data
│   │   │   └── Roboto-Regular.ttf
│   │   └── dynamics
│   │       ├── Roboto-Black
│   │       └── roboto-regular.tres
│   ├── gui
│   │   ├── genome_detail
│   │   │   ├── GenomeDetail.gd
│   │   │   ├── GenomeDetail.tscn
│   │   │   └── NetworkDrawer.gd
│   │   ├── highlighter.gd
│   │   ├── NeatGUI.gd
│   │   ├── species_list
│   │   │   ├── SpeciesList.gd
│   │   │   └── SpeciesList.tscn
│   │   ├── Window.gd
│   │   └── Window.tscn
│   ├── standalone_scripts
│   │   └── standalone_neuralnet.gd
│   └── textures
│       ├── close_window.png
│       └── close_window.png.import
├── network_configs
│   ├── 16_23__40.json
│   ├── level1.json
│   ├── level1slow.json
│   ├── level2.json
│   ├── level3beta.json
│   ├── level3.json
│   ├── level3weak.json
│   ├── level5.json
│   ├── lv1_test2.json
│   ├── lv3easy.json
│   ├── lv3good.json
│   ├── lv3ok.json
│   ├── old
│   │   ├── level2old.json
│   │   └── level3.json
│   └── testing
│       ├── level1beta2.json
│       ├── level1gamma.json
│       ├── level1.json
│       ├── level1omega.json
│       ├── level3h.json
│       ├── level3y.json
│       ├── lv3crbest.json
│       ├── lv3fitness25.json
│       ├── lv3fitness30.json
│       └── lv3match.json
├── param_configs
│   ├── AI_params2.cfg
│   └── AI_params.cfg
├── project.godot
├── README.md
└── src
    ├── actors
    │   ├── actor.gd
    │   ├── AI.gd
    │   ├── AI.tscn
    │   ├── enemy.gd
    │   ├── enemyJump.gd
    │   ├── enemyJump.tscn
    │   ├── enemy.tscn
    │   ├── player.gd
    │   └── player.tscn
    ├── levels
    │   ├── basic_lv_script.gd
    │   ├── level1.tscn
    │   ├── level2.tscn
    │   ├── level3.tscn
    │   ├── level4.tscn
    │   ├── level5.tscn
    │   ├── TemplateLV.tscn
    │   ├── testlv.gd
    │   └── testlv.tscn
    ├── objects
    │   ├── Camera2D.tscn
    │   ├── coin.gd
    │   ├── coin.tscn
    │   ├── counter.gd
    │   ├── counter.tscn
    │   ├── fade_out.tres
    │   ├── falling_coin.gd
    │   ├── falling_coin.tscn
    │   ├── objectsbounce.tres
    │   ├── objectsSTART.tres
    │   ├── portal.gd
    │   └── portal.tscn
    ├── that_guy_net
    │   ├── Enemy.gd
    │   ├── Enemy.tscn
    │   ├── Player.gd
    │   ├── Player.tscn
    │   ├── project.godot
    │   ├── World.gd
    │   └── World.tscn
    ├── TRlevels
    │   ├── AI2.gd
    │   ├── AI2.tscn
    │   ├── lvpaths
    │   │   ├── lv1path.tscn
    │   │   ├── lv2path.tscn
    │   │   ├── lv3path.tscn
    │   │   └── lv5path.tscn
    │   ├── TRlevel1.tscn
    │   ├── TRlevel2.tscn
    │   ├── TRlevel3.tscn
    │   ├── TRlevel5.tscn
    │   ├── TR_Testing.gd
    │   └── TR_Testing.tscn
    └── UI
        ├── Global.gd
        ├── lvloader.gd
        ├── lvloader.tscn
        ├── Menu.gd
        ├── Menu.tscn
        ├── Network.gd
        ├── Persistent_nodes.tscn
        ├── variables.gd
        └── WELCOME.tscn

31 directories, 190 files
```
