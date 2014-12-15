<%
    ui.decorateWith("appui", "standardEmrPage")
    ui.includeJavascript("uicommons", "angular.min.js")
    ui.includeJavascript("uicommons", "angular-ui/ui-bootstrap-tpls-0.11.2.min.js")
	ui.includeJavascript("allergyui", "allergy.js")
    ui.includeJavascript("uicommons", "angular-resource.min.js")
    ui.includeJavascript("uicommons", "angular-common.js")
    ui.includeJavascript("uicommons", "ngDialog/ngDialog.js")
    ui.includeJavascript("uicommons", "ngDialog/ngDialog.js")
    ui.includeJavascript("uicommons", "services/conceptSearchService.js")
    ui.includeJavascript("uicommons", "directives/coded-or-free-text-answer.js")
    ui.includeCss("uicommons", "ngDialog/ngDialog.min.css")

    ui.includeCss("allergyui", "allergy.css")
    def isEdit = allergy.id != null;
    def title = isEdit ?
            ui.message("allergyui.editAllergy", ui.format(allergy.allergen.coded ? allergy.allergen.codedAllergen : allergy.allergen)) :
            ui.message("allergyui.addNewAllergy");

    def allergensByType = [
        DRUG: drugAllergens,
        FOOD: foodAllergens,
        ENVIRONMENTAL: environmentalAllergens
    ]
%>
<script type="text/javascript">
    var breadcrumbs = [
        { icon: "icon-home", link: '/' + OPENMRS_CONTEXT_PATH + '/index.htm' },
        { label: "${ ui.format(patient.familyName) }, ${ ui.format(patient.givenName) }" , link: '${ui.pageLink("coreapps", "clinicianfacing/patient", [patientId: patient.id])}'},
        { label: "${ ui.message("allergyui.allergies") }", link: '${ui.pageLink("allergyui", "allergies", [patientId: patient.id])}'},
        { label: "${ ui.escapeJs(title) }" }
    ];
    
    window.messages = window.messages || { };
    
    window.messages['ui.i18n.Concept.name.162298AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA']='${ ui.message('ui.i18n.Concept.name.162298AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA') }';
	window.messages['ui.i18n.Concept.name.162299AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA']='${ ui.message('ui.i18n.Concept.name.162299AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA') }';
	window.messages['ui.i18n.Concept.name.71617AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA']='${ ui.message('ui.i18n.Concept.name.71617AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA') }';
	window.messages['ui.i18n.Concept.name.162301AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA']='${ ui.message('ui.i18n.Concept.name.162301AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA') }';
	window.messages['ui.i18n.Concept.name.162302AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA']='${ ui.message('ui.i18n.Concept.name.162302AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA') }';
	window.messages['ui.i18n.Concept.name.162305AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA']='${ ui.message('ui.i18n.Concept.name.162305AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA') }';
	window.messages['ui.i18n.Concept.name.162306AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA']='${ ui.message('ui.i18n.Concept.name.162306AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA') }';
	window.messages['ui.i18n.Concept.name.162297AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA']='${ ui.message('ui.i18n.Concept.name.162297AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA') }';
	window.messages['ui.i18n.Concept.name.162307AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA']='${ ui.message('ui.i18n.Concept.name.162307AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA') }';
	window.messages['ui.i18n.Concept.name.162170AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA']='${ ui.message('ui.i18n.Concept.name.162170AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA') }';
	window.messages['ui.i18n.Concept.name.5622AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA']='${ ui.message('ui.i18n.Concept.name.5622AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA') }';
	window.messages['ui.i18n.Concept.name.162545AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA']='${ ui.message('ui.i18n.Concept.name.162545AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA') }';
	window.messages['ui.i18n.Concept.name.162171AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA']='${ ui.message('ui.i18n.Concept.name.162171AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA') }';
	window.messages['ui.i18n.Concept.name.162175AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA']='${ ui.message('ui.i18n.Concept.name.162175AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA') }';
	window.messages['ui.i18n.Concept.name.162176AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA']='${ ui.message('ui.i18n.Concept.name.162176AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA') }';
	window.messages['ui.i18n.Concept.name.162548AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA']='${ ui.message('ui.i18n.Concept.name.162548AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA') }';
	window.messages['ui.i18n.Concept.name.162536AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA']='${ ui.message('ui.i18n.Concept.name.162536AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA') }';
	window.messages['ui.i18n.Concept.name.162541AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA']='${ ui.message('ui.i18n.Concept.name.162541AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA') }';
	window.messages['ui.i18n.Concept.name.120148AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA']='${ ui.message('ui.i18n.Concept.name.120148AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA') }';
	window.messages['ui.i18n.Concept.name.139581AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA']='${ ui.message('ui.i18n.Concept.name.139581AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA') }';
	window.messages['ui.i18n.Concept.name.159098AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA']='${ ui.message('ui.i18n.Concept.name.159098AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA') }';
	window.messages['ui.i18n.Concept.name.111061AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA']='${ ui.message('ui.i18n.Concept.name.111061AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA') }';
	window.messages['ui.i18n.Concept.name.117399AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA']='${ ui.message('ui.i18n.Concept.name.117399AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA') }';
	window.messages['ui.i18n.Concept.name.121677AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA']='${ ui.message('ui.i18n.Concept.name.121677AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA') }';
	window.messages['ui.i18n.Concept.name.1067AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA']='${ ui.message('ui.i18n.Concept.name.1067AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA') }';

</script>

${ ui.includeFragment("coreapps", "patientHeader", [ patient: patient ]) }

${ ui.includeFragment("allergyui", "removeAllergyDialog") }

<% ui.includeJavascript("allergyui", "allergies.js") %>

