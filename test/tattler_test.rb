require 'test_helper'

class DummyController < ActionController::Base
  def index
  end
  
  def json
  end
end

class TattlerTest < ActionController::TestCase
  tests DummyController
  test "should insert comment" do
    get :index
    expected = <<-_HTML
<!-- TEMPLATE: views/dummy/index.html.erb -->
<!-- TEMPLATE: views/dummy/_some_partial.erb -->
Here is a partial
<!-- ENDTEMPLATE: views/dummy/_some_partial.erb -->
<!-- ENDTEMPLATE: views/dummy/index.html.erb -->
    _HTML
    assert_equal expected.strip, @response.body
  end
  
  test "should not affect json documents" do
    get :json, :format => 'json'
    assert_equal '{"foo": bar}', @response.body
  end
end
