GUIAction = {
    closeGui () {
        $("#card").children().css("display", "none");
    },
    openGuiIdentity (pType, data) {
        data = data || "{}";
        data = JSON.parse(data);
        let currentDiv = pType ? $("#" + pType) : null;
		
        if (currentDiv != null) {
            switch (pType) {
                case "identity":
                    if (data.sex == "H" || data.sex == "h"){
                        currentDiv.toggleClass( "sex_H", true)
						currentDiv.toggleClass( "sex_F", false)
		                data.sex = "Homme"
        			} else {
                        currentDiv.toggleClass( "sex_F", true)
						currentDiv.toggleClass( "sex_H", false)
                        data.sex = "Femme"
					}
                    break;


                    case "identity":
                    if (data.licenceType == null) {
						data.licenceType = 'auto';
						currentDiv.toggleClass("driver_" + data.licenceType);
					}
					else {
						currentDiv.toggleClass("driver_" + data.licenceType);
					}
                    break;
                    
                    
                case "job":
                    if (data.job_name == null) {
						currentDiv.toggleClass("job_unemployed");
					}
					else {
						currentDiv.toggleClass("job_" + data.job_name);
					}
                    break;
                    
                case "weaponlicence":
                    break;
                    
                case "driverlicence":
                    if (data.licenceType == null) {
						data.licenceType = 'auto';
						currentDiv.toggleClass("driver_" + data.licenceType);
					}
					else {
						currentDiv.toggleClass("driver_" + data.licenceType);
					}
                    break;
            }

            for (var property in data) {
                if (data.hasOwnProperty(property)) {
                    var jQueryElem = $('#' + pType).find("#" + property);

                    if (jQueryElem != null) {
                        jQueryElem.text(data[property] || '');
                    }
                }
            }

            currentDiv.css("display", "block");
        }
    }
}

var isReady = false;

window.addEventListener('message', function (event){
    let method = event.data.method
    if (GUIAction[method] !== undefined) {
        GUIAction[method](event.data.pType, event.data.data)
    }
})

$("#card").children().css("display", "none");

//var identity_card = {
//    "firstname": "John",
//    "lastname": "Doe",
//    "birthday": "XX/XX/XXXX",
//    "sex": "F",
//    "height": "XXX",
//}
//
//
//var job_card = {
//    "firstname": "John",
//    "lastname": "Doe",
//    "job_name": "party",
//    "job_grade": "Patron"
//}
//
//
//var weaponlicence_card = {
//    "firstname": "John",
//    "lastname": "Doe",
//    "birthday": "XX/XX/XXXX",
//    "sex": "F"
//}
//
//
//var driverlicence_card = {
//    "firstname": "John",
//    "lastname": "Doe",
//    "birthday": "XX/XX/XXXX",
//    "sex": "M"
//}
//
//
//var licences = ['identity', 'job', 'weaponlicence', 'driverlicence'];
//var data = [JSON.stringify(identity_card), JSON.stringify(job_card), JSON.stringify(weaponlicence_card), JSON.stringify(driverlicence_card)];

//GUIAction.openGuiIdentity(licences[0], data[0]);
//GUIAction.openGuiIdentity(licences[1], data[1]);
//GUIAction.openGuiIdentity(licences[2], data[2]);
//GUIAction.openGuiIdentity(licences[3], data[3]);
