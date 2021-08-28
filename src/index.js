const ARTICLES = [
	{title:"Title",inspire: "iNSPIREHEP"},
	{title: "Hydrodynamics Of Simply Spinning Black Holes & Hydrodynamics For Spinning Quantum Fluids", inspire: "1806001"},
	{title: "Resonating AdS Soliton", inspire: "1802541"},
	{title: "Dispersion relations In Non-relativistic Two-dimensional Materials From Quasinormal Modes In Hǒrava Gravity", inspire: "1737421"}
]

function make_articles_table() {
	let elem = document.getElementById("articles");
	let table = document.createElement("TABLE");
	table.className = "w3-table-all w3-striped w3-centered w3-hoverable";
	let header = table.createTHead();
	
	for (let i = 1; i<ARTICLES.length; i++) {
		let title = ARTICLES[i].title;
		let inspire = ARTICLES[i].inspire;

		let row = header.insertRow(-1);
		row.className = "w3-hover-light-green"
		let cell = row.insertCell(-1);
		let link = document.createElement('a');
		link.href = "https://inspirehep.net/literature/" + inspire;
		link.text = title;
		cell.appendChild(link);
	}

	elem.appendChild(table)
}

make_articles_table()
