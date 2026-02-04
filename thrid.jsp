
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.time.*, java.time.temporal.ChronoUnit" %>
<!DOCTYPE html>
<html lang="hi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hamara Haseen Safar</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Pacifico&family=Poppins:wght@300;400;600;700&display=swap');

        body, html {
            margin: 0; padding: 0; min-height: 100vh;
            font-family: 'Poppins', sans-serif;
            color: white; overflow-x: hidden;
            background: #1a1a2e;
            display: flex; flex-direction: column; align-items: center; justify-content: center;
        }

        .stars {
            position: fixed; top: 0; left: 0; width: 100%; height: 100%;
            background: url('https://www.transparenttextures.com/patterns/stardust.png');
            opacity: 0.5; z-index: 1; pointer-events: none;
        }

        /* --- SECTION 1: TIMER & NOTE --- */
        #section-timer { display: flex; flex-direction: column; align-items: center; z-index: 10; width: 100%; }

        .card {
            background: rgba(255, 255, 255, 0.07); backdrop-filter: blur(20px);
            padding: 30px 20px; border-radius: 25px; border: 1px solid rgba(255, 255, 255, 0.15);
            text-align: center; width: 90%; max-width: 400px; box-shadow: 0 20px 60px rgba(0,0,0,0.6); margin: 20px;
        }

        .photo-wrap { position: relative; display: inline-block; margin-bottom: 25px; }
        .side-photo { position: absolute; width: 60px; height: 80px; border: 4px solid #fff; border-radius: 3px; top: 40px; z-index: 5; object-fit: cover; }
        .left { left: -45px; transform: rotate(-15deg); }
        .right { right: -45px; transform: rotate(15deg); }

        .sticky-note {
            background: #fff9c4; color: #333; padding: 20px; border-radius: 2px;
            box-shadow: 5px 5px 15px rgba(0,0,0,0.4); font-size: 0.95rem;
            text-align: left; border-bottom-right-radius: 25px; width: 85%; max-width: 320px;
            transform: rotate(1deg); margin: 20px auto; line-height: 1.5; position: relative;
        }

        .btn-gift {
            background: linear-gradient(45deg, #ff0040, #ff8a00);
            border: none; padding: 15px 40px; color: white; border-radius: 50px;
            font-weight: bold; cursor: pointer; font-size: 1.1rem; margin-top: 20px;
            box-shadow: 0 0 20px rgba(255, 0, 64, 0.4); transition: 0.3s;
        }

        /* --- SECTION 2: GIFT PAGE --- */
        #section-gift-page { display: none; text-align: center; z-index: 20; width: 100%; }
        .gift-box-large { font-size: 120px; animation: heartbeat 1.5s infinite; filter: drop-shadow(0 0 30px #ff4d6d); cursor: pointer; }
        @keyframes heartbeat { 0%, 100% { transform: scale(1); } 50% { transform: scale(1.1); } }

        /* --- FULL SCREEN SURPRISE --- */
        #surprise-final { 
            display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; 
            z-index: 1000; overflow: hidden; display: none; 
            flex-direction: column; align-items: center; justify-content: center;
        }
        
        /* Poori Screen wali Photo */
        .full-screen-bg {
            position: absolute; top: 0; left: 0; width: 100%; ;
            object-fit: cover; z-index: -1;
            filter: brightness(0.6); /* Text ko readable banane ke liye thoda dark */
            animation: expandOut 1.5s ease-out forwards;
            background-size: cover;
            height: 100vh;
        }
        @keyframes expandOut { from { transform: scale(0.5); opacity: 0; } to { transform: scale(1); opacity: 1; } }

        .love-msg { font-family: 'Pacifico', cursive; font-size: 2.5rem; color: #ffafcc; margin: 10px; text-shadow: 0 0 20px #ff0040; text-align: center;  }
        .sub-msg { color: #ffd166; font-size: 1.3rem; font-weight: bold; text-shadow: 0 0 10px black; text-align: center; padding: 0 20px; }

        .drop { position: fixed; pointer-events: none; z-index: 2000; animation: fall 4s linear forwards; }
        @keyframes fall { to { transform: translateY(110vh) rotate(360deg); opacity: 0; } }

        @media (min-width: 768px) {
            #section-timer { flex-direction: row; justify-content: center; gap: 50px; }
            .sticky-note { margin: 0; transform: rotate(2deg); }
        }
    </style>
</head>
<body onclick="playSong()">

<audio id="mySong" loop>
    <source src="Kesariya(PagaiWorld.com).mp3" type="audio/mpeg">
</audio>

<div class="stars"></div>

<div id="section-timer">
    <%
        LocalDate startDate = LocalDate.of(2006, Month.DECEMBER, 19); 
        LocalDate today = LocalDate.now();
        Period diff = Period.between(startDate, today);
    %>
    <div class="card">
        <div class="photo-wrap">
            <div style="position: absolute; top: -35px; left: 50%; transform: translateX(-50%); font-size: 40px; z-index: 15;">🌸🌺🌷</div>
            <img src="love.jpg" class="side-photo left">
            <img src="love.jpg" class="side-photo right">
            <div style="background: #222; width: 160px; height: 210px; border: 8px solid #fff; display: flex; align-items: center; justify-content: center;">
                <p style="color: #666; font-size: 0.7rem;">Kal Ki Photo <br>Yahan Hogi ❤️</p>
            </div>
        </div>
        <div style="background: rgba(0,0,0,0.3); padding: 15px; border-radius: 15px; border: 1px solid rgba(255,175,204,0.3);">
            <div style="font-size: 1.1rem; font-weight: bold; color: #ffd166;">
                <%= diff.getYears() %> Saal, <%= diff.getMonths() %> Maheene, <%= diff.getDays() %> Din
            </div>
            <div id="live-clock" style="color: #ffafcc; font-size: 0.9rem; margin-top: 5px;"></div>
        </div>
        
    </div>
    <div class="sticky-note">
    <strong>Koshish ki thi ki sab kuch perfect ho...
           But Tumse Jada Perfect nhi ho Sakta </strong><br><br>
    Toh mere BETU Kaisa Laga Surprise? I hope tumhein ye Chota sa surprise acha laga hoga. I Know surprise Chota Hai Lekin iske piche ki feelings or efforts bohot saare hai. Agar achi lagi ho toh kal khud aakar mujhe zarur batana.<br><br>
    Ek aur baat, ye photo frame <strong>Blank</strong> kyu hai? Let me tell you, it's blank kyunki isme hamari kal ki photo hogi. Toh kal aana zarur!<br><br>
    HAPPY BIRTHDAY MY LOVE, hamesha aise hi khush rehna or mere saath rehkar meri life ko aur best banate rehna.<br>
    <strong>I LOVE YOU MY LITTLE PRINCESS. ❤️</strong>   
</div>
<button class="btn-gift" onclick="showGiftPage()">Aapka Gift ❤️</button>
</div>


<div id="section-gift-page">
    <div id="gift-closed" onclick="finalMagic()">
        <div class="gift-box-large">🎁</div>
        <h1 style="font-family: 'Pacifico', cursive; color: #ffafcc; font-size: 2.2rem;">Click to Open!</h1>
    </div>
</div>

<div id="surprise-final">
    <img src="WhatsApp Image 2026-02-04 at 8.34.28 PM.jpeg" class="full-screen-bg" alt="Bouquet Full Screen">
    
    <div class="love-msg">Happy Birthday, My Jaan! ❤️</div>
    <p class="sub-msg">Sabse Pyare Phool Mere Sabse Pyare Insaan Ke Liye! 💐🍫✨</p>
    
    <a href="index.jsp" style="color: white; font-weight: bold; text-decoration: none; border: 1px solid white; padding: 10px 20px; border-radius: 20px; margin-top: 30px; background: rgba(0,0,0,0.4);">← Firse Ghumna Chahogyi 💐 </a>
</div>

<script>
    var songPlayed = false;
    var audio = document.getElementById("mySong");

    function playSong() {
        if (!songPlayed) {
            audio.play().catch(e => console.log("Music play blocked"));
            songPlayed = true;
        }
    }

    function showGiftPage() {
        document.getElementById('section-timer').style.display = 'none';
        document.getElementById('section-gift-page').style.display = 'block';
        playSong(); 
    }

    function finalMagic() {
        document.getElementById('section-gift-page').style.display = 'none';
        document.getElementById('surprise-final').style.display = 'flex';

        // Heavy Rain Logic
        const elements = ['🌹', '🌸', '💖', '💐', '✨', '🍫', '❤️'];
        for(let i = 0; i < 150; i++) {
            setTimeout(() => {
                const e = document.createElement('div');
                e.className = 'drop';
                e.innerHTML = elements[Math.floor(Math.random() * elements.length)];
                e.style.left = Math.random() * 100 + 'vw';
                e.style.top = '-10vh';
                e.style.fontSize = (Math.random() * 30 + 20) + 'px';
                e.style.animationDuration = (Math.random() * 2 + 3) + 's';
                document.body.appendChild(e);
                setTimeout(() => e.remove(), 5000);
            }, i * 40);
        }
    }

    function updateLive() {
        const now = new Date();
        const timeStr = now.getHours() + "h " + now.getMinutes() + "m " + now.getSeconds() + "s";
        const el = document.getElementById('live-clock');
        if(el) el.innerHTML = timeStr;
    }
    setInterval(updateLive, 1000);
    updateLive();
</script>

</body>
</html>



