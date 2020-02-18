Feature: Build and deploy a Java application hosted in Git on a local Octopus instance

  Scenario: Initial setup
    Given I run the feature "shared/jenkins-open-browser.feature" passing the original arguments
    And I run the feature "shared/jenkins-login.feature" passing the original arguments
    And I run the feature "shared/jenkins-docker-plugin.feature" passing the original arguments
    And I run the feature "shared/jenkins-docker-creds.feature" passing the original arguments
    And I run the feature "shared/jenkins-configure-docker.feature" passing the original arguments
    And I run the feature "shared/jenkins-initial-project-setup.feature" passing the original arguments


  @configure-project
  Scenario: Create the project
    Given I set the following aliases:
      | Add build step                               | //button[@type='button'][contains(.,'Add build step')] |
      | Invoke top-level Maven targets               | //a[contains(.,'Invoke top-level Maven targets')]      |
      | Goals One                                    | (//input[@id='textarea._.targets'])[1]                 |
      | Goals Two                                    | (//input[@id='textarea._.targets'])[2]                 |
      | Command                                      | //div[@class='CodeMirror']                             |
      | Execute Docker command                       | //a[contains(.,'Execute Docker command')]              |
      | Docker command one                           | (//select[../../td[text()='Docker command']])[1]       |
      | Docker command two                           | (//select[../../td[text()='Docker command']])[2]       |
      | Create/build image                           | 4                                                      |
      | Build context folder                         | //input[@name='_.dockerFolder']                        |
      | Tag of the resulting docker image            | //input[@name='_.imageTag']                            |
      | Push image                                   | 7                                                      |
      | Name of the image to push (repository/image) | //input[@name='_.image']                               |
      | Tag                                          | (//input[@name='_.tag'])[3]                            |

    And I scroll the "Add build step" button into view offset by "-200"
    And I highlight outside the "Add build step" button
    And I sleep for "2" seconds
    And I click the "Add build step" button
    And I highlight outside the "Invoke top-level Maven targets" link
    And I save a screenshot to "#{ExternalMediaPath}/jenkins/initialproject/#{GuideSpecificScreenshotDir}240-maven.png"
    And I click the "Invoke top-level Maven targets" link
    And I remove the highlight from the "Add build step" option
    And I remove the highlight from the "Invoke top-level Maven targets" option

    And I scroll the "Goals One" text box into view offset by "-200"
    And I highlight outside the "Goals One" text box
    And I populate the "Goals One" text box with "versions:set -DnewVersion=1.0.$BUILD_NUMBER"
    And I save a screenshot to "#{ExternalMediaPath}/jenkins/initialproject/#{GuideSpecificScreenshotDir}250-maven.png"
    And I remove the highlight from the "Goals One" text box

    And I scroll the "Add build step" button into view offset by "-200"
    And I highlight outside the "Add build step" button
    And I sleep for "2" seconds
    And I click the "Add build step" button
    And I highlight outside the "Invoke top-level Maven targets" link
    And I save a screenshot to "#{ExternalMediaPath}/jenkins/initialproject/#{GuideSpecificScreenshotDir}260-maven.png"
    And I click the "Invoke top-level Maven targets" link
    And I remove the highlight from the "Add build step" option
    And I remove the highlight from the "Invoke top-level Maven targets" option

    And I scroll the "Goals Two" text box into view offset by "-200"
    And I highlight outside the "Goals Two" text box
    And I populate the "Goals Two" text box with "clean test package"
    And I save a screenshot to "#{ExternalMediaPath}/jenkins/initialproject/#{GuideSpecificScreenshotDir}270-maven.png"
    And I remove the highlight from the "Goals Two" text box

    And I scroll the "Add build step" button into view offset by "-200"
    And I highlight outside the "Add build step" button
    And I sleep for "2" seconds
    And I click the "Add build step" button
    And I highlight outside the "Execute Docker command" link
    And I save a screenshot to "#{ExternalMediaPath}/jenkins/initialproject/#{GuideSpecificScreenshotDir}280-execute-docker-command-1.png"
    And I click the "Execute Docker command" link
    And I remove the highlight from the "Add build step" option
    And I remove the highlight from the "Execute Docker command" option

    And I scroll the "Docker command one" drop down list into view offset by "-300"
    And I highlight outside the "Docker command one" drop down list with an offset of "2"
    And I select the option value "Create/build image" from the "Docker command one" drop down list

    And I scroll the "Build context folder" text box into view offset by "-300"
    And I highlight outside the "Build context folder" text box with an offset of "2"
    And I clear the "Build context folder" text box
    And I populate the "Build context folder" text box with "$WORKSPACE"

    And I scroll the "Tag of the resulting docker image" text box into view offset by "-300"
    And I highlight outside the "Tag of the resulting docker image" text box with an offset of "2"
    And I clear the "Tag of the resulting docker image" text box
    And I populate the "Tag of the resulting docker image" text box with "#{ExternalDockerImage}:1.0.$BUILD_NUMBER"

    And I save a screenshot to "#{ExternalMediaPath}/jenkins/initialproject/#{GuideSpecificScreenshotDir}290-execute-docker-command-1.png"

    And I remove the highlight from the "Docker command one" drop down list
    And I remove the highlight from the "Build context folder" text box
    And I remove the highlight from the "Tag of the resulting docker image" text box

    And I scroll the "Add build step" button into view offset by "-200"
    And I highlight outside the "Add build step" button
    And I sleep for "2" seconds
    And I click the "Add build step" button
    And I highlight outside the "Execute Docker command" link
    And I save a screenshot to "#{ExternalMediaPath}/jenkins/initialproject/#{GuideSpecificScreenshotDir}300-execute-docker-command-1.png"
    And I click the "Execute Docker command" link
    And I remove the highlight from the "Add build step" option
    And I remove the highlight from the "Execute Docker command" option

    And I scroll the "Docker command two" drop down list into view offset by "-300"
    And I highlight outside the "Docker command two" drop down list with an offset of "2"
    And I select the option value "Push image" from the "Docker command two" drop down list

    And I scroll the "Name of the image to push (repository/image)" text box into view offset by "-300"
    And I highlight outside the "Name of the image to push (repository/image)" text box with an offset of "2"
    And I populate the "Name of the image to push (repository/image)" text box with "randomquotesjava"

    And I scroll the "Tag" text box into view offset by "-300"
    And I highlight outside the "Tag" text box with an offset of "2"
    And I populate the "Tag" text box with "1.0.$BUILD_NUMBER"

  @configure-project @repositoryspecific @localdockerrepo
  Scenario: Set the docker registry
    Given I set the following aliases:
      | Registry                                     | //input[@name='_.registry']                            |
      | Docker registry URL                          | (//input[@name='_.url'])[2]                            |

    And I scroll the "Registry" text box into view offset by "-300"
    And I highlight outside the "Registry" text box with an offset of "2"
    And I populate the "Registry" text box with "localhost:5000"

    And I scroll the "Docker registry URL" text box into view offset by "-300"
    And I highlight outside the "Docker registry URL" text box with an offset of "2"
    And I populate the "Docker registry URL" text box with "http://localhost:5000"

  @configure-project @repositoryspecific @dockerhub
  Scenario: Set the docker registry
    Given I set the following aliases:
      | Registry                                     | //input[@name='_.registry']                            |
      | Docker registry URL                          | (//input[@name='_.url'])[2]                            |

    And I scroll the "Registry" text box into view offset by "-300"
    And I highlight outside the "Registry" text box with an offset of "2"
    And I populate the "Registry" text box with "octopusdeploy"

    And I scroll the "Docker registry URL" text box into view offset by "-300"
    And I highlight outside the "Docker registry URL" text box with an offset of "2"
    And I populate the "Docker registry URL" text box with "https://index.docker.io/v1/"

  @configure-project @repositoryspecific @dockerhub
  Scenario: Set the credentials for a public repsoitory
    Given I set the following aliases:
      | Registry credentials | (//select[@name='_.credentialsId'])[3] |

    And I scroll the "Registry credentials" drop down list into view offset by "-200"
    And I highlight outside the "Registry credentials" drop down list with an offset of "2"
    And I highlight outside the "Save" button
    And I select the option value "DockerCredentials" from the "Registry credentials" drop down list
    And I save a screenshot to "#{ExternalMediaPath}/jenkins/initialproject/#{GuideSpecificScreenshotDir}310-execute-docker-command-1.png"

  @configure-project
  Scenario: Set the credentials for a public repsoitory
    Given I set the following aliases:
      | Save | //button[@type='button'][contains(.,'Save')] |

    And I click the "Save" button
    And I stop recording the screen

  Scenario: Build project
    And I run the feature "shared/jenkins-build.feature"

  Scenario: Shutdown
    Then I fade the screen to "1" "1" "1" over "3000" milliseconds
    And I stop recording the screen
    And I close the browser