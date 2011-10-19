require File.dirname(__FILE__) + '<%= "/.." * controller_class_nesting_depth %>/../test_helper'
require '<%= base_controller_file_path %>_controller'

# Re-raise errors caught by the controller.
class <%= controller_class_name %>Controller; def rescue_action(e) raise e end; end

class <%= controller_class_name %>ControllerTest < Test::Unit::TestCase
  fixtures :<%= plural_name %>

	NEW_<%= singular_name.upcase %> = {}	# e.g. {:name => 'Test <%= class_name %>', :description => 'Dummy'}
	REDIRECT_TO_MAIN = {:action => 'list'} # put hash or string redirection that you normally expect

	def setup
		@controller = <%= controller_class_name %>Controller.new
		@request    = ActionController::TestRequest.new
		@response   = ActionController::TestResponse.new
		# Retrieve fixtures via their name
		# @first = <%= plural_name %>(:first)
		@first = <%= class_name %>.find_first
	end

  def test_component
    get :component
    assert_response :success
    assert_template '<%= base_controller_file_path %>/component'
    <%= plural_name %> = check_attrs(%w(<%= plural_name %>))
    assert_equal <%= class_name %>.find(:all).length, <%= plural_name %>.length, "Incorrect number of <%= plural_name %> shown"
  end

  def test_component_update
    get :component_update
    assert_response :redirect
    assert_redirected_to REDIRECT_TO_MAIN
  end

  def test_component_update_xhr
    xhr :get, :component_update
    assert_response :success
    assert_template '<%= base_controller_file_path %>/component'
    <%= plural_name %> = check_attrs(%w(<%= plural_name %>))
    assert_equal <%= class_name %>.find(:all).length, <%= plural_name %>.length, "Incorrect number of <%= plural_name %> shown"
  end

  def test_create
  	<%= singular_name %>_count = <%= class_name %>.find(:all).length
    post :create, {:<%= singular_name %> => NEW_<%= singular_name.upcase %>}
    <%= singular_name %>, successful = check_attrs(%w(<%= singular_name %> successful))
    assert successful, "Should be successful"
    assert_response :redirect
    assert_redirected_to REDIRECT_TO_MAIN
    assert_equal <%= singular_name %>_count + 1, <%= class_name %>.find(:all).length, "Expected an additional <%= class_name %>"
  end

  def test_create_xhr
  	<%= singular_name %>_count = <%= class_name %>.find(:all).length
    xhr :post, :create, {:<%= singular_name %> => NEW_<%= singular_name.upcase %>}
    <%= singular_name %>, successful = check_attrs(%w(<%= singular_name %> successful))
    assert successful, "Should be successful"
    assert_response :success
    assert_template 'create.rjs'
    assert_equal <%= singular_name %>_count + 1, <%= class_name %>.find(:all).length, "Expected an additional <%= class_name %>"
  end

  def test_update
  	<%= singular_name %>_count = <%= class_name %>.find(:all).length
    post :update, {:id => @first.id, :<%= singular_name %> => @first.attributes.merge(NEW_<%= singular_name.upcase %>)}
    <%= singular_name %>, successful = check_attrs(%w(<%= singular_name %> successful))
    assert successful, "Should be successful"
    <%= singular_name %>.reload
   	NEW_<%= singular_name.upcase %>.each do |attr_name|
      assert_equal NEW_<%= singular_name.upcase %>[attr_name], <%= singular_name %>.attributes[attr_name], "@<%= singular_name %>.#{attr_name.to_s} incorrect"
    end
    assert_equal <%= singular_name %>_count, <%= class_name %>.find(:all).length, "Number of <%= class_name %>s should be the same"
    assert_response :redirect
    assert_redirected_to REDIRECT_TO_MAIN
  end

  def test_update_xhr
  	<%= singular_name %>_count = <%= class_name %>.find(:all).length
    xhr :post, :update, {:id => @first.id, :<%= singular_name %> => @first.attributes.merge(NEW_<%= singular_name.upcase %>)}
    <%= singular_name %>, successful = check_attrs(%w(<%= singular_name %> successful))
    assert successful, "Should be successful"
    <%= singular_name %>.reload
   	NEW_<%= singular_name.upcase %>.each do |attr_name|
      assert_equal NEW_<%= singular_name.upcase %>[attr_name], <%= singular_name %>.attributes[attr_name], "@<%= singular_name %>.#{attr_name.to_s} incorrect"
    end
    assert_equal <%= singular_name %>_count, <%= class_name %>.find(:all).length, "Number of <%= class_name %>s should be the same"
    assert_response :success
    assert_template 'update.rjs'
  end

  def test_destroy
  	<%= singular_name %>_count = <%= class_name %>.find(:all).length
    post :destroy, {:id => @first.id}
    assert_response :redirect
    assert_equal <%= singular_name %>_count - 1, <%= class_name %>.find(:all).length, "Number of <%= class_name %>s should be one less"
    assert_redirected_to REDIRECT_TO_MAIN
  end

  def test_destroy_xhr
  	<%= singular_name %>_count = <%= class_name %>.find(:all).length
    xhr :post, :destroy, {:id => @first.id}
    assert_response :success
    assert_equal <%= singular_name %>_count - 1, <%= class_name %>.find(:all).length, "Number of <%= class_name %>s should be one less"
    assert_template 'destroy.rjs'
  end

protected
	# Could be put in a Helper library and included at top of test class
  def check_attrs(attr_list)
    attrs = []
    attr_list.each do |attr_sym|
      attr = assigns(attr_sym.to_sym)
      assert_not_nil attr,       "Attribute @#{attr_sym} should not be nil"
      assert !attr.new_record?,  "Should have saved the @#{attr_sym} obj" if attr.class == ActiveRecord
      attrs << attr
    end
    attrs.length > 1 ? attrs : attrs[0]
  end
end
