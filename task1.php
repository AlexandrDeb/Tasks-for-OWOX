<?php

/**
 * @param $string
 * @return bool
 */

function checkBrackets($s)
{
    $count = 0;
    $stack = array();
    $bracket = '';
    $lng = strlen($s);
    for ($i = 0; $i < $lng; $i++) {
        if ($s[$i] == ')') {
            $bracket = '(';
        } elseif ($s[$i] == ']') {
            $bracket = '[';
        }

        if ($s[$i] == '(' || $s[$i] == '[') {
            $stack[] = $s[$i];

        } elseif ($s[$i] == ')' || $s[$i] == ']') {

            if (array_pop($stack) != $bracket) {
                return false;
            }


        }

    }
    $count = count($stack);
    if ($count) {
        return false;
    }
    return true;

}