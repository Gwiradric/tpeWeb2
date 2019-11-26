<?php

class WhiteList
{
    private $sentences;

    function __construct()
    {
        $this->sentences = [
            "date",
            "score",
            "desc",
            "asc"
        ];
    }

    function isSafe($data) {
        $result = true;
        for ($i=0; $i < count($data); $i++) { 
            # code...
            if (!in_array($data[$i], $this->sentences))
                $result = false;
        }
        return $result;
    }
}
