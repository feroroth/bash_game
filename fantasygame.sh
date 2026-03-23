#!/bin/bash
clear

# Loading menu
for i in 1 2; do
    echo "
           #  #    ###    ###    #     ####  #   #   
        ########  ##     #   #  ##    #     #   #  
         #  #    #      # ##   # #   ####  ##### 
      ########         #   #  ####     #  #   #  
       #  #    #      ###    #   # ####  #   #  

                     ######  #      #  #     ###### 
                    #       ##     ## ##    #     
                   #  ##   # #    # ## #   #### 
                  #    #  ####   #  #  #  #     
                 ######  #   #  #      # ###### 

    loading . 
    "
    sleep 1
    clear
    echo "
           #  #    ###    ###    #     ####  #   #   
        ########  ##     #   #  ##    #     #   #  
         #  #    #      # ##   # #   ####  ##### 
      ########         #   #  ####     #  #   #  
       #  #    #      ###    #   # ####  #   #  

                     ######  #      #  #     ###### 
                    #       ##     ## ##    #     
                   #  ##   # #    # ## #   #### 
                  #    #  ####   #  #  #  #     
                 ######  #   #  #      # ###### 

    loading .. 
    "
    sleep 1
    clear
    echo "
           #  #    ###    ###    #     ####  #   #   
        ########  ##     #   #  ##    #     #   #  
         #  #    #      # ##   # #   ####  ##### 
      ########         #   #  ####     #  #   #  
       #  #    #      ###    #   # ####  #   #  

                     ######  #      #  #     ###### 
                    #       ##     ## ##    #     
                   #  ##   # #    # ## #   #### 
                  #    #  ####   #  #  #  #     
                 ######  #   #  #      # ###### 

    loading ... 
    "
    sleep 1
    clear
done

# while loop for choosing class
# runs until player choose class

echo "Choose your class:

1 - knight
                   │                  
                  ─╯                  
            ╭───╮  │                  
            │───│  │                  
            │ │ │  │                  
          ╭─╰───╯╮ │                  
    ╭───────╮    │ │                  
    │       │    │╭┼╮                 
    │       │    │╰┼╯                 
    │       │    │ │                  
    │       │    │ │                  
    │       │╮╭─╮╯ │                  
    │       │││ │  │                  
    │       │││ │  │                  
    │       │╮╭─╮  │                  
    │       │││ │  │                  
    │       │││ │  │                  
    ╰───────╯╯╰─╯  │ 
    "
sleep 3

echo "
    2 - mage
                       |
        <<\          | /_/              
         ||\         \#/              
         ||||        ##               
     <<<<<< >>>>>>   #                
        ##  \        |                
     ___ ## #___     |                
    /\#   ###  /\    |                
    | \#  ### /# \___|                
    | |\#  # /#    |_#                
    | | \#  /# |\  | |                
    |_|  \#/#  | \_| |                
      | \      |     |                
      |  \___/ |     |                
      |  \__ | |     |                
      | |    | |     |                
      |_|__|_|_|     |
    "
sleep 3

echo "
    3 - archer

                \                       
          __    |\                      
         /__\   | \                     
         /# |   |  \                    
       ___ #___ |   \                   
      /\      /\|   |                   
     /  \____/\ \__ |___\               
    / /\      /\___ #   /               
    \ \ \____/  |   |                   
     \| / |\ \  |   |                   
       |__||__\ |   /                   
       | | \  \ |  /                    
       \ /  \  \| /                     
       ||   | ||/                      
       \/   | |/                       
       /\   |___\  
"
sleep 3

echo "
For info about class stats type: info1, info2, info3
"
while true; do
    read class

    # classes
    case $class in
        1)
            type="knight"
            hp=30
            max_hp=30
            magicattack=1
            attack=29
            speed=10
            max_speed=10
            break
            ;;
        2)
            type="mage"
            hp=20
            max_hp=20
            attack=10
            magicattack=30
            speed=20
            max_speed=20
            break
            ;;
        3)
            type="archer"
            hp=25
            max_hp=25
            magicattack=1
            attack=19
            speed=30
            max_speed=30
            break
            ;;  
        info1)
            echo "
            info knight:
            hp = 30
            attack = 30
            speed = 10"
            ;;    
        info2)
            echo "
            info mage:
            hp = 20
            attack = 10
            magicattack = 30
            speed = 20"
            ;;    
        info3)
            echo "
            info archer:
            hp = 25
            attack = 20
            speed = 30"
            ;;   
        *)
            echo "Invalid choice!"
            ;;
    esac
done

