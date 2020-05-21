<?php
	function alert($errors , $session){
	    if ($session) {
		    echo    '<div class="alert alert-success">
                        '.$session.'  
                    </div>';
	    }
        
        if (count($errors) > 0) {
            foreach ($errors->all() as $err) {
                echo    '<div class="alert alert-danger">
        	               '.$err.' <br>
        	            </div>';
            }
        }
        return $errors . $session;
	}

    function checkScript($str){
        $flag = false;
        $content = $str;
        $pattern = '/(<\/?script)/';
        $replace = ' ';
        if (preg_match($pattern , $content)) {
            preg_replace($pattern, $replace , $content);
            $flag = true;
        }
        return $flag;
    }

    function checkLevel($condition){
        if (Auth::user()->level == $condition || Auth::user()->level < $condition) {
            $alert = 'onclick="alertLevel()"';
        }else{
            $alert = '';
        }
        return $alert;
    }

    function TimeFormat($time){
        $postTime  = strtotime($time);
        $nowTime   = time();
        $countTime = $nowTime - $postTime;

        $seconds   = $countTime;
        $minutes   = round($countTime / 60);
        $hours     = round($countTime / 3600);
        $days      = round($countTime / 86400);
        $weeks     = round($countTime / 604800);
        $months    = round($countTime / 2600640);
        $years     = round($countTime / 31207680);

        // seconds
        if ($seconds < 60) {
            $showTime = "Vài giây trước";
        }
        // minutes
        elseif($minutes < 60){
            if ($minutes == 1) {
                $showTime = "1 phút trước";
            }else{
                $showTime = "$minutes phút trước";
            }
        }
        // hours
        elseif ($hours < 24) {
            if ($hours == 1) {
                $showTime = "1 giờ trước";
            }else{
                $showTime = "$hours giờ trước";
            }
        }
        // days
        elseif ($days < 7) {
            if ($days == 1) {
                $showTime = "1 ngày trước";
            }else{
                $showTime = "$days ngày trước";
            }
        }
        // weeks
        elseif ($weeks > 4.3 ) {
            if ($weeks == 1) {
                $showTime = "1 tuần trước";
            }else{
                $showTime = "$weeks tuần trước";
            }
        }
        // months
        elseif ($months > 12 ) {
            if ($months == 1) {
                $showTime = "1 tháng trước";
            }else{
                $showTime = "$months tháng trước";
            }
        }else{
            if ($years == 1) {
                $showTime = "1 năm trước";
            }else{
                $showTime = "$years năm trước";
            }
        }

        return $showTime;
    }

