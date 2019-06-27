class BadgeUserService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end

  def call
    first_try_successfull
    level_complete
    category_complete
  end

  private

  def give_badge(badge)
    @user.badges << badge
  end

  def first_try_successfull
    if BadgeRule.where(rule: 'first_try_complete').first
      give_badge(BadgeRule.where(rule: 'first_try_complete').first.badge) if @user.tests.where(id: @test.id).count == 1
    end
  end

  def level_complete
    if BadgeRule.where(rule: 'level_complete').first
      level = BadgeRule.where(rule: 'level_complete').first.value
      tests_ids = Test.levels_test(level).ids
      complete_tests_ids = @user.tests.levels_test(level).distinct.ids

      give_badge(BadgeRule.where(rule: 'level_complete').first.badge) if complete_tests_ids == tests_ids
    end
  end

  def category_complete
    if BadgeRule.where(rule: 'category_complete').first
      category = BadgeRule.where(rule: 'category_complete').first.value
      tests_ids = Test.categories_test(category).ids
      complete_tests_ids = @user.tests.categories_test(category).distinct.ids

      give_badge(BadgeRule.where(rule: 'category_complete').first.badge) if complete_tests_ids == tests_ids
    end
  end
end