# Archer move function
# Archer only shoots once before each battle
archermove() {
    if [[ $class == 3 ]]; then
        damage=$(( RANDOM % (attack / 2) + 1 ))
        hpm=$(( hpm - damage ))
        echo "You shooted arrow"
        echo "$name hp: $hpm"
    fi
}

# For checking players speed
speedcheck() {
    if [[ $speed -lt 1 ]]; then
        echo ""
        echo "=== YOU DIED ==="
        dead=1
        sleep 5
        clear
        return 1
    fi
    return 0
}

dead=0

fight() {

    playerdamage=0
    # Beggining of attack
    echo "=== $name attacks! ==="
    echo ""
    echo "$name - hp = $hpm"
    echo "your $type - hp = $hp"
    echo ""
    sleep 7
    clear

    # calling archers move
    archermove 

    # While loop for fight until someone dies
    while [[ $hp -gt 0 && $hpm -gt 0 ]]; do   
        
	    echo "$name is attacking, do you want to block? (y/n)"
	    read block

        # if speeds drops on less than half, affect block
        if [[ $speed -le $((max_speed / 2)) ]]; then
            speedfall=1
        else
            speedfall=0
        fi

        # part for blocking
		if [[ $block == y ]]; then
		succed=$(( $RANDOM % (2 + speedfall)))

            # checks if your block succed
		    if [[ $succed == 1 ]]; then
				echo "Your block succeed, you are a bit slower"
                speed=$(( speed - 1 ))

                # Checks speed
                speedcheck || break

            # if block did not succed
            else 
			    echo "Your block didn't succed"
		        damage=$(( RANDOM % attackm + 1 ))
		        echo "You took $damage damage."
                hp=$(( hp - damage ))
		    fi

        # if player did not choose to block
        else
            damage=$(( RANDOM % attackm + 1 ))
            echo "You took $damage damage."
            hp=$(( hp - damage ))
	    fi

        echo "Your hp: $hp"

        # Check if players hp is higher than 0
        if [[ $hp -le 0 ]]; then
            echo ""
            echo "=== YOU DIED ==="
            dead=1
            sleep 5
            clear
            break
        fi
            
        echo ""
        echo "=== Your move ==="
        echo ""
        echo "1 - strong attack - more damage, but also slows you"
        echo "2 - small attack - less damage"

        # for mage heal
        if [[ $class == 2 ]]; then
            echo "3 - heal 5 hp"
        fi

        echo ""

        read attackchoice

        # For strong attack
        if [[ $attackchoice == 1 ]]; then
            playerdamage=$(( RANDOM % (attack + magicattack) + attack / 2 ))
            echo "You strike hard for $playerdamage damage!"
            speed=$(( speed - 1 ))

            # Checks speed
            speedcheck || break

        #Small attack
        elif [[ $attackchoice == 2 ]]; then
            playerdamage=$(( RANDOM % (magicattack + (attack / 2)) + 1 ))
            echo "You strike for $playerdamage damage!"

        # mage selfheal
        elif [[ $attackchoice == 3 && $class == 2 ]]; then
            hp=$(( hp + 5 ))
            # Fix for infinite hp
            if [[ $hp -gt $max_hp ]]; then
                hp=$max_hp
            fi
            echo "You healed, your hp: $hp"
            playerdamage=0
        # pre neplatný výber
        else
            echo "miss"
        fi

        # sets enemy hp
        hpm=$(( hpm - playerdamage ))

        # checks if enemy is dead
        if [[ $hpm -le 0 ]]; then
            echo ""
            echo "You defeated the $name! Victory!"
            sleep 5
            clear
        else
            echo "$name hp: $hpm"
        fi

    done
}

# function for restoring hp and speed
restore() {
    echo "Your hp and speed is restored"
    hp=$max_hp
    speed=$max_speed
    echo ""
    echo "Your hp: $hp"
    echo "Your speed: $speed"
    sleep 5
    clear
}

