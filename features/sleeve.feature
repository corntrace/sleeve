Feature: Sleeve cucumber world

	Background:
	  Given Code, CodeGroup and Comment AR models and User, HotDog class exist
	    And I have loaded Sleeve
	
	@current
	Scenario: creating simple code models
	  Given I have a following codes exist
		 | title    | content           |
		 | My Code  | some content ...  |
		 | Hot Code | hot code cont ... |
		 Then I should access a code via code[My Code]
		  And I should access a code via code[Hot Code]



	# Scenario: transform single attribute model
	# 	Given I have a user[Kevin Fu] exist
	# 	 Then I could access user[Kevin Fu] from sleeve pocket
	# 	
	# 	Given I have a hot_dog[germay] exist
	# 	 Then I could access hot_dog[germay] from sleeve pocket
	# 	
	# Scenario: raise error if type is missing when transform model
	#   Given I have a not_exist_model[Not Exist] exist
	#    Then I should get an error message
	
	@wip
	Scenario: ar model pool
	  Given I have a user[Kevin Fu] exist
	    And I have a following code groups exist
			 | title  | owner          |
			 | Tricky | user[Kevin Fu] |
	    And I have a following codes exist
			 | title    | group              | content_revision_head | *other necessary attrs*  |
			 | My Utils | code_group[Tricky] | some contents ...     | *other necessary values* |
			 | My Funcs | code_group[Tricky] | some functions ...    | *other necessary values* |
		 Then I should access objects through the object pool
		
	Scenario: instance variable environment
	   When I call method1
	   Then I get the instance variable with value 1
	   When I call method2
	   Then I get the instance variable with value 2
	
	Scenario: instance variable environment reset
	   When I call method1
	   Then I get the instance variable with value 1

  
