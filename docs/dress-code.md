---
title: "Dress code"
permalink: /dress-code/
subtitle: "Como venir vestidos"
---

El dress-code no deja lugar a la sorpresa. Vestimenta tipo bodas, ni más ni menos. 
La pamela esta permitida, los tocados también. Los chalecos por supuesto, corbatas incluso las sugerimos! pajarita si te atreves, tacones siempre que te permitan dar el foie en la pista (o que traigas zapato cómodo). 

Creo que lo sabéis todo pero para despistados, el blanco o similares esta prohibido! Tenemos contratado a personal que disparará con temperas de colores a cualquier persona que vaya vestida de ese color. 
A continuación, os dejamos un sencillo juego para que podáis comprobar si el color es apropiado. 

<div class="dress-checker" id="dress-checker">
	<p><strong>Mezcla tu color</strong> moviendo los canales RGB y comprueba si pasa el dress code</p>

	<div class="rgb-mixer">
		<div class="rgb-preview" id="rgb-preview"></div>

		<div class="rgb-sliders">
			<div class="rgb-row">
				<label for="slider-r">R</label>
				<input type="range" id="slider-r" min="0" max="255" value="128" />
				<span class="rgb-value" id="val-r">128</span>
			</div>
			<div class="rgb-row">
				<label for="slider-g">G</label>
				<input type="range" id="slider-g" min="0" max="255" value="128" />
				<span class="rgb-value" id="val-g">128</span>
			</div>
			<div class="rgb-row">
				<label for="slider-b">B</label>
				<input type="range" id="slider-b" min="0" max="255" value="128" />
				<span class="rgb-value" id="val-b">128</span>
			</div>
		</div>

		<p class="rgb-hex-label">HEX: <code id="rgb-hex">#808080</code></p>
	</div>

	<button id="color-check-btn" type="button" class="check-btn">Comprobar color</button>

	<p id="dress-checker-status" class="dress-checker-status" aria-live="polite"></p>

	<figure class="dress-checker-result">
		<img id="dress-checker-image" src="/assets/images/beacontentan.jpg" alt="Resultado del color elegido" />
	</figure>
</div>

<style>
	.dress-checker {
		margin-top: 1.2rem;
		padding: 1.2rem;
		border: 1px solid #cad8bc;
		border-radius: 12px;
		background: #fffdf8;
	}

	.rgb-mixer {
		display: flex;
		flex-wrap: wrap;
		gap: 1rem;
		align-items: center;
		margin-top: 0.8rem;
	}

	.rgb-preview {
		width: 90px;
		height: 90px;
		border-radius: 10px;
		border: 2px solid #c8d6bc;
		background: rgb(128, 128, 128);
		flex-shrink: 0;
	}

	.rgb-sliders {
		flex: 1 1 220px;
		display: flex;
		flex-direction: column;
		gap: 0.55rem;
	}

	.rgb-row {
		display: flex;
		align-items: center;
		gap: 0.6rem;
	}

	.rgb-row label {
		width: 1rem;
		font-weight: 700;
		font-size: 0.9rem;
		color: #333;
	}

	.rgb-row input[type="range"] {
		flex: 1;
		height: 6px;
		cursor: pointer;
		accent-color: #4a6a31;
	}

	.rgb-value {
		width: 2.2rem;
		text-align: right;
		font-size: 0.85rem;
		font-family: monospace;
		color: #444;
	}

	.rgb-hex-label {
		width: 100%;
		margin: 0.3rem 0 0;
		font-size: 0.85rem;
		color: #555;
	}

	.check-btn {
		margin-top: 0.9rem;
		min-height: 40px;
		padding: 0.55rem 1.4rem;
		border: 1px solid #4a6a31;
		border-radius: 10px;
		background: #4a6a31;
		color: #fff;
		font: inherit;
		font-weight: 700;
		cursor: pointer;
	}

	.check-btn:hover {
		background: #3a5427;
	}

	.dress-checker-status {
		margin: 0.8rem 0 0.4rem;
		font-weight: 700;
	}

	.dress-checker-result {
		margin: 0;
	}

	.dress-checker-result img {
		display: block;
		width: 100%;
		max-width: 360px;
		border-radius: 10px;
		border: 1px solid #d7e2cc;
	}
</style>

<script>
	(function () {
		var sliderR = document.getElementById("slider-r");
		var sliderG = document.getElementById("slider-g");
		var sliderB = document.getElementById("slider-b");
		var valR    = document.getElementById("val-r");
		var valG    = document.getElementById("val-g");
		var valB    = document.getElementById("val-b");
		var preview = document.getElementById("rgb-preview");
		var hexLabel = document.getElementById("rgb-hex");
		var button  = document.getElementById("color-check-btn");
		var status  = document.getElementById("dress-checker-status");
		var image   = document.getElementById("dress-checker-image");

		if (!sliderR || !sliderG || !sliderB || !button || !status || !image) return;

		function toHex(n) {
			return ("0" + parseInt(n).toString(16)).slice(-2);
		}

		function updatePreview() {
			var r = sliderR.value;
			var g = sliderG.value;
			var b = sliderB.value;
			valR.textContent = r;
			valG.textContent = g;
			valB.textContent = b;
			preview.style.background = "rgb(" + r + "," + g + "," + b + ")";
			hexLabel.textContent = "#" + toHex(r) + toHex(g) + toHex(b);
		}

		var WHITE_THRESHOLD = 245;

		sliderR.addEventListener("input", updatePreview);
		sliderG.addEventListener("input", updatePreview);
		sliderB.addEventListener("input", updatePreview);

		button.addEventListener("click", function () {
			var r = parseInt(sliderR.value);
			var g = parseInt(sliderG.value);
			var b = parseInt(sliderB.value);
			var hex = "#" + toHex(r) + toHex(g) + toHex(b);
			var avg = (r + g + b) / 3;
			var isTooCloseToWhite = avg > WHITE_THRESHOLD;

			if (isTooCloseToWhite) {
				status.textContent = "Ese color (" + hex.toUpperCase() + ") esta demasiado cerca del blanco. Mejor elige otro.";
				image.src = "/assets/images/Enfadada.jpg";
			} else {
				status.textContent = "Perfecto, " + hex.toUpperCase() + " pasa el control de dress code.";
				image.src = "/assets/images/beacontentan.jpg";
			}
		});

		updatePreview();
	})();
</script>

