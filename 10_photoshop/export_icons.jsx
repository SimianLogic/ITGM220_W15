function saveImage(size)
{
	var document_name = app.activeDocument.name.replace(/\.[^\.]+$/, ''); 
	var extension = decodeURI(app.activeDocument.name).replace(/^.*\./,''); 
	// if(extension.toLowerCase() != 'psd') return; 
	
	var path = app.activeDocument.path; 
	var short_name = app.activeDocument.name.split(".")[0];
	var saveFile = File(path + "/" + short_name + "_" + size ); 
	if(saveFile.exists) saveFile.remove(); 
	savePNG(saveFile); 
}

function savePNG(saveFile){ 
    pngSaveOptions = new PNGSaveOptions(); 
	activeDocument.saveAs(saveFile, pngSaveOptions, true, Extension.LOWERCASE); 
}

function main()
{
	var docRef = app.activeDocument
	var goodState = docRef.activeHistoryState;
	app.preferences.rulerUnits = Units.PIXELS;
	
	var icon_sizes = [1024,512,256,152,144,128,120,114,96,76,72,57,48,36];
	for(var i=0; i < icon_sizes.length; i++)
	{
	    var resize = app.activeDocument.resizeImage(icon_sizes[i],icon_sizes[i]);
		saveImage(icon_sizes[i]);
		//undo after each one or we get multiplicity-style copy-of-a-copy-of-a-copy
		docRef.activeHistoryState = goodState;
	}
	
	alert("Process complete");
}

main();


