Feature: Configure an Octopus Ruby project

  Scenario: Open Browser
    Given I run the feature "shared/octopus-open-browser.feature" passing the original arguments
    And I run the feature "shared/octopus-login.feature" passing the original arguments
    And I run the feature "shared/octopus-hide-wizard.feature" passing the original arguments

  Scenario: Display banner
    And I start recording the screen to the directory "ExternalMediaPath"
    And I display a note with the text "Creating the Nginx deployment project in Octopus" for "3" seconds

  Scenario:
    And I run the feature "shared/octopus-create-project.feature" passing the original arguments
    And I run the feature "shared/octopus-define-variables.feature" passing the original arguments

  @define-project @destinationspecific @nginx
  Scenario: Define node ports
    Given I set the following aliases:
      | Define scope            | //div[@title='Define scope']                       |
      | Select environments     | //input[../../label[text()='Select environments']] |
      | Dev environment         | //span[./div/div/div[text()='Dev']]                |
      | Test environment        | //span[./div/div/div[text()='Test']]               |
      | Prod environment        | //span[./div/div/div[text()='Prod']]               |
      | Add Another Value       | //button[.//span[text() = 'Add Another Value']]    |
      | Project Variables Title | //h2[contains(.,'Project Variables')]              |
      | New variable name       | //input[@name='Enter new variable']                |
      | New variable value      | //input[@name='Enter value']                       |
      | New variable value 2    | (//input[@name='Enter value'])[2]                  |
      | New variable value 3    | (//input[@name='Enter value'])[3]                  |
      | Add to list             | //button[@title='Add To List']                     |
      | Save                    | //button[contains(.,'Save')]                       |

    And I populate the "New variable name" text box with "Nginx Port"
    And I populate the "New variable value" text box with "8081"
    And I force click the "Define scope" field
    And I force click the "Select environments" field
    And I force click the "Dev environment" option
    And I force click the "Project Variables Title" element

    And I click the "Add Another Value" button
    And I populate the "New variable value 2" text box with "8082"
    And I force click the "Define scope" field
    And I force click the "Select environments" field
    And I force click the "Test environment" option
    And I force click the "Project Variables Title" element

    And I click the "Add Another Value" button
    And I populate the "New variable value 3" text box with "8083"
    And I force click the "Define scope" field
    And I force click the "Select environments" field
    And I force click the "Prod environment" option
    And I force click the "Project Variables Title" element

    And I click the "Add to list" button

    And I click the "Save" button
    And I scroll down "10000" px

    And I sleep for "1" second
    And I stop recording the screen
    And I sleep for "120" seconds

    And I save a screenshot to "#{ExternalMediaPath}/octopus/project/#{GuideSpecificScreenshotDir}030-octopus-variables-populated.png"

  @define-project
  Scenario: Open the deployments view
    Given I set the following aliases:
      | Overview    | //a[contains(.,'Overview')][not(*)] \| //a//div[text()='Overview'] |
      | Deployments | //a[contains(.,'Deployments')]                                     |

    And I start recording the screen to the directory "#{ExternalMediaPath}"

    And I highlight inside the "Deployments" link
    And I click the "Deployments" link
    And I highlight inside the "Overview" link
    And I click the "Overview" link

  @define-project @destinationspecific @nginx
  Scenario: Add K8S Containers Step
    Given I set the following aliases:
      | Define your deployment process | //button[contains(.,'Define your deployment process')]                |
      | Add Step                       | //button[contains(.,'Add Step')]                                      |
      | Search                         | //input[@name='Filter by name, category or description...']           |
      | Deploy to Nginx                | //div[./div/div[text()='Deploy to NGINX']]                            |
      | Add                            | //div[./div/div[text()='Deploy to NGINX']]//button[contains(.,'Add')] |

    And I highlight outside the "Define your deployment process" button with an offset of "2"
    And I sleep for "1" second
    And I save a screenshot to "#{ExternalMediaPath}/octopus/project/#{GuideSpecificScreenshotDir}040-octopus-define-process.png"
    And I remove the highlight from the "Deployments" link
    And I remove the highlight from the "Overview" link

    And I click the "Define your deployment process" button
    And I sleep for "1" second

    And I highlight outside the "Add Step" button with an offset of "2"
    And I sleep for "1" second
    And I save a screenshot to "#{ExternalMediaPath}/octopus/project/#{GuideSpecificScreenshotDir}050-octopus-add-step.png"
    And I click the "Add Step" button

    And I highlight outside the "Search" text box with an offset of "3"
    And I populate the "Search" text box with "Nginx"
    And I sleep for "1" second
    And I save a screenshot to "#{ExternalMediaPath}/octopus/project/#{GuideSpecificScreenshotDir}060-octopus-search.png"
    And I sleep for "2" seconds
    And I remove the highlight from the "Search" text box

    And I scroll the "Deploy to Nginx" tile into view offset by "-200"
    And I highlight outside the "Deploy to Nginx" tile
    And I mouse over the "Deploy to Nginx" tile
    And I save a screenshot to "#{ExternalMediaPath}/octopus/project/#{GuideSpecificScreenshotDir}070-octopus-add-containers.png"
    And I force click the "Add" button

  @define-project @destinationspecific @nginx
  Scenario: ASP.NET Core Configure Features
  Enable the Custom deployment scripts to allow a Systemd service to be created

    Given I set the following aliases:
      | Configure features                  | (//button[contains(.,'Configure features')])[1]               |
      | Custom Deployment Scripts           | //input[..//label[text()='Custom Deployment Scripts']]        |
      | Custom Deployment Scripts Container | //div[./input[..//label[text()='Custom Deployment Scripts']]] |
      | OK                                  | //button[contains(.,'Ok')]                                    |

    And I highlight outside the "Configure features" button
    And I sleep for "1" second
    And I save a screenshot to "#{ExternalMediaPath}/octopus/project/#{GuideSpecificScreenshotDir}046-octopus-enable-conf-features.png"
    And I scroll the "Configure features" button into view offset by "-300"
    And I click the "Configure features" button
    And I remove the highlight from the "Configure features" button

    And I highlight inside the "Custom Deployment Scripts Container" option
    And I highlight outside the "OK" button with an offset of "2"
    And I force click the "Custom Deployment Scripts" option
    And I sleep for "1" second
    And I save a screenshot to "#{ExternalMediaPath}/octopus/project/#{GuideSpecificScreenshotDir}047-octopus-enable-conf-vars.png"
    And I click the "OK" button

  @define-project @destinationspecific @nginx
  Scenario: Define IIS project
    Given I set the following aliases:
      | Add                      | //div[./div/div[text()='Deploy to IIS']]//button[contains(.,'Add')]                             |
      | Step Name                | //input[@name='Step name']                                                                      |
      | Runs on targets in roles | //input[../../label[contains(text(), 'Runs on targets in roles (type to add new)')]]            |
      | Web role                 | //div[contains(@class, 'VirtualListWithKeyboard_menuContainer')]//span[contains(.,'web')]//span |

    And I scroll the "Step Name" text box into view offset by "-300"
    And I highlight outside the "Step Name" text box
    And I force clear the "Step Name" text box
    And I populate the "Step Name" text box with "Deploy web app to Nginx"
    And I sleep for "1" second
    And I save a screenshot to "#{ExternalMediaPath}/octopus/project/#{GuideSpecificScreenshotDir}080-octopus-step-name.png"
    And I remove the highlight from the "Step Name" text box

    And I scroll the "Runs on targets in roles" text box into view offset by "-300"
    And I click the "Runs on targets in roles" text box
    And I populate the "Runs on targets in roles" text box with "web"
    And I sleep for "1" second
    And I highlight outside the "Runs on targets in roles" text box
    And I save a screenshot to "#{ExternalMediaPath}/octopus/project/#{GuideSpecificScreenshotDir}090-octopus-step-role.png"
    And I click the "Web role" option
    And I remove the highlight from the "Runs on targets in roles" text box

  @define-project @destinationspecific @nginx @repositoryspecific @octo-built-in-feed
  Scenario: Select built in feed for the iis deployment
    Given I set the following aliases:
      | HTML Body                | //body                                                                                                   |
      | Package ID               | //input[@name='PackageID']                                                                               |
      | Random Quotes Suggestion | //div[contains(@class, 'VirtualListWithKeyboard_menuContainer')]//span[contains(.,'RandomQuotes')]//span |

    And I scroll the "Package ID" text box into view offset by "-300"
    And I highlight outside the "Package ID" text box
    And I populate the "Package ID" text box with "RandomQuotes"
    And I sleep for "2" second
    And I click the "Random Quotes Suggestion" option
    And I save a screenshot to "#{ExternalMediaPath}/octopus/project/#{GuideSpecificScreenshotDir}100-octopus-step-package.png"
    And I remove the highlight from the "Package ID" text box

  @define-project @destinationspecific @nginx
  Scenario: Nginx - Continue to define project
    Given I set the following aliases:
      | Bash                    | (//input[@value='Bash'])[3]                                                                                 |
      | Bash container          | (//div[./input[@value='Bash']])[3]                                                                          |
      | Post-deployment script  | (//div[contains(@class, 'ReactCodeMirror')])[3]                                                             |
      | Remove binding          | (//div[*[local-name() = 'svg']/*[local-name()='path'][starts-with(@d, 'M19 6.41L17.59')]])[2]               |
      | Add binding             | //div[contains(@class, 'actionsMenu')][not(contains(@class, 'hidden'))]//button[contains(.,'Add binding')]  |
      | Add location            | //div[contains(@class, 'actionsMenu')][not(contains(@class, 'hidden'))]//button[contains(.,'Add location')] |
      | Port                    | //input[@name='Port']                                                                                       |
      | Location                | //input[@name='Location']                                                                                   |
      | Add Directive           | //button[contains(.,'Add Directive')]                                                                       |
      | Proxy URL               | //input[@name='URL']                                                                                        |
      | Reverse Proxy           | //input[..//label[text()='Reverse Proxy']]                                                                  |
      | Reverse Proxy Container | //div[./div/div/label[text()='Reverse Proxy']]                                                              |
      | Directive One           | (//input[@name='Directive'])[1]                                                                             |
      | Value One               | (//input[@name='Value'])[1]                                                                                 |
      | Directive Two           | (//input[@name='Directive'])[2]                                                                             |
      | Value Two               | (//input[@name='Value'])[2]                                                                                 |
      | Directive Three         | (//input[@name='Directive'])[3]                                                                             |
      | Value Three             | (//input[@name='Value'])[3]                                                                                 |
      | Directive Four          | (//input[@name='Directive'])[4]                                                                             |
      | Value Four              | (//input[@name='Value'])[4]                                                                                 |
      | Directive Five          | (//input[@name='Directive'])[5]                                                                             |
      | Value Five              | (//input[@name='Value'])[5]                                                                                 |
      | Directive Six           | (//input[@name='Directive'])[6]                                                                             |
      | Value Six               | (//input[@name='Value'])[6]                                                                                 |
      | OK                      | //button[contains(.,'Ok')]                                                                                  |
      | Save                    | //button[contains(.,'Save')]                                                                                |

    And I scroll the "Post-deployment script" container into view offset by "-300"
    And I highlight inside the "Bash container" container
    And I highlight inside the "Post-deployment script" container
    And I force click the "Bash" radio button

    And I run the following JavaScript:
    """
window.findReactComponent = function(el) {
  for (const key in el) {
    if (key.startsWith('__reactInternalInstance$')) {
      const fiberNode = el[key];

      return fiberNode && fiberNode.return && fiberNode.return.stateNode;
    }
  }
  return null;
};

elements = document.getElementsByClassName("ReactCodeMirror");
if (elements.length !== 0) {
  cm = findReactComponent(document.getElementsByClassName("ReactCodeMirror")[2]);
  cm.props.onChange("SYSTEMD_CONF=\/etc\/systemd\/system\r\nSERVICE_USER=$(whoami)\r\nENVIRONMENT=#{Octopus.Environment.Name}\r\n\r\n# This is used to generate the systemd filename, so we remove any chars that might be problematic for filenames\r\nAPPNAME=#{Octopus.Action[Deploy web app to Nginx].Package.PackageId | Replace \"[^a-zA-Z0-9]\" -}\r\n# This path is referenced by the systemd service in multiple places, and systemd treats the % char as special,\r\n# so it is escaped with a second % char\r\nROOTDIR=#{Octopus.Action[Deploy web app to Nginx].Output.Package.InstallationDirectoryPath | Replace \"%\" \"%%\"}\r\nSYSTEMD_SERVICE_FILE=${SYSTEMD_CONF}\/${APPNAME}.service\r\n\r\n# Application systemd service configuration\r\necho \"Creating ${APPNAME} systemd service configuration\"\r\ncat > \"${APPNAME}.service\" <<-EOF\r\n [Unit]\r\n Description=${APPNAME} service\r\n After=network.target\r\n\r\n [Service]\r\n # Expose the gems that were bundled up with the application package\r\n Environment=GEM_PATH=${ROOTDIR}\/vendor\r\n # Add gem executables to the path\r\n Environment=PATH=${PATH}:${ROOTDIR}\/vendor\/bin\r\n WorkingDirectory=${ROOTDIR}\r\n User=${SERVICE_USER}\r\n Group=${SERVICE_USER}\r\n ExecStart=${ROOTDIR}\/vendor\/bin\/unicorn -c ${ROOTDIR}\/unicorn.rb -E ${ENVIRONMENT}\r\n Restart=always\r\n RestartSec=10\r\n SyslogIdentifier=${APPNAME}\r\n [Install]\r\n WantedBy=multi-user.target\r\nEOF\r\nsudo mv \"${APPNAME}.service\" ${SYSTEMD_CONF}\/${APPNAME}.service\r\n\r\n# Ensure the bin files are executable\r\nchmod +x -R \"#{Octopus.Action[Deploy web app to Nginx].Output.Package.InstallationDirectoryPath}\/vendor\/bin\"\r\n\r\n# Any changes to a system file are picked up by reloading the systemd daemon\r\nsudo systemctl daemon-reload\r\n# Enable the service so it starts on boot\r\nsudo systemctl enable \"${APPNAME}.service\"\r\n# Start or restart the service to pick up any changes\r\nsudo systemctl restart \"${APPNAME}.service\"");
}
    """
    And I save a screenshot to "#{ExternalMediaPath}/octopus/project/#{GuideSpecificScreenshotDir}110-octopus-variables-appsettings.png"

    And I scroll the "Remove binding" button into view offset by "-300"
    And I highlight outside the "Remove binding" button
    And I save a screenshot to "#{ExternalMediaPath}/octopus/project/#{GuideSpecificScreenshotDir}120-octopus-step-remove-binding.png"
    And I click the "Remove binding" button
    And I sleep for "1" second

    And I highlight outside the "Add binding" button with an offset of "2"
    And I sleep for "1" second
    And I save a screenshot to "#{ExternalMediaPath}/octopus/project/#{GuideSpecificScreenshotDir}130-octopus-step-add-binding.png"
    And I force click the "Add binding" button
    And I remove the highlight from the "Add binding" button

    And I highlight outside the "Port" text box
    And I highlight outside the "OK" button with an offset of "2"
    And I clear the "Port" text box
    And I force clear the "Port" text box
    And I populate the "Port" text box with "#{Nginx Port}"
    And I sleep for "1" second
    And I save a screenshot to "#{ExternalMediaPath}/octopus/project/#{GuideSpecificScreenshotDir}140-octopus-step-binding-port.png"
    And I click the "OK" button

    # The proxy pass location

    And I highlight outside the "Add location" button with an offset of "2"
    And I sleep for "1" second
    And I save a screenshot to "#{ExternalMediaPath}/octopus/project/#{GuideSpecificScreenshotDir}150-octopus-step-add-location.png"
    And I force click the "Add location" button
    And I remove the highlight from the "Add location" button

    And I highlight outside the "Location" text box with an offset of "2"
    And I highlight outside the "Reverse Proxy Container" check box with an offset of "2"
    And I highlight outside the "OK" button with an offset of "2"
    And I populate the "Location" text box with "@app"
    And I force click the "Reverse Proxy" check box
    And I highlight outside the "Proxy URL" text box with an offset of "2"
    And I populate the "Proxy URL" text box with "http://unix:#{Octopus.Action.Package.InstallationDirectoryPath}/tmp/sockets/unicorn.sock"
    And I sleep for "1" second
    And I save a screenshot to "#{ExternalMediaPath}/octopus/project/#{GuideSpecificScreenshotDir}160-octopus-step-location-port.png"
    And I click the "OK" button

    # The exact root location

    And I highlight outside the "Add location" button with an offset of "2"
    And I sleep for "1" second
    And I save a screenshot to "#{ExternalMediaPath}/octopus/project/#{GuideSpecificScreenshotDir}170-octopus-step-add-location.png"
    And I force click the "Add location" button
    And I remove the highlight from the "Add location" button

    And I highlight outside the "Location" text box with an offset of "2"
    And I highlight outside the "OK" button with an offset of "2"
    And I populate the "Location" text box with "= /"

    And I click the "Add Directive" button
    And I populate the "Directive One" text box with "index"
    And I populate the "Value One" text box with "index.html"

    And I sleep for "1" second
    And I save a screenshot to "#{ExternalMediaPath}/octopus/project/#{GuideSpecificScreenshotDir}180-octopus-step-location-port.png"
    And I click the "OK" button

    # The root location

    And I highlight outside the "Add location" button with an offset of "2"
    And I sleep for "1" second
    And I save a screenshot to "#{ExternalMediaPath}/octopus/project/#{GuideSpecificScreenshotDir}190-octopus-step-add-location.png"
    And I force click the "Add location" button
    And I remove the highlight from the "Add location" button

    And I highlight outside the "Location" text box with an offset of "2"
    And I highlight outside the "OK" button with an offset of "2"
    And I populate the "Location" text box with "/"

    And I click the "Add Directive" button
    And I populate the "Directive One" text box with "root"
    And I populate the "Value One" text box with "#{Octopus.Action.Package.InstallationDirectoryPath}/lib/public"

    And I click the "Add Directive" button
    And I populate the "Directive Two" text box with "try_files"
    And I populate the "Value Two" text box with "$uri @app"

    And I sleep for "1" second
    And I save a screenshot to "#{ExternalMediaPath}/octopus/project/#{GuideSpecificScreenshotDir}200-octopus-step-location-port.png"
    And I click the "OK" button

    # Save the step

    And I highlight outside the "Save" button
    And I save a screenshot to "#{ExternalMediaPath}/octopus/project/#{GuideSpecificScreenshotDir}210-save.png"
    And I click the "Save" button

    And I sleep for "3" seconds
    # Give the step time to save
    And I stop recording the screen
    And I sleep for "60" seconds
    And I start recording the screen to the directory "#{ExternalMediaPath}"

  @deploy-project
  Scenario: Deploy project
    And I run the feature "shared/octopus-deploy-project.feature" passing the original arguments

  @shutdown
  Scenario: Shutdown
    Then I fade the screen to "1" "1" "1" over "3000" milliseconds
    And I stop recording the screen
    And I close the browser
