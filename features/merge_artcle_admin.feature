Feature: Merge Article for admin
  A admin can merge articles related article.

  Background:
    Given the blog is set up
    Given the following articles exist:
      | title        | body       |   username   |
      | particle1    | content1   | admin    |
      | particle2    | content2  | admin    |

    Given the following comments exist:
      | title        | comment_author |   comment_body   |
      | particle1    | Author1   | Comment1    |
      | particle2    | Author2  | Comment2    |

    Given I am logged into the admin panel



  Scenario: Merge option is visible for admins
    When I am on the edit page for "particle1"
    Then I should see "Merge Articles"



  Scenario: Merged articles should have both comments
    When I merge articles "particle1" and "particle2"
    And I visit article with title "particle1"
    Then I should see comments "Comment1" and "Comment2" in merged article

  Scenario: Merged articles should have both contents
    When I merge articles "particle1" and "particle2"
    And I visit article with title "particle1"
    Then I should see content "content1" and "content2" in merged article