<div id="allergy" ng-app="allergyApp" ng-controller="allergyController" ng-init="severity = ${ allergy?.severity?.id }; allergenType='${allergy.allergen == null ? "DRUG" : allergy.allergen.allergenType}'; otherConceptId=${otherNonCodedConcept.conceptId}">

    <h2 class="inline">${ title }</h2>

    <% if (isEdit) { %>
        <button type="button" class="cancel inline right" onclick="removeAllergy('${ allergy.allergen }', ${ allergy.id})">
             ${ ui.message("allergyui.removeAllergy") }
        </button>
    <% } %>

	<form method="post" id="allergy" action="${ ui.pageLink("allergyui", "allergy", [patientId: patient.id]) }">

        <input type="hidden" name="allergenType" value="{{allergenType}}"/>
        <% if (isEdit) { %>
            <input type="hidden" name="allergyId" value="${allergy.id}" />
        <% } %>

        <% if (!isEdit) { %>
            <div id="allergens">

                <div id="types" class="button-group horizontal">
                    <% allergenTypes.each { category -> %>
                    <label class="button small" ng-model="allergenType" btn-radio="'${ui.format(category)}'" ng-class="{ confirm: allergenType == '${ui.format(category)}' }">
                        ${ category }
                    </label>
                    <% } %>
                </div>

                <% allergensByType.each {
                    def typeName = it.key
                    def allergens = it.value
                %>
                    <ul ng-show="allergenType == '${ typeName }'">
                        <% allergens.each { allergen -> %>
                        <li>
                            <% if (allergen.id == otherNonCodedConcept.id) { %>
                                <input id="allergen-${ typeName }" type="radio" name="codedAllergen" value="${allergen.id}" class="coded_allergens" ng-model="allergen"
                                    ${(allergy.allergen != null && allergen == allergy.allergen.codedAllergen) ? "checked=checked" : ""}/>
                            <% } else { %>
                                <input id="allergen-${allergen.id}" type="radio" name="codedAllergen" value="${allergen.id}" class="coded_allergens" ng-model="allergen"
                                    ${(allergy.allergen != null && allergen == allergy.allergen.codedAllergen) ? "checked=checked" : ""}/>
                            <% } %>
                            <label for="allergen-${allergen.id}" id="allergen-${allergen.id}-label" class="coded_allergens_label" ng-click="otherFieldFocus()">${ui.format(allergen)}</label>

                            <% if (allergen.id == otherNonCodedConcept.id) { %>
                                <% if(typeName == 'DRUG') { %>
                                    <input type="hidden" name="otherCodedAllergen" ng-value="otherCodedAllergen.concept ? 'CONCEPT:'+otherCodedAllergen.concept.uuid : 'NON_CODED:'+otherCodedAllergen.word">
                                    <coded-or-free-text-answer id="${typeName}otherCodedAllergen" concept-classes="8d490dfc-c2cc-11de-8d13-0010c6dffd0f" ng-model="otherCodedAllergen" ng-click="otherFieldFocus()" />
                                <% } else {%>
                            	    <input type="text" maxlength="255" id="${typeName}nonCodedAllergen" name="nonCodedAllergen" ng-model="nonCodedAllergen" ng-focus="otherFieldFocus()"/>
                                <% } %>
                            <% } %>
                        </li>
                        <% } %>
                    </ul>
                <% } %>
            </div>
        <% } %>

        <div id="reactions">
            <label class="heading">${ ui.message("allergyui.reactionSelection") }:</label>
            <ul>
            <% reactionConcepts.each { reaction -> %>
                <li>
                    <input ng-model="reaction${reaction.id}" type="checkbox" id="reaction-${reaction.id}" class="allergy-reaction" name="allergyReactionConcepts" value="${reaction.id}" ng-init="reaction${reaction.id} = ${ allergyReactionConcepts.contains(reaction) }" />
                    <label for="reaction-${reaction.id}">${ui.format(reaction)}</label>
                    <% if (reaction.id == otherNonCodedConcept.id) { %>
                    	<input type="text" maxlength="255" name="reactionNonCoded" ng-focus="otherReactionFocus(${reaction.id})" <% if (allergy.reactionNonCoded) { %> value="${allergy.reactionNonCoded}" <% } %>/>
                    <% } %>
                </li>
            <% } %>
            </ul>
        </div>

	    <div id="severities" class="horizontal">
	        <label class="heading">${ ui.message("allergyui.severity") }:</label>
	        <% severities.each { severity -> %>
	            <p>
                    <input type="radio" id="severity-${severity.id}" class="allergy-severity" name="severity" value="${severity.id}" ${ severity == allergy.severity ? "checked=checked" : "" } ng-checked="severity == ${severity.id}" ng-model="severity"/>
                    <label for="severity-${severity.id}">${ui.format(severity)}</label>
                </p>
	        <% } %>
	        <i class="icon-remove delete-item" title="${ ui.message("general.clear") }" ng-click="severity = null"></i>
	    </div>

	    <div id="comment">
	        <label>${ ui.message("allergyui.comment") }:</label>
	        <textarea id="allergy-comment" maxlength="1024" name="comment">${allergy.comment != null ? allergy.comment : ""}</textarea>
	    </div>

	    <div id="actions">
	        <input type="submit" id="addAllergyBtn" class="confirm right" value="${ ui.message("coreapps.save") }" <% if(!isEdit){ %> ng-disabled="!canSave()" <% } %>/>
	        <input type="button" class="cancel" value="${ ui.message("coreapps.cancel") }"
	         onclick="location.href='${ ui.pageLink("allergyui", "allergies", [patientId: patient.id]) }'" />
	    </div>
	</form>
</div>
