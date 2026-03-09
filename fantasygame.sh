#!/bin/bash

echo "Choose your class:

1 - knight
2 - mage
3 - archer

For info about class stats type: info1, info2, info3
"

read class

# classes

case $class in
    1)
        type="knight"
        hp=30
        attack=30
        speed=10
        ;;
    2)
        type="mage"
        hp=20
        attack=10
        magicattack=20
        speed=20
        ;;
    3)
        type="archer"
        hp=20
        attack=20
        speed=30
        ;;
        
    info1)
        echo "info knight:
        hp = 30
        attack = 30
        speed = 30"
        exit 0
        ;;
        
    info2)
        echo "info mage:
        hp = 20
        attack = 10
        magicattack = 20
        speed = 20"
        exit 0
        ;;
        
    info3)
        echo "info archer:
        hp = 20
        attack = 20
        speed = 10"
        exit 0
        ;;
        
    *)
        echo "Invalid choice!"
        exit 1
        ;;
esac

# first if checks what classes player choosed
if [[ $class == 1 || $class == 2 || $class == 3 ]]; then
    echo "You have chosen $type class, do you want to continue? (y/n)"
    read yorn

    # if player pressed y
    if [[ $yorn == y ]]; then
        echo "Starting game..."

        sleep 1

        echo "Welcome to land where dragons still fly and orcs still fight, you are the only one who can free this land from bad wich king which rule this land 
        and is located in the deepest dungeons where you will be fighting creatures every man is scared to think of."

        sleep 2

        echo "Quick rules:
        You will fight monsters, before every fight you will see their hp and attack strength, you can block attack which will slower you a bit and you have 
        50% chance of not getting hit.
        During your turn you have only 2 moves, strong attack and weak attack, strong attack will make you slower, archer and mage can stike right after beast 
        came."

        sleep 5

        echo "Are you ready? (y/n)"

        read ready

        sleep 5
        clear

        # Case for enemies
        for round in 1 2 3; do
            
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

            if [[ $ready == "y" ]]; then
            
                echo "$name attacks!"
	            echo "$name - hp = $hpm"
	            echo "your $type - hp = $hp"
	        
                # start of a while loop, here attack beggins
                while [[ $hp -gt 0 && $hpm -gt 0 ]]; do
            
	            echo "$name is attacking, do you want to block? (y/n)"
	            read block

                # part for blocking

		        if [[ $block == y ]]; then
			        succed=$(( $RANDOM % 2 ))

                    # checks if your block succed
			        if [[ $succed == 1 ]]; then
				        echo "Your block succeed, you are a bit slower"
                        speed=$(( speed - 1 ))
                        if [[ $speed -lt 1 ]]; then
                            speed=1
                        fi
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
                    echo "YOU DIED"
                    sleep 5
                    clear
                break
            fi

            echo ""
            echo "Your move"
            echo "1 - strong attack - more damage, but also slows you"
            echo "2 - small attack - less damage"

            read attackchoice

            # For strong attack
            if [[ $attackchoice == 1 ]]; then
                playerdamage=$(( RANDOM % attack + attack / 2 ))
                echo "You strike hard for $playerdamage damage!"
                speed=$(( speed - 1 ))
                if [[ $speed -lt 1 ]]; then
                    speed=1
                fi
            #Small attack
            else
                playerdamage=$(( RANDOM % (attack / 2) + 1 ))
                echo "You strike for $playerdamage damage!"
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

        fi
        done
    
    # if player did not choose class 
    else
        echo "Choose again!"
    fi
fi














