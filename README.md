# Platformer AI

as name suggets you will be playing against AI 


# Latest commit: [INFO]
- Multiplayer added. i copied whole code from here: https://github.com/BitR13x/2DGodotMultiplayer.git
- for portforwarding pagekite or ngrock both will be ok if your router dosent support it 

# How to play on WAN. if your router dosent support portforwarding
1. go to https://pagekite.net/
2. create your account and after verifying go to cmd/terminal
type:

```
curl -O https://pagekite.net/pk/pagekite.py
python2.7 pagekite.py YourLocalipAddress:PORT(WHICH YOU ENTER IN PORT BOX, USE 20201 SOMTHING) yourKitename:8080
```
example:
```
python2.7 pagekite.py 192.168.0.3:20201 my2dgametest.pagekite.me:8080
```
**host/person with pagekite account :** go to game multiplayer page and put local port in port field ie: 20201  and click on create server.

-**client/your friend:** go to multiplayer page and enter host kitename and in port hostkiteport ex: 
in ip i will put:
```
my2dgametest.pagekite.me
and in port
8080

```
- hit the join button 

# Warning:
- Do not use git version, check releases and it's src.

# Download:

- check release part. you can download for android,windows,linux & web
- for web you need to start http server at . dir of web 

# **TODO**:
- clearup levels & train AI for that level [ done ]
- Create Gun Enemies
- Fix stupid codes such as one in AI.gd [ done ]
- let's use coins collected as fitness function and setup coins as path [ done ]
- Level Generator and auto AI trainer 
- gravity(point,reverse) 
- randomly dropping enemies 
- WAN & LAN 
- AI vs AI (just need to do place_bodies and standalone.new())
