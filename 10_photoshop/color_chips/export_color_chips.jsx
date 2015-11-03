// in case we double clicked the file
app.bringToFront();

//rgb rgb id

var color_data = [
    ["A80532", "ffffff", 1],  
    ["CD1041", "231F20", 2],  
    ["172240", "FE3300", 3],  
    ["2139CE", "FF4208", 4],  
    ["A0000B", "000000", 5],  
    ["003399", "FFFFFF", 6],  
    ["33297B", "FDB827", 7],  
    ["002C91", "FF002C", 8],  
    ["762123", "D1D5D8", 9],  
    ["231F20", "E8AF11", 10]
];



for(var i = 0; i < color_data.length; i++)
{
    for( var j = 0; j < app.activeDocument.layers.length; j++ )
    {
        app.activeDocument.activeLayer = app.activeDocument.layers[j];
        
        if(app.activeDocument.activeLayer.name == "front")
        {
            var color = new SolidColor();
            color.rgb.hexValue=color_data[i][0];
            setColorOfFillLayer(color);
        }else if(app.activeDocument.activeLayer.name == "back"){
            var color = new SolidColor();
            color.rgb.hexValue=color_data[i][1];         
            setColorOfFillLayer(color);            
        }
    }
    
    saveImage(color_data[i][2]);
}


function saveImage(id)
{
	var document_name = app.activeDocument.name.replace(/\.[^\.]+$/, ''); 
	var extension = decodeURI(app.activeDocument.name).replace(/^.*\./,''); 
	// if(extension.toLowerCase() != 'psd') return; 
	
	var path = app.activeDocument.path; 
	var short_name = app.activeDocument.name.split(".")[0];
	var saveFile = File(path + "/chip_" + id ); 
	if(saveFile.exists) saveFile.remove(); 
	savePNG(saveFile); 
}

function savePNG(saveFile){ 
    pngSaveOptions = new PNGSaveOptions(); 
	activeDocument.saveAs(saveFile, pngSaveOptions, true, Extension.LOWERCASE); 
}

function setColorOfFillLayer( sColor ) 
{
    var desc = new ActionDescriptor();
        var ref = new ActionReference();
        ref.putEnumerated( stringIDToTypeID('contentLayer'), charIDToTypeID('Ordn'), charIDToTypeID('Trgt') );
    desc.putReference( charIDToTypeID('null'), ref );
        var fillDesc = new ActionDescriptor();
            var colorDesc = new ActionDescriptor();
            colorDesc.putDouble( charIDToTypeID('Rd  '), sColor.rgb.red );
            colorDesc.putDouble( charIDToTypeID('Grn '), sColor.rgb.green );
            colorDesc.putDouble( charIDToTypeID('Bl  '), sColor.rgb.blue );
        fillDesc.putObject( charIDToTypeID('Clr '), charIDToTypeID('RGBC'), colorDesc );
    desc.putObject( charIDToTypeID('T   '), stringIDToTypeID('solidColorLayer'), fillDesc );
    executeAction( charIDToTypeID('setd'), desc, DialogModes.NO );
}
