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
    give_badge(Badge.where(rule_name: 'attempt').first) if @user.tests.where(id: @test.id).count == 1
  end

  def level_complete
    level = @test.level
    tests_ids = Test.levels_test(level).ids
    complete_tests_ids = @user.tests.levels_test(level).distinct.ids

    give_badge(Badge.where(rule_name: 'level', rule_value: level).first) if complete_tests_ids == tests_ids
  end

  def category_complete
    category = @test.category.title
    tests_ids = Test.categories_test(category).ids
    complete_tests_ids = @user.tests.categories_test(category).distinct.ids

    give_badge(Badge.where(rule_name: 'categoty', rule_value: category).first) if complete_tests_ids == tests_ids
  end
end
