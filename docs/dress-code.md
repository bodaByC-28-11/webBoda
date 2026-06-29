---
title: "Dress code"
permalink: /dress-code/
subtitle: "Como venir vestidos"
---

El dress-code no deja lugar a la sorpresa. Vestimenta tipo bodas, ni más ni menos.

Prendas permitidas: pamelas, tocados, chalecos (por supuesto), corbatas (incluso las sugerimos) y pajaritas si te atreves. Los tacones son bienvenidos, siempre que te permitan bailar en la pista.

Creo que lo sabéis todo pero para despistados: ¡el blanco o similares está prohibido! Tenemos contratado a personal que disparará con temperas de colores a cualquier persona que vaya vestida de ese color. 
A continuación, os dejamos un sencillo juego para que podáis comprobar si el color es apropiado. 

<div class="dress-checker" id="dress-checker">
	<p><strong>Elige tu color</strong> en el catálogo y comprueba si pasa el dress code</p>

	<div class="rgb-mixer">
		<div class="rgb-preview" id="rgb-preview"></div>

		<div class="rgb-sliders">
			<div class="rgb-row">
				<label for="palette-toggle">Catálogo</label>
				<div class="palette-dropdown">
					<button id="palette-toggle" class="palette-toggle" type="button" aria-expanded="false" aria-controls="palette-menu">
						<span class="palette-swatch" id="palette-swatch" aria-hidden="true"></span>
						<span class="palette-label" id="palette-label">Oliva base</span>
						<span class="palette-caret" aria-hidden="true">▾</span>
					</button>
					<div class="palette-menu" id="palette-menu" role="listbox" hidden></div>
				</div>
			</div>
		</div>

		<p class="rgb-hex-label">HEX: <code id="rgb-hex">#808080</code></p>
	</div>

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
		width: 4.2rem;
		font-weight: 700;
		font-size: 0.9rem;
		color: #333;
	}

	.rgb-row select {
		flex: 1;
		min-height: 40px;
		padding: 0.45rem 0.75rem;
		border: 1px solid #c8d6bc;
		border-radius: 10px;
		background: #fff;
		font: inherit;
		color: #2f3525;
		cursor: pointer;
	}

	.rgb-row select:focus {
		outline: 2px solid rgba(74, 106, 49, 0.25);
		outline-offset: 1px;
	}

	.palette-dropdown {
		flex: 1;
		position: relative;
	}

	.palette-toggle {
		width: 100%;
		min-height: 44px;
		display: flex;
		align-items: center;
		gap: 0.7rem;
		padding: 0.45rem 0.7rem;
		border: 1px solid #c8d6bc;
		border-radius: 10px;
		background: #fff;
		font: inherit;
		color: #2f3525;
		cursor: pointer;
	}

	.palette-toggle:focus {
		outline: 2px solid rgba(74, 106, 49, 0.25);
		outline-offset: 1px;
	}

	.palette-swatch {
		width: 1.4rem;
		height: 1.4rem;
		border-radius: 999px;
		border: 1px solid rgba(0, 0, 0, 0.12);
		flex-shrink: 0;
		background: #8a6b2f;
		box-shadow: inset 0 0 0 1px rgba(255, 255, 255, 0.18);
	}

	.palette-label {
		flex: 1;
		text-align: left;
	}

	.palette-caret {
		color: #60764a;
		font-size: 0.9rem;
	}

	.palette-menu {
		position: absolute;
		z-index: 3;
		left: 0;
		right: 0;
		top: calc(100% + 0.35rem);
		max-height: 280px;
		overflow: auto;
		padding: 0.45rem;
		border: 1px solid #c8d6bc;
		border-radius: 12px;
		background: #fffdf8;
		box-shadow: 0 12px 28px rgba(82, 53, 37, 0.14);
	}

	.palette-option {
		width: 100%;
		display: flex;
		align-items: center;
		gap: 0.7rem;
		padding: 0.5rem 0.6rem;
		border: 0;
		border-radius: 10px;
		background: transparent;
		font: inherit;
		color: #2f3525;
		cursor: pointer;
		text-align: left;
	}

	.palette-option:hover,
	.palette-option[aria-selected="true"] {
		background: rgba(74, 106, 49, 0.08);
	}

	.palette-option-swatch {
		width: 1.15rem;
		height: 1.15rem;
		border-radius: 999px;
		border: 1px solid rgba(0, 0, 0, 0.12);
		flex-shrink: 0;
	}

	.rgb-hex-label {
		width: 100%;
		margin: 0.3rem 0 0;
		font-size: 0.85rem;
		color: #555;
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
		var paletteToggle = document.getElementById("palette-toggle");
		var paletteMenu = document.getElementById("palette-menu");
		var paletteSwatch = document.getElementById("palette-swatch");
		var paletteLabel = document.getElementById("palette-label");
		var preview = document.getElementById("rgb-preview");
		var hexLabel = document.getElementById("rgb-hex");
		var status  = document.getElementById("dress-checker-status");
		var image   = document.getElementById("dress-checker-image");

		if (!paletteToggle || !paletteMenu || !paletteSwatch || !paletteLabel || !status || !image) return;

		var palette = {
			olive: { label: "Oliva", rgb: [84, 107, 47] },
			terracotta: { label: "Terracota", rgb: [163, 96, 62] },
			navy: { label: "Azul noche", rgb: [47, 63, 96] },
			burgundy: { label: "Burdeos", rgb: [118, 54, 66] },
			emerald: { label: "Esmeralda", rgb: [52, 104, 75] },
			mustard: { label: "Mostaza", rgb: [176, 134, 49] },
			rose: { label: "Rosa empolvado", rgb: [183, 140, 135] },
			sand: { label: "Arena", rgb: [183, 160, 126] }
		};

		var variants = {
			0: { mix: [0, 0, 0], amount: 0.48, label: "Muy oscuro" },
			1: { mix: [0, 0, 0], amount: 0.28, label: "Oscuro" },
			2: { mix: [0, 0, 0], amount: 0.12, label: "Medio oscuro" },
			3: { mix: [255, 255, 255], amount: 0, label: "Base" },
			4: { mix: [255, 255, 255], amount: 0.18, label: "Claro" },
			5: { mix: [255, 255, 255], amount: 0.36, label: "Muy claro" },
			6: { mix: [255, 255, 255], amount: 0.78, label: "Casi blanco" },
			7: { mix: [255, 255, 255], amount: 0.9, label: "Marfil" }
		};

		function clamp(value) {
			return Math.max(0, Math.min(255, value));
		}

		function toHex(n) {
			return ("0" + clamp(Math.round(n)).toString(16)).slice(-2);
		}

		function blend(base, target, amount) {
			return [
				Math.round(base[0] + (target[0] - base[0]) * amount),
				Math.round(base[1] + (target[1] - base[1]) * amount),
				Math.round(base[2] + (target[2] - base[2]) * amount)
			];
		}

		var options = [];
		var currentKey = "olive-3";

		function getSelectedColor() {
			var parts = (currentKey || "olive-3").split("-");
			var familyKey = parts[0];
			var variantKey = parseInt(parts[1], 10);
			var selectedFamily = palette[familyKey] || palette.olive;
			var selectedVariant = variants[variantKey] || variants[3];
			var rgb = blend(selectedFamily.rgb, selectedVariant.mix, selectedVariant.amount);

			return {
				family: selectedFamily,
				variantKey: variantKey,
				variant: selectedVariant,
				rgb: rgb
			};
		}

		function buildOptions() {
			var familyOrder = ["olive", "terracotta", "navy", "burgundy", "emerald", "mustard", "rose", "sand"];
			var variantOrder = [0, 1, 2, 3, 4, 5, 6, 7];
			var labels = {
				0: "muy oscuro",
				1: "oscuro",
				2: "medio oscuro",
				3: "base",
				4: "claro",
				5: "muy claro",
				6: "casi blanco",
				7: "marfil"
			};

			paletteMenu.innerHTML = "";
			options = [];

			familyOrder.forEach(function (familyKey) {
				var family = palette[familyKey];
				var variantBase = family.rgb;

				variantOrder.forEach(function (variantKey) {
					var variant = variants[variantKey];
					var rgb = blend(variantBase, variant.mix, variant.amount);
					var key = familyKey + "-" + variantKey;
					var option = document.createElement("button");
					option.type = "button";
					option.className = "palette-option";
					option.setAttribute("role", "option");
					option.setAttribute("data-key", key);
					option.setAttribute("aria-selected", key === currentKey ? "true" : "false");
					option.innerHTML = '<span class="palette-option-swatch" aria-hidden="true"></span><span>' + family.label + " " + labels[variantKey] + "</span>";
					option.querySelector(".palette-option-swatch").style.background = "rgb(" + rgb[0] + "," + rgb[1] + "," + rgb[2] + ")";

					option.addEventListener("click", function () {
						currentKey = key;
						updatePreview();
						checkSelection();
						closeMenu();
					});

					paletteMenu.appendChild(option);
					options.push({ key: key, element: option, family: family, variant: variant, rgb: rgb });
				});
			});
		}

		function syncSelectedOption() {
			var selected = getSelectedColor();
			var hex = "#" + toHex(selected.rgb[0]) + toHex(selected.rgb[1]) + toHex(selected.rgb[2]);
			paletteToggle.setAttribute("aria-expanded", "false");
			paletteSwatch.style.background = "rgb(" + selected.rgb[0] + "," + selected.rgb[1] + "," + selected.rgb[2] + ")";
			paletteLabel.textContent = selected.family.label + " " + selected.variant.label;
			hexLabel.textContent = hex + " · " + selected.family.label + " / " + selected.variant.label;
			options.forEach(function (item) {
				item.element.setAttribute("aria-selected", item.key === currentKey ? "true" : "false");
			});
		}

		function openMenu() {
			paletteMenu.hidden = false;
			paletteToggle.setAttribute("aria-expanded", "true");
		}

		function closeMenu() {
			paletteMenu.hidden = true;
			paletteToggle.setAttribute("aria-expanded", "false");
		}

		function toggleMenu() {
			if (paletteMenu.hidden) {
				openMenu();
			} else {
				closeMenu();
			}
		}

		function updatePreview() {
			var selected = getSelectedColor();
			var r = selected.rgb[0];
			var g = selected.rgb[1];
			var b = selected.rgb[2];
			preview.style.background = "rgb(" + r + "," + g + "," + b + ")";
			syncSelectedOption();
		}

		var WHITE_THRESHOLD = 238;

		function checkSelection() {
			var selected = getSelectedColor();
			var r = selected.rgb[0];
			var g = selected.rgb[1];
			var b = selected.rgb[2];
			var avg = (r + g + b) / 3;
			var isTooCloseToWhite = avg > WHITE_THRESHOLD || selected.variantKey >= 6;
			var colorName = selected.family.label + " " + selected.variant.label;

			if (isTooCloseToWhite) {
				status.textContent = "Ese tono (" + colorName + ") está demasiado cerca del blanco. Mejor elige una opción más oscura.";
				image.src = "/assets/images/Enfadada.jpg";
			} else {
				status.textContent = "Perfecto, " + colorName + " pasa el control de dress code.";
				image.src = "/assets/images/beacontentan.jpg";
			}
		}

		buildOptions();
		updatePreview();

		paletteToggle.addEventListener("click", function () {
			toggleMenu();
		});

		document.addEventListener("click", function (event) {
			if (!paletteToggle.contains(event.target) && !paletteMenu.contains(event.target)) {
				closeMenu();
			}
		});

		document.addEventListener("keydown", function (event) {
			if (event.key === "Escape") closeMenu();
		});

		checkSelection();
	})();
</script>
