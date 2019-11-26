Feature: Configure Bamboo

  Scenario: Login
    Given I set the following aliases:
      | Log in     | (//a[text()='Log in'])[1]            |
      | Username   | //input[@id='loginForm_os_username'] |
      | Password   | //input[@id='loginForm_os_password'] |
      | Log in Two | // input[@id='loginForm_save']       |

    And I open the shared browser "ExternalBrowserType"
    And I maximize the window
    And I set the default explicit wait time to "30" seconds
    And I open the URL "http://localhost:6990/bamboo"
    And I click the "Log in" button
    And I populate the "Username" text box with "admin"
    And I populate the "Password" text box with "admin"
    And I save a screenshot to "#{ExternalMediaPath}/bamboo/login/010-login.png"
    And I click the "Log in Two" button

  @add-plugins
  Scenario: Add plugins
    Given I set the following aliases:
      | Close dialog               | //span[@class='aui-icon icon-close']                       |
      | Administration             | //span[contains(.,'Administration')]                       |
      | Overview                   | //a[contains(.,'Overview')]                                |
      | Find new apps              | //a[contains(.,'Find new apps')]                           |
      | Search the Marketplace     | //input[@id='upm-install-search-box']                      |
      | Install                    | //a[contains(.,'Install')]                                 |
      | Accept & install           | //button[normalize-space(text())='Accept & install']       |
      | Installed and ready to go! | //h2[normalize-space(text())='Installed and ready to go!'] |
      | Close                      | //button[text()='Close']                                   |

    And I click the "Close dialog" button waiting up to "5" seconds if it exists
    And I start recording the screen to the directory "#{ExternalMediaPath}"

    And I display a note with the text "Installing the Bamboo add ons" for "3" seconds

    And I scroll the "Administration" button into view
    And I force click the "Administration" button
    And I highlight inside the "Administration" button
    And I highlight outside the "Overview" link
    And I save a screenshot to "#{ExternalMediaPath}/bamboo/addins/#{GuideSpecificScreenshotDir}010-administration.png"
    And I force click the "Overview" link

    And I scroll the "Find new apps" link into view offset by "-300"
    And I highlight outside the "Find new apps" link with an offset of "5"
    And I save a screenshot to "#{ExternalMediaPath}/bamboo/addins/#{GuideSpecificScreenshotDir}020-find-apps.png"
    And I click the "Find new apps" link

    And I stop recording the screen
    And I refresh the page if the "Search the Marketplace" text box does not exist
    And I start recording the screen to the directory "#{ExternalMediaPath}"

    And I populate the "Search the Marketplace" text box with "Octopus"
    And I highlight outside the "Search the Marketplace" text box with an offset of "5"
    And I sleep for "2" second
    And I press the enter key from the "Search the Marketplace" text box
    And I sleep for "5" seconds

    And I highlight outside the "Install" button
    And I save a screenshot to "#{ExternalMediaPath}/bamboo/addins/#{GuideSpecificScreenshotDir}030-octopus-addin.png"
    And I click the "Install" button
    And I remove the highlight from the "Search the Marketplace" text box
    And I sleep for "5" seconds

    And I highlight outside the "Accept & install" button with an offset of "5"
    And I save a screenshot to "#{ExternalMediaPath}/bamboo/addins/#{GuideSpecificScreenshotDir}040-accept.png"
    And I click the "Accept & install" button

    And I highlight outside the "Close" button
    Then I verify the "Installed and ready to go!" title is present
    And I save a screenshot to "#{ExternalMediaPath}/bamboo/addins/#{GuideSpecificScreenshotDir}050-installed.png"
    And I click the "Close" button
    And I stop recording the screen

  @executables
  Scenario: Configure Docker
    Given I set the following aliases:
      | Close dialog        | //span[@class='aui-icon icon-close']                  |
      | Administration      | //span[contains(.,'Administration')]                  |
      | Overview            | //a[contains(.,'Overview')]                           |
      | Server capabilities | //a[contains(.,'Server capabilities')]                |
      | Git                 | //a[contains(.,'Git')]                                |
      | Edit                | //a[contains(.,'Edit')]                               |
      | Path                | //input[@id='updateSharedCapability_capabilityValue'] |
      | Update              | //input[@id='updateSharedCapability_save']            |

    And I click the "Close dialog" button waiting up to "5" seconds if it exists

    And I start recording the screen to the directory "#{ExternalMediaPath}"
    And I display a note with the text "Configuring the executables" for "3" seconds

    And I scroll the "Administration" button into view
    And I force click the "Administration" button
    And I highlight inside the "Administration" button
    And I highlight outside the "Overview" link
    And I save a screenshot to "#{ExternalMediaPath}/bamboo/executables/#{GuideSpecificScreenshotDir}010-administration.png"
    And I force click the "Overview" link

    And I highlight outside the "Server capabilities" link with an offset of "5"
    And I save a screenshot to "#{ExternalMediaPath}/bamboo/executables/#{GuideSpecificScreenshotDir}020-server-capabilities.png"
    And I click the "Server capabilities" link

    And I scroll the "Capability type" drop down list into view offset by "-300"
    And I select the option "Executable" from the "Capability type" drop down list
    And I select the option "Docker" from the "Type" drop down list
    And I populate the "Executable label" text box with "Docker"
    And I populate the "Executable path" text box with "/usr/bin/docker"
    And I scroll the "Add" button into view offset by "-300"

    And I highlight outside the "Capability type" drop down list with an offset of "2"
    And I highlight outside the "Type" drop down list with an offset of "2"
    And I highlight outside the "Executable label" text box with an offset of "2"
    And I highlight outside the "Executable path" text box with an offset of "5"
    And I highlight outside the "Add" button with an offset of "5"

    And I save a screenshot to "#{ExternalMediaPath}/bamboo/executables/#{GuideSpecificScreenshotDir}030-docker.png"
    And I click the "Add" button

  @executables
  Scenario: Configure Octo CLI
    Given I set the following aliases:
      | Capability type  | //select[@id='addCapability_capabilityType'] |
      | Type             | //select[@id='executableTypeSelect']         |
      | Executable label | //input[@id='addCapability_builderLabel']    |
      | Executable path  | //input[@id='addCapability_builderPath']     |
      | Add              | //input[@id='addCapability_save']            |

    And I scroll the "Capability type" drop down list into view offset by "-300"
    And I select the option "Executable" from the "Capability type" drop down list
    And I select the option "Octopus CLI" from the "Type" drop down list
    And I populate the "Executable label" text box with "Octopus CLI"
    And I populate the "Executable path" text box with "/opt/octo/Octo"
    And I scroll the "Add" button into view offset by "-300"

    And I highlight outside the "Capability type" drop down list with an offset of "2"
    And I highlight outside the "Type" drop down list with an offset of "2"
    And I highlight outside the "Executable label" text box with an offset of "2"
    And I highlight outside the "Executable path" text box with an offset of "5"
    And I highlight outside the "Add" button with an offset of "5"

    And I save a screenshot to "#{ExternalMediaPath}/bamboo/executables/#{GuideSpecificScreenshotDir}040-octo.png"
    And I click the "Add" button

    And I stop recording the screen

  Scenario: Add project
    Given I set the following aliases:
      | My Bamboo                    | //a[@id='myBamboo']                                                                            |
      | Create your first build plan | //a[@id='create-a-plan']                                                                       |
      | Project name                 | //input[@id='projectName']                                                                     |
      | Plan name                    | //input[@id='chainName']                                                                       |
      | Repository host              | //a[@id='repository-other']                                                                    |
      | Git                          | //a[@href='#com.atlassian.bamboo.plugins.atlassian-bamboo-plugin-git:gitv2']                   |
      | Display name                 | //input[@id='createPlan_repositoryName']                                                       |
      | Repository URL               | //input[@id='createPlan_repository_git_repositoryUrl']                                         |
      | Test connection              | //button[@id='test-connection-com-atlassian-bamboo-plugins-atlassian-bamboo-plugin-git-gitv2'] |
      | Connection successful        | //p[text()='Connection successful']                                                            |
      | Configure plan               | //input[@id='createPlan_save']                                                                 |

    And I start recording the screen to the directory "#{ExternalMediaPath}"
    And I display a note with the text "Creating the build project" for "3" seconds

    And I highlight inside the "My Bamboo" link
    And I save a screenshot to "#{ExternalMediaPath}/bamboo/initialproject/#{GuideSpecificScreenshotDir}010-mybamboo.png"
    And I click the "My Bamboo" link

    And I highlight outside the "Create your first build plan" button
    And I save a screenshot to "#{ExternalMediaPath}/bamboo/initialproject/#{GuideSpecificScreenshotDir}020-create-build-plan.png"
    And I click the "Create your first build plan" button

    And I highlight outside the "Project name" text box with an offset of "5"
    And I populate the "Project name" text box with "Random Quotes"
    And I save a screenshot to "#{ExternalMediaPath}/bamboo/initialproject/#{GuideSpecificScreenshotDir}030-project-name.png"

    And I highlight outside the "Plan name" text box with an offset of "5"
    And I populate the "Plan name" text box with "Website"
    And I save a screenshot to "#{ExternalMediaPath}/bamboo/initialproject/#{GuideSpecificScreenshotDir}040-plan-name.png"
    And I remove the highlight from the "Project name" text box
    And I remove the highlight from the "Plan name" text box

    And I highlight outside the "Repository host" drop down list
    And I scroll the "Repository host" drop down list into view offset by "-300"
    And I click the "Repository host" drop down list

    And I scroll the "Git" option into view offset by "-300"
    And I highlight outside the "Git" option with an offset of "0"
    And I click the "Git" option
    And I save a screenshot to "#{ExternalMediaPath}/bamboo/initialproject/#{GuideSpecificScreenshotDir}050-git.png"

    And I highlight outside the "Display name" text box with an offset of "0"
    And I scroll the "Display name" text box into view offset by "-300"
    And I populate the "Display name" text box with "Random Quotes GitHub"
    And I save a screenshot to "#{ExternalMediaPath}/bamboo/initialproject/#{GuideSpecificScreenshotDir}060-display-name.png"

    And I highlight outside the "Repository URL" text box with an offset of "5"
    And I scroll the "Repository URL" text box into view offset by "-300"
    And I populate the "Repository URL" text box with "GitUrl"
    And I save a screenshot to "#{ExternalMediaPath}/bamboo/initialproject/#{GuideSpecificScreenshotDir}070-repo-url.png"
    And I remove the highlight from the "Git" option
    And I remove the highlight from the "Display name" text box
    And I remove the highlight from the "Repository URL" text box

    And I highlight outside the "Test connection" button
    And I scroll the "Test connection" button into view offset by "-300"
    And I scroll the "Test connection" button into view
    And I click the "Test connection" button
    Then I verify the "Connection successful" message is present
    And I save a screenshot to "#{ExternalMediaPath}/bamboo/initialproject/#{GuideSpecificScreenshotDir}080-test-connection.png"

    And I highlight outside the "Configure plan" button
    And I scroll the "Configure plan" button into view
    And I save a screenshot to "#{ExternalMediaPath}/bamboo/initialproject/#{GuideSpecificScreenshotDir}090-configure-plan.png"
    And I click the "Configure plan" button