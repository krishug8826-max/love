<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.time.*, java.time.temporal.ChronoUnit" %>
<!DOCTYPE html>
<html lang="hi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hamara Haseen Safar</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap');

        body, html {
            margin: 0; padding: 0; min-height: 100%;
            font-family: 'Poppins', sans-serif;
            color: white; overflow-x: hidden;
            background: radial-gradient(circle at center, #2d1b4e 0%, #1a1a2e 100%);
            display: flex; flex-direction: column; justify-content: center; align-items: center;
        }

        .stars {
            position: fixed; top: 0; left: 0; width: 100%; height: 100%;
            background: url('https://www.transparenttextures.com/patterns/stardust.png');
            opacity: 0.5; z-index: 1; pointer-events: none;
        }

        /* --- PYARA SA NOTE (RESPONSIVE) --- */
        .sticky-note {
            background: #fff9c4; color: #333;
            padding: 20px; border-radius: 2px;
            box-shadow: 5px 5px 15px rgba(0,0,0,0.4);
            font-family: 'Poppins', sans-serif; font-size: 0.95rem;
            text-align: left; border-bottom-right-radius: 25px;
            position: relative; margin: 20px auto; 
            width: 85%; max-width: 320px;
            transform: rotate(1deg); z-index: 20;
            line-height: 1.5;
        }
        .sticky-note::before {
            content: "📌"; position: absolute; top: -15px; left: 50%; transform: translateX(-50%);
        }

        .card {
            position: relative; z-index: 10;
            background: rgba(255, 255, 255, 0.07);
            backdrop-filter: blur(20px);
            padding: 30px 20px;
            border-radius: 25px;
            border: 1px solid rgba(255, 255, 255, 0.15);
            text-align: center;
            width: 90%; max-width: 400px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.6);
            margin: 20px;
        }

        .photo-wrap { position: relative; display: inline-block; margin-bottom: 25px; }
        
        .flowers {
            position: absolute; top: -35px; left: 50%;
            transform: translateX(-50%); font-size: 40px; z-index: 15;
            filter: drop-shadow(0 0 10px #ffafcc);
        }

        .main-frame {
            width: 160px; height: 210px; border: 8px solid #fff;
            border-radius: 5px; box-shadow: 0 10px 30px rgba(0,0,0,0.5);
            object-fit: cover; background: #333; /* Placeholder for blank frame */
        }

        .side-photo {
            position: absolute; width: 60px; height: 80px;
            border: 4px solid #fff; border-radius: 3px; top: 40px; z-index: 5;
            object-fit: cover;
        }
        .left { left: -45px; transform: rotate(-15deg); }
        .right { right: -45px; transform: rotate(15deg); }

        .timer-title { font-size: 1.1rem; color: #ffafcc; margin-bottom: 15px; font-weight: 600; }
        
        .time-box {
            background: rgba(0, 0, 0, 0.3);
            padding: 15px; border-radius: 15px;
            border: 1px solid rgba(255, 175, 204, 0.3);
        }

        .time-text {
            font-size: 1.1rem; font-weight: bold; color: #ffd166;
            text-shadow: 0 0 8px rgba(255, 209, 102, 0.4);
        }

        #live-clock { font-size: 0.9rem; color: #ffafcc; margin-top: 8px; }

        .heart { font-size: 2rem; margin-top: 15px; animation: pulse 1.5s infinite; color: #ff4d6d; }
        @keyframes pulse { 0% {transform: scale(1);} 50% {transform: scale(1.2);} 100% {transform: scale(1);} }

        .btn-love {
            background: linear-gradient(45deg, #ff0040, #ff8a00);
            border: none; padding: 12px 30px; color: white;
            border-radius: 50px; font-weight: bold; cursor: pointer;
            text-decoration: none; display: inline-block; margin-top: 20px;
            font-size: 0.9rem; transition: 0.3s;
        }
        .btn-love:hover { transform: scale(1.05); }

        @media (min-width: 768px) {
            .sticky-note { position: absolute; right: 50px; top: 50px; margin: 0; transform: rotate(2deg); }
            body { flex-direction: row; }
        }
    </style>
</head>
<body onclick="playSong()"> <audio id="mySong" loop>
    <source src="Os_Kudi_Nu.mp3" type="audio/mpeg">
</audio>

<%
    LocalDate startDate = LocalDate.of(2006, Month.DECEMBER, 19); 
    LocalDate today = LocalDate.now();
    Period diff = Period.between(startDate, today);
%>

<div class="stars"></div>

<div class="card">
    <div class="photo-wrap">
        <div class="flowers">🌸🌺🌷</div>
        <img src="love.jpg" class="side-photo left">
        <img src="love.jpg" class="side-photo right">
        <div style="background: #222; width: 160px; height: 210px; border: 8px solid #fff; display: inline-block; position: relative;">
            <p style="color: #666; font-size: 0.7rem; margin-top: 80px;">Kal Ki Photo <br>Yahan Hogi ❤️</p>
        </div>
    </div>

    <div class="timer-title">Hume Mile Hue Itna Waqt Ho Gaya...</div>

    <div class="time-box">
        <div class="time-text">
            <%= diff.getYears() %> Saal, <%= diff.getMonths() %> Maheene, <%= diff.getDays() %> Din
        </div>
        <div id="live-clock"></div>
    </div>

    <div class="heart">❤</div>
    <p style="letter-spacing: 1px; opacity: 0.9; font-size: 0.9rem; font-weight: 600;">I Love You Forever</p>
    <a href="index.jsp" class="btn-love">Fir Se Ghumna hai Betu❤ ✨</a>
</div>

<div class="sticky-note">
    <strong>Koshish ki thi ki sab kuch perfect ho...</strong><br><br>
    Toh mere BETU Kaisa Laga Surprise? I hope tumhein ye Chota sa surprise acha laga hoga. I Know surprise Chota Hai Lekin iske piche ki feelings or efforts bohot saare hai. Agar achi lagi ho toh kal khud aakar mujhe zarur batana.<br><br>
    Ek aur baat, ye photo frame <strong>Blank</strong> kyu hai? Let me tell you, it's blank kyunki isme hamari kal ki photo hogi. Toh kal aana zarur!<br><br>
    HAPPY BIRTHDAY MY LOVE, hamesha aise hi khush rehna or mere saath rehkar meri life ko aur best banate rehna.<br>
    <strong>I LOVE YOU MY LITTLE PRINCESS. ❤️</strong>
</div>

<script>
    // Song play karne ka function
    var songPlayed = false;
    function playSong() {
        var audio = document.getElementById("mySong");
        if (!songPlayed) {
            audio.play().catch(function(error) {
                console.log("Autoplay blocked, waiting for interaction");
            });
            songPlayed = true;
        }
    }

    // Timer update function
    function updateLive() {
        const now = new Date();
        const timeStr = now.getHours() + " Ghante, " + now.getMinutes() + " Mins, " + now.getSeconds() + " Secs";
        document.getElementById('live-clock').innerHTML = timeStr;
    }
    setInterval(updateLive, 1000);
    updateLive();

    // Try playing on load (some browsers might allow if previously interacted)
    window.onload = function() {
        playSong();
    }
</script>

</body>
</html>