		var isearch = document.getElementById("search");
		
			/* Add event listeners to the two range filtering inputs */
			isearch.addEventListener("change", function() {
				var vmax = document.getElementById("max");
				var voff = document.getElementById("offset");
				var vser = document.getElementById("search");
				var url = "./index?search=" + vser.value;
				if (vmax)
					url += "&max=" + vmax.value ;
				if (voff)
					url += "&offset=" + voff.value; 
				
				window.location.replace(url);
			});