class SchoolsIndexTest < ActionDispatch::IntegrationTest

  def setup
    @school = schools(:one)
  end

  test "index including pagination" do
    get users_path
    assert_template 'schools/index'
    assert_select 'div.pagination'
    School.paginate(page: 1).each do |school|
      assert_select 'a[href=?]', school_path(school), text: school.school_name
    end
  end
  
end