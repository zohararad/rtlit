$LOAD_PATH.unshift File.dirname(__FILE__) + '/../lib'
require 'test/unit'
require 'rtlit'

class FileConversion < Test::Unit::TestCase

  def setup
  end

  def teardown
  end

  def test_file_conversion
    path = File.dirname(__FILE__)
    ltr_css = File.open(File.join(path,'assets/ltr.css'),'r'){ |f| f.read }
    rtl_css = File.open(File.join(path,'assets/rtl.css'),'r'){ |f| f.read }
    converted_css = RTLit::Converter.to_rtl ltr_css
    assert_equal rtl_css, converted_css, 'file conversion failed'
  end

end