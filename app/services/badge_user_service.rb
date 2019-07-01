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
    badge_rule = BadgeRule.find_by(rule: 'first_try_complete')
    return unless badge_rule
    return if @user.tests.where(id: @test.id).count > 1

    give_badge(badge_rule.badge)
  end

  def level_complete
    level = @test.level
    badge_rule = BadgeRule.find_by(rule: 'level_complete', value: level)
    return unless badge_rule

    tests_ids = Test.levels_test(level).ids
    complete_tests_ids = @user.tests.levels_test(level).distinct.ids

    give_badge(badge_rule.badge) if complete_tests_ids == tests_ids
  end

  def category_complete
    category = @test.category.title
    badge_rule = BadgeRule.find_by(rule: 'category_complete', value: category)
    return unless badge_rule

    tests_ids = Test.categories_test(category).ids
    complete_tests_ids = @user.tests.categories_test(category).distinct.ids

    give_badge(badge_rule.badge) if complete_tests_ids == tests_ids
  end
end
