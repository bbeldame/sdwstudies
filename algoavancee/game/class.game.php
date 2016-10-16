<?php

class Game {
    public function message($player Player) {
        $points = $player->getPoints();

        $string = $player->getName() . ' , vous avez ';
        $string .= $points . ', vous êtes donc : ';
        
        if ($points <= 10) {
            $string .= 'pas top.';
        } elseif ($points <= 15) {
            $string .= 'moyen.';
        } else {
            $string .= 'bon.';
        }

        return $string;
    }
}