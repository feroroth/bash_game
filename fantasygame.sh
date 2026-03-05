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
        speed=3
        ;;
    2)
        type="mage"
        hp=20
        attack=10
        magicattack=20
        speed=2
        ;;
    3)
        type="archer"
        hp=20
        attack=20
        speed=1
        ;;
        
    info1)
        echo "info knight:
        hp = 30
        attack = 30
        speed = 3"
        exit 0
        ;;
        
    info2)
        echo "info mage:
        hp = 20
        attack = 10
        magicattack = 20
        speed = 2"
        exit 0
        ;;
        
    info3)
        echo "info archer:
        hp = 20
        attack = 20
        speed = 1"
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
        # tu pôjde logika hry
        case $beast in
	
	    kostlivec)
		    type="kostlivec"
		    hpm=10
		    attackm=5
		    ;;

        esac


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
	        
            $beast=kostlivec

	        echo "skeleton - hp = $hpm"
	        
	        echo "you - hp = $hp"
	        
	        echo "skeleton is attacking, do you want to block? (y/n)"
	        read block

		    if [[ $block == y ]]; then
			    succed=$(( $RANDOM % 2 ))
			    if [[ $succed == 1 ]]; then
				    echo "Your block succeed, you are 0,1 slower"
                    speed=$(( $speed - 0,1))
			    else 
				    echo "Your block didn't succed"
				    damage=$(( $RANDOM % $attackm ))
				    if [[ $damage == 0 ]]; then
				        echo "skeleton missed"
				    else
					    echo "damage is $damage"
					    hp=$(( $hp - $damage ))
				    fi
			    fi
		    fi
					       

        fi
    else
        echo "Choose again!"
    fi
fi





# logika hry zatiaľ








