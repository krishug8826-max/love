<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.time.*, java.time.temporal.ChronoUnit" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Janamdin Mubarak Meri Jaan ❤️</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Dancing+Script:wght@700&family=Great+Vibes&family=Poppins:wght@300;600&display=swap');

        :root {
            --dark-maroon: #1a0000;
            --page-bg: #2d0000;
            --gold: #ffb703;
            --polaroid-white: #fdfdfd;
        }

        body, html {
            margin: 0; padding: 0; width: 100%; height: 100%;
            background: radial-gradient(circle at center, #3a0014 0%, #110005 70%, #000000 100%);
            font-family: 'Poppins', sans-serif; overflow: hidden; color: white;
        }

        /* Ambient Sparkles */
        .sparkle { position: fixed; background: white; border-radius: 50%; opacity: 0.5; animation: blink 2s infinite; pointer-events: none; }
        @keyframes blink { 0%, 100% { opacity: 0.2; } 50% { opacity: 0.8; scale: 1.5; } }

        /* STEP 1: HEART PAGE */
        #page1 { height: 100vh; display: flex; flex-direction: column; justify-content: center; align-items: center; z-index: 10; position: relative; transition: 1s; }
        .main-heart { background-color: #ff0040; height: 180px; width: 180px; position: relative; transform: rotate(-45deg); animation: heartBeat 1s infinite; cursor: pointer; box-shadow: 0 0 80px #ff0040; }
        .main-heart:before, .main-heart:after { content: ""; background-color: #ff0040; border-radius: 50%; height: 180px; width: 180px; position: absolute; }
        .main-heart:before { top: -90px; left: 0; }
        .main-heart:after { left: 90px; top: 0; }
        @keyframes heartBeat { 0%, 100% { transform: scale(1) rotate(-45deg); } 50% { transform: scale(1.1) rotate(-45deg); } }

        /* STEP 2: LOVE LETTER */
        #page2 { position: fixed; top: 0; left: 0; width: 100%; height: 100%; display: none; justify-content: center; align-items: center; opacity: 0; transition: 1s; z-index: 50; }
        .grand-card { width: 85%; max-width: 500px; background: rgba(0, 0, 0, 0.85); backdrop-filter: blur(20px); border-radius: 30px; padding: 25px; border: 1px solid rgba(255, 0, 64, 0.4); text-align: center; max-height: 85vh; overflow-y: auto; }
        .love-letter { font-size: 1.1rem; line-height: 1.6; color: #ffe6eb; text-align: left; margin: 20px 0; }

        /* STEP 3: BOOK SECTION */
        #bookSection { display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; justify-content: center; align-items: center; z-index: 100; background: rgba(0,0,0,0.95); opacity: 0; transition: 1s; }
        .book-container { width: 90vw; max-width: 360px; height: 75vh; perspective: 2000px; }
        .book { width: 100%; height: 100%; position: relative; transform-style: preserve-3d; }
        .page { width: 100%; height: 100%; position: absolute; transform-origin: left; transform-style: preserve-3d; transition: 1.2s cubic-bezier(0.645, 0.045, 0.355, 1); cursor: pointer; }
        .front { position: absolute; width: 100%; height: 100%; backface-visibility: hidden; background: var(--page-bg); border-radius: 0 15px 15px 0; padding: 20px; box-sizing: border-box; display: flex; flex-direction: column; align-items: center; box-shadow: inset -10px 0 30px rgba(0,0,0,0.7); border: 1px solid rgba(255,183,3,0.1); overflow: hidden;}
        .back { position: absolute; width: 100%; height: 100%; backface-visibility: hidden; transform: rotateY(180deg); background: var(--dark-maroon); border-radius: 15px 0 0 15px; box-shadow: inset 10px 0 30px rgba(0,0,0,0.7); }

        /* FRAME DECORATION */
        .polaroid-wrapper { position: relative; width: 85%; margin-top: 20px; }
        .polaroid { background: var(--polaroid-white); padding: 10px 10px 35px 10px; border-radius: 2px; box-shadow: 0 10px 25px rgba(0,0,0,0.6); position: relative; z-index: 2; }
        .polaroid img { width: 100%; height: 170px; object-fit: cover; }
        .flower-layer { position: absolute; font-size: 30px; z-index: 5; filter: drop-shadow(0 0 5px rgba(0,0,0,0.3)); }
        .crown { position: absolute; top: -35px; left: 50%; transform: translateX(-50%); font-size: 40px; z-index: 6; filter: drop-shadow(0 0 10px var(--gold)); }
        .fl-1 { top: -10px; left: -10px; } .fl-2 { top: -10px; right: -10px; }
        .content h2 { color: var(--gold); font-family: 'Dancing Script'; margin: 10px 0 5px 0; }
        .page.flipped { transform: rotateY(-180deg); }

        /* STEP 4: TIMER PAGE */
        #timerPage { position: fixed; top: 0; left: 0; width: 100%; height: 100%; display: none; justify-content: center; align-items: center; z-index: 150; background: radial-gradient(circle at center, #2d1b4e 0%, #1a1a2e 100%); opacity: 0; transition: 1.5s; }
        .timer-card { background: rgba(255, 255, 255, 0.07); backdrop-filter: blur(20px); padding: 30px; border-radius: 30px; border: 1px solid rgba(255, 255, 255, 0.15); text-align: center; max-width: 420px; box-shadow: 0 20px 60px rgba(0,0,0,0.6); }
        .main-frame-timer { width: 180px; height: 230px; border: 10px solid #fff; border-radius: 5px; margin-bottom: 20px; }
        .time-box { background: rgba(0, 0, 0, 0.3); padding: 20px; border-radius: 15px; border: 1px solid rgba(255, 175, 204, 0.3); }
        .time-text { font-size: 1.3rem; font-weight: bold; color: #ffd166; }

        .btn-next { background: #ff0040; color: white; border: none; padding: 12px 25px; border-radius: 25px; font-weight: bold; cursor: pointer; margin-top: 15px; }
        .petal { position: fixed; background: #ff4d79; border-radius: 150% 0 150% 0; animation: fall linear infinite; pointer-events: none; z-index: 200; }
        @keyframes fall { to { transform: translateY(110vh) rotate(360deg); } }
    </style>
</head>
<body>

    <audio id="bgMusic" loop>
        <source src="Raataan Lambiyan-320kbps.mp3" type="audio/mpeg">
    </audio>

    <div id="page1">
        <div class="main-heart" onclick="showLetter()"></div>
        <h1 style="font-family: 'Dancing Script'; margin-top: 110px; font-size: 1.5rem;">Click Karo Jaan ❤️</h1>
    </div>

    <div id="page2">
        <div class="grand-card">
            <h1 style="font-family: 'Great Vibes'; color: #ff4d79; font-size: 3rem;">To My Everything ❤️</h1>
            <div class="love-letter">
                <p>Mera har ek din tumhari smile se shuru hota hai. Tum sirf meri sukoon ho. Aaj tumhara birthday hai, I am so happy for you!</p>
                <p>Happy Birthday, My Queen. I Love You Forever! ❤️✨</p>
            </div>
            <button class="btn-next" onclick="showBook()">🌹 Hamari Yaadein Dekho 🌹</button>
        </div>
    </div>

    <div id="bookSection">
        <div class="book-container">
            <div class="book">
                <div class="page" style="z-index: 1;">
                    <div class="front" style="justify-content: center;">
                        <span class="crown">👑</span>
                        <h2 style="color: #ff3366;">I Love You! ❤️</h2>
                        <button class="btn-next" onclick="showTimer()">Hamesha ke Liye ✨</button>
                    </div>
                    <div class="back"></div>
                </div>
                <div class="page" style="z-index: 2;"><div class="front"><div class="polaroid-wrapper"><span class="flower-layer fl-1">🌸</span><div class="polaroid"><img src="photo6.jpg"></div></div><div class="content"><h2>Mera Suqoon</h2><p>Har pal jannat hai.</p></div></div><div class="back"></div></div>
                <div class="page" style="z-index: 3;"><div class="front"><div class="polaroid-wrapper"><span class="crown">👑</span><div class="polaroid"><img src="photo5.jpg"></div></div><div class="content"><h2>Meri Queen</h2><p>Hamesha sath dena.</p></div></div><div class="back"></div></div>
                <div class="page" style="z-index: 4;"><div class="front"><div class="polaroid-wrapper"><span class="flower-layer fl-2">🌹</span><div class="polaroid"><img src="photo4.jpg"></div></div><div class="content"><h2>Ek Waada</h2><p>Hamesha mere sath rehna.</p></div></div><div class="back"></div></div>
                <div class="page" style="z-index: 5;"><div class="front"><div class="polaroid-wrapper"><span class="flower-layer fl-1">🌷</span><div class="polaroid"><img src="photo3.jpg"></div></div><div class="content"><h2>Pehli Mulaqat</h2><p>Yaad hai wo din?</p></div></div><div class="back"></div></div>
                <div class="page" style="z-index: 6;"><div class="front"><div class="polaroid-wrapper"><span class="crown">👑</span><div class="polaroid"><img src="photo2.jpg"></div></div><div class="content"><h2>Muskurahat</h2><p>Teri hasi meri jaan hai.</p></div></div><div class="back"></div></div>
                <div class="page" style="z-index: 7;">
                    <div class="front" style="justify-content: center; background: radial-gradient(#4d0000, #000);">
                        <h2 style="color:var(--gold);">🌹 Hamari Yaadein</h2>
                        <p>Kholne ke liye tap karein</p>
                    </div>
                    <div class="back"></div>
                </div>
            </div>
        </div>
    </div>

    <%
        LocalDate startDate = LocalDate.of(2006, Month.DECEMBER, 19);
        LocalDate today = LocalDate.now();
        Period diff = Period.between(startDate, today);
    %>
    <div id="timerPage">
        <div class="timer-card">
            <div style="position:relative; display:inline-block;">
                <span style="position:absolute; top:-20px; left:50%; transform:translateX(-50%); font-size:40px;">🌸</span>
                <img src="love.jpg" class="main-frame-timer">
            </div>
            <div style="color: #ffafcc; margin-bottom: 10px;">Hume Mile Hue Itna Waqt Ho Gaya...</div>
            <div class="time-box">
                <div class="time-text"><%= diff.getYears() %> Saal, <%= diff.getMonths() %> Maheene, <%= diff.getDays() %> Din</div>
                <div id="live-clock" style="color: #ffafcc; font-size: 1rem; margin-top: 5px;"></div>
            </div>
            <div style="font-size: 2rem; margin-top: 15px; animation: pulse 1.5s infinite;">❤️</div>
            <p>I Love You Forever</p>
            <button class="btn-next" onclick="location.reload()">Shuru Se Dekhein</button>
        </div>
    </div>

    <script>
        function showLetter() {
            document.getElementById('bgMusic').play();
            document.getElementById('page1').style.display = 'none';
            const p2 = document.getElementById('page2');
            p2.style.display = 'flex';
            setTimeout(() => p2.style.opacity = '1', 100);
            for(let i=0; i<30; i++) setTimeout(createPetal, i * 200);
        }

        function showBook() {
            document.getElementById('page2').style.opacity = '0';
            setTimeout(() => {
                document.getElementById('page2').style.display = 'none';
                const bs = document.getElementById('bookSection');
                bs.style.display = 'flex';
                setTimeout(() => bs.style.opacity = '1', 100);
            }, 1000);
        }

        function showTimer() {
            document.getElementById('bookSection').style.opacity = '0';
            setTimeout(() => {
                document.getElementById('bookSection').style.display = 'none';
                const tp = document.getElementById('timerPage');
                tp.style.display = 'flex';
                setTimeout(() => tp.style.opacity = '1', 100);
            }, 1000);
        }

        function updateLive() {
            const now = new Date();
            const clock = document.getElementById('live-clock');
            if(clock) clock.innerHTML = now.getHours() + " Ghante, " + now.getMinutes() + " Mins, " + now.getSeconds() + " Secs";
        }
        setInterval(updateLive, 1000);

        function createPetal() {
            const petal = document.createElement('div');
            petal.className = 'petal';
            petal.style.left = Math.random() * 100 + 'vw';
            petal.style.top = '-20px';
            petal.style.width = (Math.random() * 10 + 10) + 'px';
            petal.style.height = petal.style.width;
            petal.style.animationDuration = (Math.random() * 3 + 4) + 's';
            document.body.appendChild(petal);
            setTimeout(() => petal.remove(), 6000);
        }

        document.querySelectorAll('.page').forEach(p => p.addEventListener('click', () => p.classList.toggle('flipped')));
    </script>
</body>
</html>