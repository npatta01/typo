Feature: Merge Article for non admin
  A non-admin cannot merge articles.

  Background:
    Given the blog is set up
    Given I am logged into the publisher panel

  Scenario: Non admins cant merge new article
    And I am on the new article page
    When I fill in "article_title" with "NonAdminFoobar"
    And I fill in "article__body_and_extended_editor" with "NonAdminEntry"
    And I press "Publish"
    And  I follow "NonAdminFoobar"
    Then I should not see "Merge Articles"



  Scenario: Non admins cant merge existing article
    Given the following articles exist:
      | title        | body     |   username   |
      | particle1    | nothing  | publisher    |
    When I am on the edit page for "particle1"
    Then I should not see "Merge Articles"
