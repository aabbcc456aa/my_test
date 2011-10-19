require File.dirname(__FILE__) + '<%= '/..' * class_nesting_depth %>/../test_helper'

class <%= class_name %>Test < Test::Unit::TestCase
  fixtures :<%= plural_name %>

	NEW_<%= singular_name.upcase %> = {}	# e.g. {:name => 'Test <%= class_name %>', :description => 'Dummy'}
	REQ_ATTR_NAMES 			 = %w( ) # name of fields that must be present, e.g. %(name description)
	DUPLICATE_ATTR_NAMES = %w( ) # name of fields that cannot be a duplicate, e.g. %(name description)

  def setup
    # Retrieve fixtures via their name
    # @first = <%= plural_name %>(:first)
  end

  def test_raw_validation
    <%= singular_name %> = <%= class_name %>.new
    if REQ_ATTR_NAMES.blank?
      assert <%= singular_name %>.valid?, "<%= class_name %> should be valid without initialisation parameters"
    else
      # If <%= class_name %> has validation, then use the following:
      assert !<%= singular_name %>.valid?, "<%= class_name %> should not be valid without initialisation parameters"
      REQ_ATTR_NAMES.each {|attr_name| assert <%= singular_name %>.errors.invalid?(attr_name.to_sym), "Should be an error message for :#{attr_name}"}
    end
  end

	def test_new
    <%= singular_name %> = <%= class_name %>.new(NEW_<%= singular_name.upcase %>)
    assert <%= singular_name %>.valid?, "<%= class_name %> should be valid"
   	NEW_<%= singular_name.upcase %>.each do |attr_name|
      assert_equal NEW_<%= singular_name.upcase %>[attr_name], <%= singular_name %>.attributes[attr_name], "<%= class_name %>.@#{attr_name.to_s} incorrect"
    end
 	end

	def test_validates_presence_of
   	REQ_ATTR_NAMES.each do |attr_name|
			tmp_<%= singular_name %> = NEW_<%= singular_name.upcase %>.clone
			tmp_<%= singular_name %>.delete attr_name.to_sym
			<%= singular_name %> = <%= class_name %>.new(tmp_<%= singular_name %>)
			assert !<%= singular_name %>.valid?, "<%= class_name %> should be invalid, as @#{attr_name} is invalid"
    	assert <%= singular_name %>.errors.invalid?(attr_name.to_sym), "Should be an error message for :#{attr_name}"
    end
 	end

	def test_duplicate
    current_<%= singular_name %> = <%= class_name %>.find_first
   	DUPLICATE_ATTR_NAMES.each do |attr_name|
   		<%= singular_name %> = <%= class_name %>.new(NEW_<%= singular_name.upcase %>.merge(attr_name.to_sym => current_<%= singular_name %>[attr_name]))
			assert !<%= singular_name %>.valid?, "<%= class_name %> should be invalid, as @#{attr_name} is a duplicate"
    	assert <%= singular_name %>.errors.invalid?(attr_name.to_sym), "Should be an error message for :#{attr_name}"
		end
	end
end

