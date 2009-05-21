Feature: Manage posts
  In order to share our awesomeness with the world more effectively
  As a blogger
  I want to post my thoughts in the form of blog entries
  
  Scenario: Create a new post with valid password
    Given I am on the new post page
    When I fill in "Title" with "title 1"
    And I fill in "Body" with "body 1"
    And I fill in "Password" with "brian_and_scott"
    And I press "Create"
    Then I should see "title 1"
    And I should see "body 1"

  Scenario: Fail to create a new post with invalid password
    Given I am on the new post page
    When I fill in "Title" with "title 1"
    And I fill in "Body" with "body 1"
    And I fill in "Password" with "franks_and_beans"
    And I press "Create"
    Then I should see "Password is invalid"

  Scenario: Listing posts should show up newest first
    Given the following posts:
      |title|body|
      |title 1|body 1|
      |title 2|body 2|
      |title 3|body 3|
      |title 4|body 4|
    When I am on the posts index page
    Then I should see the following posts:
      |title|body|
      |title 4|body 4|
      |title 3|body 3|
      |title 2|body 2|
      |title 1|body 1|