# first if checks what classes player choosed
if [[ $class == 1 || $class == 2 || $class == 3 ]]; then
    echo "You have chosen $type class, do you want to continue? (y/n)"
    read yorn

    # if player pressed y
    if [[ $yorn == y ]]; then
        echo "Starting game..."

        sleep 2

        echo "
            Welcome to land where dragons still fly and orcs still 
        fight, you are the only one who can free this land from 
        bad wich king which rule this land and is located in 
        the deepest dungeons where you will be fighting creatures 
        every man is scared to think of."

        sleep 5

        echo "
        Quick rules:
            You will fight monsters, before every fight you will 
        see their hp and attack strength, you can block attack 
        which will slower you a bit and you have 50% chance 
        of not getting hit.During your turn you have only 2 
        moves, strong attack and weak attack, strong attack 
        will make you slower, archer and mage can stike right 
        after beast came.
        "

        sleep 5

        echo "Are you ready? (y/n)"

        read ready

        sleep 5
        clear

        echo "First dungeon forest..."
        echo ""
        echo "             
              \   __    ()  
            \ /__/   /\     
            //      /  \    
           ||       /  \ 
            \\ / \  /    \
             /   \ 

        checkpoint    
        "
        sleep 5
        clear


        # while loop for dungeon
        # if you die you have to repeat dungeon
        while true; do
            # for loop for dungeon
            for round in 1 2 3; do

                # random choosing enemies from case
                enemy=$(( RANDOM % 3 ))

                case $enemy in
                    0)
                        name="Skeleton"
                        hpm=20
                        attackm=5
                        ;;
                    1)
                        name="Goblin"
                        hpm=15
                        attackm=5
                        ;;
                    2)
                        name="Troll"
                        hpm=30
                        attackm=5
                        ;;
                esac

                # Checks if player is ready
                if [[ $ready == "y" ]]; then
            
                    # Calling a fight function
                    fight 

                    # ending for cycle if you die
                    if [[ $dead -eq 1 ]]; then
                        break
                    fi

                # if player pressed anything else than y    
                elif [[ $ready != "y" ]]; then 
                    echo "Goodbye!"
                    exit 0         
                fi
            done

            # Cending while true loop if you are alive
            if [[ $dead -eq 0 ]]; then
                break
            fi

            echo "You died! Respawning at checkpoint..."
            dead=0
            restore

            # end of while loop
        done

        # Restoring hp to max_hp a speed to max_speed
        restore

        echo "Second dungeon cave..."
        echo ""
        echo "
             /__________   
         _| /_/ _____   \ /\ 
          \|/_ /######\   /\  
          //  (#######)  /  \  
         ||    \#####/   /  \   
           \\    /   \   /    \  

        checkpoint
        "
   
        sleep 5
        clear

        while true; do
            # Second dungeon
            for round in 1 2 3 4; do

                # random choosing enemies from case
                enemy=$(( RANDOM % 5 ))

                case $enemy in
                    0)
                        name="Skeleton"
                        hpm=20
                        attackm=5
                        ;;
                    1)
                        name="Goblin"
                        hpm=15
                        attackm=5
                        ;;
                    2)
                        name="Troll"
                        hpm=30
                        attackm=5
                        ;;
                    3)
                        name="Cave Troll"
                        hpm=35
                        attackm=10
                        ;;
                    4)
                        name="Spider"
                        hpm=20
                        attackm=10
                        ;;
                esac
            
                # Calling a fight function
                fight

                # ending for cycle if you die
                if [[ $dead -eq 1 ]]; then
                    break
                fi

                # end of for cycle
            done

            # Ending while loop if you are alive
            if [[ $dead -eq 0 ]]; then
                break
            fi

            echo "You died! Respawning at checkpoint..."
            dead=0
            restore
            # end of while loop
        done

        # Restoring hp to max_hp a speed to max_speed
        restore

        echo "Third dungeon catacombs..."
        echo ""
        echo "
          _______________  
           @ @_______@ @   
           | |###|###| |   
           | |###|*##| |   
           | |###|###| |   
               /   \

        checkpiont  
        "
        sleep 5
        clear

        while true; do
            # Third dungeon
            for round in 1 2 3 4 5 6 7 8; do

                # random choosing enemies from case
                enemy=$(( RANDOM % 2 ))

                case $enemy in
                    0)
                        name="Skeleton"
                        hpm=20
                        attackm=5
                        ;;
                    1)
                        name="Undead"
                        hpm=25
                        attackm=5
                        ;;
                esac
            
                # Calling a fight function
                fight

                # if you died breaks the for loop
                if [[ $dead -eq 1 ]]; then
                    break
                fi
            done

            # if you are alive breaks the while loop
            if [[ $dead -eq 0 ]]; then
                break
            fi

            echo "You died! Respawning at checkpoint..."
            dead=0
            restore
        done

        # Restoring hp to max_hp a speed to max_speed
        restore

        echo "BOSS FIGHT"
        echo ""
        echo "
           
             \
            / \
         __/___\__      ##
           | * *       ## 
           #####     / 
            ####   /
            #### /
              /
           /

        checkpoint   
        "
        sleep 5
        clear

        while true; do  
            # Third dungeon
            # boss stats
            name="BOSS"
            hpm=40
            attackm=10
          
            # Calling a fight function
            fight
        
            # Checking if player is dead
            if [[ $dead -eq 0 ]]; then
                break
            fi

            # if you died, brings you to checkpoint
            echo "You died! Respawning at checkpoint..."
            dead=0
            restore
        done

        echo "=== YOU WON! ==="
        sleep 10
    fi
fi

