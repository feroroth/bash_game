#!/bin/bash

echo "Choose your class:

1 - knight
2 - mage
3 - archer

For info about class stats type: info1, info2, info3
"

read class

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

if [[ $class == 1 || $class == 2 || $class == 3 ]]; then
    echo "You have chosen $type class, do you want to continue? (y/n)"
    read yorn
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

        if [[ $ready == "y" ]]; then
	        
            beast=kostlivec
            hpm=10
            attackm=5

            echo "Skeleton attacks!"

	        echo "skeleton - hp = $hpm"
	        
	        echo "your $type - hp = $hp"
	        
            while [[ $hp -gt 0 && $hpm -gt 0 ]]; do
            
	        echo "skeleton is attacking, do you want to block? (y/n)"
	        read block

		    if [[ $block == y ]]; then
			    succed=$(( $RANDOM % 2 ))
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
            else
                damage=$(( RANDOM % attackm + 1 ))
                echo "You took $damage damage."
                hp=$(( hp - damage ))
		    fi

            echo "Your hp: $hp"

            if [[ $hp -le 0 ]]; then
                echo "YOU DIED"
                break
            fi

            echo ""
            echo "Your move"
            echo "1 - strong attack - more damage, but also slows you"
            echo "2 - small attack - less damage"

            read attackchoice

            if [[ $attackchoice == 1 ]]; then
                playerdamage=$(( RANDOM % attack + attack / 2 ))
                echo "You strike hard for $playerdamage damage!"
                speed=$(( speed - 1 ))
                if [[ $speed -lt 1 ]]; then
                    speed=1
                fi
            else
                    playerdamage=$(( RANDOM % (attack / 2) + 1 ))
                    echo "You strike for $playerdamage damage!"
            fi

            hpm=$(( hpm - playerdamage ))

                if [[ $hpm -le 0 ]]; then
                    echo ""
                    echo "You defeated the skeleton! Victory!"
                else
                    echo "Skeleton hp: $hpm"
                fi

                echo ""

            done


        fi
    else
        echo "Choose again!"
    fi
fi





# logika hry zatiaľ








