<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Happy Birthday My Love ❤️</title>
    
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Dancing+Script:wght@700&family=Poppins:wght@300;400&display=swap');

        body {
            margin: 0; padding: 0;
            background: #0a0101; /* Deep dark romantic theme */
            height: 100vh; display: flex;
            justify-content: center; align-items: center;
            font-family: 'Poppins', sans-serif; overflow: hidden; color: white;
        }

        /* Fairy Lights Effect */
        .light-strip {
            position: absolute; top: 0; width: 100%;
            display: flex; justify-content: space-around; z-index: 5;
        }
        .light {
            width: 12px; height: 12px; border-radius: 50%;
            animation: glow 1s infinite alternate;
        }
        @keyframes glow {
            from { box-shadow: 0 0 5px #fff, 0 0 10px #ff0040; background: #ff0040; }
            to { box-shadow: 0 0 20px #fff, 0 0 30px #ff0040; background: #fff; }
        }

        /* Big Beating Heart */
        .heart-box { position: absolute; top: 15%; z-index: 1; }
        .heart {
            background-color: #ff0040; height: 130px; width: 130px;
            position: relative; transform: rotate(-45deg);
            animation: beat 0.8s infinite alternate;
            box-shadow: 0 0 60px rgba(255, 0, 64, 0.7);
        }
        .heart:before, .heart:after {
            content: ""; background-color: #ff0040; border-radius: 50%;
            height: 130px; width: 130px; position: absolute;
        }
        .heart:before { top: -65px; left: 0; }
        .heart:after { left: 65px; top: 0; }
        @keyframes beat {
            0% { transform: scale(1) rotate(-45deg); }
            100% { transform: scale(1.2) rotate(-45deg); }
        }

        /* Glassmorphism Card */
        .glass-card {
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(15px); padding: 40px 30px;
            border-radius: 30px; text-align: center;
            border: 1px solid rgba(255, 255, 255, 0.2);
            width: 85%; max-width: 450px; z-index: 10;
            box-shadow: 0 10px 40px rgba(0,0,0,0.8); margin-top: 80px;
        }

        h1 {
            font-family: 'Dancing Script', cursive; font-size: 3rem;
            margin: 0; color: #ff4d79; text-shadow: 0 0 10px rgba(255, 77, 121, 0.5);
        }

        .btn-love {
            background: linear-gradient(45deg, #ff0040, #ff8a00);
            border: none; padding: 15px 40px; color: white;
            border-radius: 50px; font-weight: bold; cursor: pointer;
            text-decoration: none; display: inline-block; margin-top: 20px;
        }

        /* Rose Petal Style */
        .petal {
            position: absolute; background: #ff4d79;
            border-radius: 150% 0 150% 0; opacity: 0.7;
            z-index: 2; animation: fall linear infinite;
        }
        @keyframes fall {
            0% { transform: translateY(-10vh) rotate(0deg); }
            100% { transform: translateY(110vh) rotate(360deg); }
        }
    </style>
</head>
<body>

    <audio id="mySong" preload="auto">
        <source src="Raataan Lambiyan-320kbps.mp3" type="audio/mp3">
    </audio>

    <div class="light-strip">
        <div class="light" style="animation-delay: 0.1s"></div>
        <div class="light" style="animation-delay: 0.3s"></div>
        <div class="light" style="animation-delay: 0.5s"></div>
        <div class="light" style="animation-delay: 0.2s"></div>
        <div class="light" style="animation-delay: 0.4s"></div>
    </div>

    <div class="heart-box">
        <div class="heart"></div>
    </div>

    <div class="glass-card">
        <h1>Happy Birthday, My Love! ❤️</h1>
        <p>"Aapki smile meri duniya hai. Aaj ke din main bas ye kehna chahta hoon ki aap mere liye bahut special ho."</p>
        
        <a href="second.jsp" class="btn-love" onclick="startMagic()">Chalo Mere Dil Ke Under ✨</a>

        <div style="margin-top: 20px; font-size: 0.8rem; opacity: 0.5;">
            Forever Yours | 
            <% java.util.Date d = new java.util.Date(); out.print(d.toString().substring(4, 10)); %>
        </div>
    </div>

    <script>
        // Rose Petal Generator
        function createPetal() {
            const petal = document.createElement('div');
            petal.className = 'petal';
            petal.style.left = Math.random() * 100 + 'vw';
            const size = (Math.random() * 10 + 10) + 'px';
            petal.style.width = size;
            petal.style.height = size;
            petal.style.animationDuration = (Math.random() * 3 + 5) + 's';
            document.body.appendChild(petal);
            setTimeout(() => { petal.remove(); }, 8000);
        }

        setInterval(createPetal, 300);

        function startMagic() {
            // Music Play
            var song = document.getElementById('mySong');
            song.play();

            // Petal burst
            for(let i=0; i<30; i++) {
                setTimeout(createPetal, i * 50);
            }
        }
    </script>
</body>
</html>



