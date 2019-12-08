Feature: Configure the Octopus creds
   Scenario: Configure credentials
     Given I set the following aliases:
       | Manage Jenkins          | //a[@class='task-link' and contains(.,'Manage Jenkins')]               |
       | Configure Credentials   | //a[@href='configureCredentials']                                      |
       | Credentials             | //a[@href='/credentials'][contains(.,'Credentials')]                   |
       | System                  | //a[@href='/credentials/store/system'][contains(.,'System')]           |
       | Global credentials      | //a[@href='domain/_'][contains(.,'Global credentials (unrestricted)')] |
       | Global credentials cell | .sortable > tbody:nth-child(1) > tr:nth-child(2) > td:nth-child(2)     |
       | Add Credentials         | //a[@href='newCredentials'][contains(.,'Add Credentials')]             |
       | Kind                    | //select[@class='setting-input dropdownList']                          |
       | Secret                  | //input[@name='_.secret']                                              |
       | ID                      | (//input[@name='_.id'])[2]                                             |
       | Description             | (//input[contains(@name,'_.description')])[2]                          |
       | OK                      | //button[@type='button'][contains(.,'OK')]                             |

     And I open the URL "http://localhost:8080/"
     And I clear the transition

     And I display a note with the text "Adding the Octopus API key as a Jenkins secret" for "3" seconds

     And I highlight inside the "Manage Jenkins" text box
     And I save a screenshot to "#{ExternalMediaPath}/jenkins/initialproject/#{GuideSpecificScreenshotDir}023-manage-jenkins.png"
     And I click the "Manage Jenkins" link

     And I scroll the "Configure Credentials" link into view offset by "-100"
       # Give the top toolbar a change to realign itself
     And I wait for "1" seconds
     And I highlight outside the "Configure Credentials" link
     And I save a screenshot to "#{ExternalMediaPath}/jenkins/initialproject/#{GuideSpecificScreenshotDir}040-configure-credentials.png"
     And I click the "Configure Credentials" link

     And I highlight inside the "Credentials" link
     And I save a screenshot to "#{ExternalMediaPath}/jenkins/initialproject/#{GuideSpecificScreenshotDir}045-credentials-parent.png"
     And I click the "Credentials" link

     And I highlight inside the "System" link
     And I save a screenshot to "#{ExternalMediaPath}/jenkins/initialproject/#{GuideSpecificScreenshotDir}050-credentials-system.png"
     And I click the "System" link

     And I highlight outside the "Global credentials cell" link
     And I save a screenshot to "#{ExternalMediaPath}/jenkins/initialproject/#{GuideSpecificScreenshotDir}055-global-credentials.png"
     And I click the "Global credentials" link

     And I highlight inside the "Add Credentials" link
     And I save a screenshot to "#{ExternalMediaPath}/jenkins/initialproject/#{GuideSpecificScreenshotDir}060-add-credentials.png"
     And I click the "Add Credentials" link

     And I highlight outside the "Kind" drop down list
     And I select the option "Secret text" from the "Kind" drop down list

     And I highlight outside the "Secret" text box with an offset of "0"
     And I highlight outside the "ID" text box with an offset of "0"
     And I highlight outside the "Description" text box with an offset of "0"
     And I highlight outside the "OK" button

     And I populate the "Secret" text box with "ExternalOctopusAPIKey"
     And I populate the "ID" text box with "OctopusAPIKey"
     And I populate the "Description" text box with "The Octopus API Key"
     And I save a screenshot to "#{ExternalMediaPath}/jenkins/initialproject/#{GuideSpecificScreenshotDir}065-octopus-credentials.png"
     And I click the "OK" button

     Then I fade the screen to "1" "1" "1" over "3000" milliseconds