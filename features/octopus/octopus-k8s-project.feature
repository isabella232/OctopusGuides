Feature: Configure an Octopus Kubernetes project

  @login
  Scenario: Login
    Given I set the following aliases:
      | Username | //input[@name='userName']       |
      | Password | //input[@name='password']       |
      | Sign In  | //button[contains(.,'SIGN IN')] |
    And I open the shared browser "ChromeNoImplicitWait"
    And I maximize the window
    #And I set the window size to "1024" x "768"
    And I set the default explicit wait time to "30" seconds
    And I open the URL "http://localhost"
    And I populate the "Username" text box with "admin"
    And I populate the "Password" text box with "Password01!"
    And I click the "Sign In" button

  @hide-wizard
  Scenario: Hide wizard
    Given I set the following aliases:
      | Hide wizard | //em[contains(@class,'fa fa-minus')] |
    And I click the "Hide wizard" button

  @create-project
  Scenario: Create Project
    Given I set the following aliases:
      | Projects         | //span[contains(.,'Projects')]           |
      | Add project      | (//div[contains(.,'Add Project')])[11]   |
      | New project name | //input[contains(@id, 'Newprojectname')] |
      | Save             | (//div[contains(.,'Save')])[9]           |

    And I display a note with the text "Creating the Kubernetes deployment project in Octopus" for "3" seconds

    And I highlight outside the "Projects" link with an offset of "5"
    And I save a screenshot to "C:\screenshots\octopus\project\#{GuideSpecificScreenshotDir}005-octopus-projects.png"
    And I click the "Projects" link
    And I sleep for "1" second

    And I highlight outside the "Add project" link with an offset of "1"
    And I sleep for "1" second
    And I save a screenshot to "C:\screenshots\octopus\project\#{GuideSpecificScreenshotDir}010-octopus-add-project.png"
    And I click the "Add project" button
    And I remove the highlight from the "Add project" link
    And I remove the highlight from the "Projects" link

    And I highlight outside the "New project name" text box with an offset of "2"
    And I highlight outside the "Save" button with an offset of "2"
    And I populate the "New project name" text box with "Random Quotes"
    And I save a screenshot to "C:\screenshots\octopus\project\#{GuideSpecificScreenshotDir}015-octopus-new-project-name.png"
    And I click the "Save" button
    And I sleep for "2" seconds

  @define-project
  Scenario: Open the deployments view
    Given I set the following aliases:
      | Overview    | //a[contains(.,'Overview')][not(*)] \| //a//div[text()='Overview'] |
      | Deployments | //a[contains(.,'Deployments')]                                     |

    And I highlight inside the "Deployments" link
    And I click the "Deployments" link
    And I highlight inside the "Overview" link
    And I click the "Overview" link
    And I remove the highlight from the "Deployments" link

  @define-project @destinationspecific @k8s
  Scenario: Add K8S Containers Step
    Given I set the following aliases:
      | Define your deployment process | //button[contains(.,'Define your deployment process')]                                                             |
      | Add Step                       | //button[contains(.,'Add Step')]                                                                                   |
      | Search                         | //input[contains(@id, 'Filterbynamecategoryordescription')]                                                        |
      | Deploy Kubernetes containers   | //div[contains(@class, 'add-step-card') and contains(.,'Deploy Kubernetes containers')]                            |
      | Add                            | //div[contains(@class, 'add-step-card') and contains(.,'Deploy Kubernetes containers')]//button[contains(.,'Add')] |

    And I highlight outside the "Define your deployment process" button with an offset of "2"
    And I sleep for "1" second
    And I save a screenshot to "C:\screenshots\octopus\project\#{GuideSpecificScreenshotDir}030-octopus-define-process.png"

    And I click the "Define your deployment process" button
    And I sleep for "1" second

    And I highlight outside the "Add Step" button with an offset of "2"
    And I sleep for "1" second
    And I save a screenshot to "C:\screenshots\octopus\project\#{GuideSpecificScreenshotDir}035-octopus-k8s-add-step.png"
    And I click the "Add Step" button

    And I highlight outside the "Search" text box with an offset of "3"
    And I populate the "Search" text box with "Kubernetes"
    And I sleep for "1" second
    And I save a screenshot to "C:\screenshots\octopus\project\#{GuideSpecificScreenshotDir}040-octopus-k8s-search.png"
    And I sleep for "2" seconds
    And I remove the highlight from the "Search" text box

    And I scroll the "Deploy Kubernetes containers" tile into view offset by "-200"
    And I highlight outside the "Deploy Kubernetes containers" tile
    And I mouse over the "Deploy Kubernetes containers" tile
    And I save a screenshot to "C:\screenshots\octopus\project\#{GuideSpecificScreenshotDir}045-octopus-k8s-add-containers.png"
    And I click the "Add" button

  @define-project @destinationspecific @azure-web-app
  Scenario: K8S Define step
    Given I set the following aliases:
      | Step Name         | //input[contains(@id, 'Stepname')]                                                              |
      | On behalf of      | //input[@title='On behalf of target roles (type to add new)']                                   |
      | K8s role          | //div[contains(@class, 'VirtualListWithKeyboard_menuContainer')]//span[contains(.,'k8s')]//span |
      | Deployment name   | //input[contains(@id,'Deploymentname')]                                                         |
      | Add Container     | (//button[@title='Add Container'])[1]                                                           |
      | Image name        | //input[contains(@id,'Name')]                                                                   |
      | Package Id        | //input[contains(@id,'PackageID')]                                                              |
      | Package Id label  | //label[contains(@for,'PackageID')]                                                             |
      | Add Port          | (//button[@title='Add Port'])[3]                                                                |
      | Port name         | (//input[contains(@id,'Name')])[2]                                                              |
      | Port number       | (//input[contains(@id,'Port')])[1]                                                              |
      | OK                | (//button[@title='Ok'])[1]                                                                      |
      | Save              | //button[@title='Save']                                                                         |
      | Service name      | //input[contains(@id,'Servicename')]                                                            |
      | Add Service Port  | (//button[@title='Add Port'])[1]                                                                |
      | Service Port Name | //input[contains(@id,'Name')]                                                                   |
      | Port 80           | //span[./div/div/div[text()='80']]                                                              |
      | Service Port      | (//input[contains(@id,'Port')])[1]                                                              |
      | Node Port         | //input[contains(@id,'NodePort')]                                                               |

    And I scroll the "Step Name" text box into view offset by "-300"
    And I highlight outside the "Step Name" text box
    And I populate the "Step Name" text box with "Deploy container to Kubernetes"
    And I sleep for "1" second
    And I save a screenshot to "C:\screenshots\octopus\project\#{GuideSpecificScreenshotDir}050-octopus-k8s-step-name.png"
    And I remove the highlight from the "Step Name" text box

    And I scroll the "On behalf of" text box into view offset by "-300"
    And I click the "On behalf of" text box
    And I populate the "On behalf of" text box with "k8s"
    And I sleep for "1" second
    And I highlight outside the "On behalf of" text box
    And I save a screenshot to "C:\screenshots\octopus\project\#{GuideSpecificScreenshotDir}055-octopus-k8s-step-role.png"
    And I click the "K8s role" option
    And I remove the highlight from the "On behalf of" text box

    And I scroll the "Deployment name" text box into view offset by "-300"
    And I populate the "Deployment name" text box with "randomquotes"

    And I scroll the "Deployment name" text box into view offset by "-300"
    And I click the "Add Container" button

    And I scroll the "Image name" text box into view offset by "-300"
    And I populate the "Image name" text box with "randomquotes"

    And I scroll the "Add Port" button into view offset by "-300"
    And I force click the "Add Port" button

    And I scroll the "Port name" text box into view offset by "-300"
    And I populate the "Port name" text box with "web"

    And I scroll the "Port number" text box into view offset by "-300"
    And I populate the "Port number" text box with "80"

    And I click the "OK" button

    And I scroll the "Package Id" text box into view offset by "-300"
    And I populate the "Package Id" text box with "octopusdeploy/randomquotes"
    And I sleep for "1" second

    And I force click the "OK" button

    And I scroll the "Service name" text box into view offset by "-300"
    And I populate the "Service name" text box with "randomquotes"

    And I scroll the "Add Service Port" button into view offset by "-300"
    And I click the "Add Service Port" button

    And I populate the "Service Port Name" text box with "web"
    And I populate the "Service Port" text box with "80"
    And I click the "Port 80" option
    And I populate the "Node Port" text box with "30000"
    And I click the "OK" button

    And I force click the "Save" button
    And I sleep for "10" seconds

  @deploy-project
  Scenario: Deploy project
    Given I set the following aliases:
      | Create Release | //button[@title='Create release']        |
      | Save           | //button[@title='Save']                  |
      | Deploy To Dev  | //button[contains(.,'Deploy to Dev...')] |
      | Deploy         | //button[@title='Deploy']                |

    And I open the URL "http://localhost/app#/Spaces-1/projects/random-quotes/overview"
    And I sleep for "1" second

    And I highlight inside the "Create Release" button
    And I sleep for "1" second
    And I save a screenshot to "C:\screenshots\octopus\project\#{GuideSpecificScreenshotDir}095-octopus-create-release.png"
    And I click the "Create Release" button

    And I highlight outside the "Save" button
    And I sleep for "1" second
    And I save a screenshot to "C:\screenshots\octopus\project\#{GuideSpecificScreenshotDir}100-octopus-save-release.png"
    And I remove the highlight from the "Create Release" button
    And I force click the "Save" button
    And I sleep for "1" second

    And I save a screenshot to "C:\screenshots\octopus\project\#{GuideSpecificScreenshotDir}deploy.png"
    And I highlight outside the "Deploy To Dev" button with an offset of "2"
    And I sleep for "1" second
    And I save a screenshot to "C:\screenshots\octopus\project\#{GuideSpecificScreenshotDir}105-octopus-deploy-to-dev.png"
    And I click the "Deploy To Dev" button

    And I highlight outside the "Deploy" button
    And I sleep for "3" second
    And I save a screenshot to "C:\screenshots\octopus\project\#{GuideSpecificScreenshotDir}110-octopus-deploy.png"
    And I click the "Deploy" button

    And I stop recording the screen
    And I start recording the screen to the directory "C:\screenshots"
    And I sleep for "23" seconds

    And I save a screenshot to "C:\screenshots\octopus\project\#{GuideSpecificScreenshotDir}115-octopus-deployment.png"

  @shutdown
  Scenario: Shutdown
    Then I fade the screen to "1" "1" "1" over "3000" milliseconds
    And I stop recording the screen
    And I close the browser