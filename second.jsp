<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

        /* Ambient Glow & Sparkles */
        .sparkle {
            position: fixed; background: white; border-radius: 50%;
            opacity: 0.5; animation: blink 2s infinite; pointer-events: none;
        }
        @keyframes blink { 0%, 100% { opacity: 0.2; } 50% { opacity: 0.8; scale: 1.5; } }

        /* PAGE 1: Giant Heart */
        #page1 {
            height: 100vh; display: flex; flex-direction: column;
            justify-content: center; align-items: center; z-index: 10; position: relative;
            transition: 1s;
        }

        .main-heart {
            background-color: #ff0040; height: 180px; width: 180px;
            position: relative; transform: rotate(-45deg);
            animation: heartBeat 1s infinite; cursor: pointer;
            box-shadow: 0 0 80px #ff0040;
        }
        .main-heart:before, .main-heart:after {
            content: ""; background-color: #ff0040; border-radius: 50%;
            height: 180px; width: 180px; position: absolute;
        }
        .main-heart:before { top: -90px; left: 0; }
        .main-heart:after { left: 90px; top: 0; }

        @keyframes heartBeat {
            0%, 100% { transform: scale(1) rotate(-45deg); }
            50% { transform: scale(1.1) rotate(-45deg); }
        }

        /* PAGE 2: Love Letter */
        #page2 {
            position: fixed; top: 0; left: 0; width: 100%; height: 100%;
            display: none; justify-content: center; align-items: center;
            opacity: 0; transition: 1s; z-index: 50;
        }

        .grand-card {
            width: 85%; max-width: 500px; background: rgba(0, 0, 0, 0.85);
            backdrop-filter: blur(20px); border-radius: 30px;
            padding: 25px; border: 1px solid rgba(255, 0, 64, 0.4);
            text-align: center; max-height: 85vh; overflow-y: auto;
        }

        .love-letter { font-size: 1.1rem; line-height: 1.6; color: #ffe6eb; text-align: left; margin: 20px 0; }

        /* PAGE 3: THE BOOK SECTION */
        #bookSection {
            display: none;
            position: fixed; top: 0; left: 0; width: 100%; height: 100%;
            justify-content: center; align-items: center;
            z-index: 100; background: rgba(0,0,0,0.9);
            opacity: 0; transition: 1s;
        }

        .book-container { width: 90vw; max-width: 360px; height: 75vh; perspective: 2000px; }
        .book { width: 100%; height: 100%; position: relative; transform-style: preserve-3d; }
        .page { width: 100%; height: 100%; position: absolute; transform-origin: left; transform-style: preserve-3d; transition: 1.2s cubic-bezier(0.645, 0.045, 0.355, 1); cursor: pointer; }
        
        .front { position: absolute; width: 100%; height: 100%; backface-visibility: hidden; background: var(--page-bg); border-radius: 0 15px 15px 0; padding: 20px; box-sizing: border-box; display: flex; flex-direction: column; align-items: center; box-shadow: inset -10px 0 30px rgba(0,0,0,0.7); border: 1px solid rgba(255,183,3,0.1); overflow: hidden;}
        .back { position: absolute; width: 100%; height: 100%; backface-visibility: hidden; transform: rotateY(180deg); background: var(--dark-maroon); border-radius: 15px 0 0 15px; box-shadow: inset 10px 0 30px rgba(0,0,0,0.7); }

        /* --- ENHANCED FRAME DESIGN --- */
        .polaroid-wrapper { position: relative; width: 85%; margin-top: 20px; }
        
        .polaroid { 
            background: var(--polaroid-white); 
            padding: 10px 10px 35px 10px; 
            width: 100%; 
            border-radius: 2px; 
            box-shadow: 0 10px 25px rgba(0,0,0,0.6);
            position: relative;
            z-index: 2;
        }
        .polaroid img { width: 100%; height: 170px; object-fit: cover; border: 1px solid #eee; }

        /* Flower Layers */
        .flower-layer {
            position: absolute;
            font-size: 35px;
            z-index: 5;
            filter: drop-shadow(0 0 5px rgba(0,0,0,0.3));
            pointer-events: none;
        }
        .fl-1 { top: -15px; left: -15px; }
        .fl-2 { top: -15px; right: -15px; }
        .fl-3 { bottom: 20px; left: -10px; font-size: 25px; }
        .fl-4 { bottom: 20px; right: -10px; font-size: 25px; }

        /* Crown Style */
        .crown {
            position: absolute;
            top: -35px;
            left: 50%;
            transform: translateX(-50%);
            font-size: 40px;
            z-index: 6;
            filter: drop-shadow(0 0 10px var(--gold));
        }
        
         .crowns {
            position: absolute;
            top: 20px;
            left: 50%;
            transform: translateX(-50%);
            font-size: 40px;
            z-index: 6;
            filter: drop-shadow(0 0 10px var(--gold));
        }
        
        .btn-love {
            background: linear-gradient(45deg, #ff0040, #ff8a00);
            border: none; padding: 15px 40px; color: white;
            border-radius: 50px; font-weight: bold; cursor: pointer;
            text-decoration: none; display: inline-block; margin-top: 20px;
        }

        .content { margin-top: 15px; text-align: center; }
        .content h2 { color: var(--gold); font-size: 1.3rem; margin: 5px 0; font-family: 'Dancing Script'; }
        .content p { color: #f1f1f1; font-size: 0.9rem; line-height: 1.4; padding: 0 5px; }
        
        .tap-hint { position: absolute; bottom: 10px; font-size: 0.7rem; color: var(--gold); animation: bounce 1.5s infinite; }
        .page.flipped { transform: rotateY(-180deg); }

        .btn-next { background: #ff0040; color: white; border: none; padding: 12px 25px; border-radius: 25px; font-weight: bold; cursor: pointer; margin-top: 10px; }

        @keyframes bounce { 0%, 100% { transform: translateY(0); opacity: 0.4; } 50% { transform: translateY(-5px); opacity: 1; } }
        
        /* Petals */
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
                 <p>Mera har ek din tumhari smile se shuru hota hai aur tumhari baaton par khatam. Aaj tumhara birthday hai, par tohfa mujhe mila hai—tumhara saath!</p>
                
                <p>Tum sirf meri girlfriend nahi ho, tum meri sukoon ho. Jab tum mere paas hoti ho, toh lagta hai duniya ki saari khushiyan mil gayi hain. 
                     Tumhari wo pagalpanti, tumhara gussa, aur tumhara be-intehaan pyaar... mujhe har din tumse phir se ishq karne par majboor kar deta hai.</p>
                
                <p>Main waada karta hoon, ki chahe halaat kaise bhi hon, mera haath hamesha tumhare haath mein hoga. Hum saath mein sapne dekhenge aur unhe pura bhi karenge.</p>
                
                <p>Meri duniya tumse shuru aur tum par hi khatam hoti hai. Janamdin mubarak ho us insaan ko jisne meri zindagi ko jannat bana diya.</p>
                
                <p>Log kehte hain ki farishte sirf kahaniyon mein hote hain, par maine tumhe pa kar dekh liya ki farishte haqiqat mein bhi hote hain. Happy Birthday, My Queen.</p>
                
                <p>Tumhari ek smile meri poori duniya roshan kar deti hai. Dua hai ki tum hamesha aise hi muskurati raho. I Love You Forever!</p>
                
                <p><b>Janamdin Mubarak ho us insaan ko jo meri poori duniya hai! Hamesha aise hi muskurati rehna, kyunki tumhari smile hi meri jeene ki wajah hai.</b></p>
                
                <p style="font-family: 'Dancing Script',cursive center; font-size: 2.5rem; color: #ff0040;">I Love You Forever! ❤️✨</p>
            </div>
            <button class="btn-next" onclick="showBook()">🌹Toda Or Under Chalte Hai🌹 ✨</button>
        </div>
    </div>

    <div id="bookSection">
        <div class="book-container">
            <div class="book">
                <div class="page" style="z-index: 1;">
                    <div class="front" style="justify-content: center;">
                        <span class="crowns">👑</span>
                        <h2 style="color: #ff3366; font-size: 1.8rem;">I Love You! ❤️</h2>
                         <p> Hamari Yaadine Ese hi Badhti Rahe. </p>
                         <a href="thrid.jsp" class="btn-love" onclick="startMagic()"> Toda Or Under ✨</a>
                    </div>
                    <div class="back"></div>
                </div>

                <div class="page" style="z-index: 2;">
                    <div class="front">
                        <div class="polaroid-wrapper">
                            <span class="flower-layer fl-1">🌸</span><span class="flower-layer fl-2">🌺</span>
                            <div class="polaroid"><img src="photo6.jpg"></div>
                        </div>
                        <div class="content"><h2>Mera Suqoon</h2><p>Tumhare sath har pal jannat hai.</p></div>
                        <div class="tap-hint">Tap Karein ▼</div>
                    </div>
                    <div class="back"></div>
                </div>

                <div class="page" style="z-index: 3;">
                    <div class="front">
                        <div class="polaroid-wrapper">
                            <span class="crown">👑</span>
                            <span class="flower-layer fl-3">🌹</span><span class="flower-layer fl-4">🌹</span>
                            <div class="polaroid"><img src="photo5.jpg"></div>
                        </div>
                        <div class="content"><h2>Meri Queen</h2><p>Hamesha mera sath dena.</p></div>
                        <div class="tap-hint">Tap Karein ▼</div>
                    </div>
                    <div class="back"></div>
                </div>

                <div class="page" style="z-index: 4;">
                    <div class="front">
                        <div class="polaroid-wrapper">
                            <span class="flower-layer fl-1">🌼</span><span class="flower-layer fl-2">🌻</span>
                            <div class="polaroid"><img src="photo4.jpg"></div>
                        </div>
                        <div class="content">
                            <h2 style="color:var(--gold)">Ek Waada</h2>
                            <p style="font-weight:bold">"Abhi aur bhi baatein baki hain leni, toh hamesha mere saath rehna."</p>
                        </div>
                        <div class="tap-hint">Tap Karein ▼</div>
                    </div>
                    <div class="back"></div>
                </div>

                <div class="page" style="z-index: 5;">
                    <div class="front">
                        <div class="polaroid-wrapper">
                            <span class="flower-layer fl-1">🌸</span><span class="flower-layer fl-4">🌸</span>
                            <div class="polaroid"><img src="photo3.jpg"></div>
                        </div>
                        <div class="content"><h2>Pehli Mulaqat</h2><p>Wo haseen din mujhe aaj bhi yaad hai.</p></div>
                        <div class="tap-hint">Tap Karein ▼</div>
                    </div>
                    <div class="back"></div>
                </div>

                <div class="page" style="z-index: 6;">
                    <div class="front">
                        <div class="polaroid-wrapper">
                            <span class="crown">👑</span>
                            <span class="flower-layer fl-1">🌷</span><span class="flower-layer fl-2">🌷</span>
                            <div class="polaroid"><img src="photo2.jpg"></div>
                        </div>
                        <div class="content"><h2>Muskurahat</h2><p>Tum hasti ho toh sab sahi lagta hai.</p></div>
                        <div class="tap-hint">Tap Karein ▼</div>
                    </div>
                    <div class="back"></div>
                </div>

                <div class="page" style="z-index: 7;">
                    <div class="front" style="justify-content: center; background: radial-gradient(#4d0000, #000);">
                        <div style="font-size: 50px;">👑</div>
                        <h2 style="color:var(--gold); font-size: 2rem;">🌹Hamari Yaadein</h2>
                        <div class="tap-hint">Kholne ke liye Tap Karein ▼</div>
                    </div>
                    <div class="back"></div>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Sparkles & Petals Logic same as before...
        for(let i=0; i<30; i++) {
            const s = document.createElement('div');
            s.className = 'sparkle';
            s.style.width = Math.random() * 4 + 'px'; s.style.height = s.style.width;
            s.style.left = Math.random() * 100 + 'vw'; s.style.top = Math.random() * 100 + 'vh';
            document.body.appendChild(s);
        }

        function showLetter() {
            document.getElementById('bgMusic').play();
            document.getElementById('page1').style.display = 'none';
            const p2 = document.getElementById('page2');
            p2.style.display = 'flex';
            setTimeout(() => p2.style.opacity = '1', 100);
            for(let i=0; i<40; i++) setTimeout(createPetal, i * 150);
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

        function createPetal() {
            const petal = document.createElement('div');
            petal.className = 'petal';
            petal.style.left = Math.random() * 100 + 'vw';
            petal.style.top = '-20px';
            const size = (Math.random() * 10 + 10) + 'px';
            petal.style.width = size; petal.style.height = size;
            petal.style.animationDuration = (Math.random() * 3 + 4) + 's';
            document.body.appendChild(petal);
            setTimeout(() => petal.remove(), 6000);
        }

        const pages = document.querySelectorAll('.page');
        pages.forEach(p => p.addEventListener('click', () => p.classList.toggle('flipped')));
    </script>
</body>
</html>




