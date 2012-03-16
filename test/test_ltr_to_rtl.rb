$LOAD_PATH.unshift File.dirname(__FILE__) + '/../lib'
require 'test/unit'
require 'rtlit'

class LtrToRtl < Test::Unit::TestCase

  def setup
  end

  def teardown
  end

  def test_float_left_conversion
    css = 'float: left;'
    rtl_css = RTLit::Converter.to_rtl css
    assert_equal 'float: right;', rtl_css, 'float left conversion failed'
  end

  def test_float_right_conversion
    css = 'float: right;'
    rtl_css = RTLit::Converter.to_rtl css
    assert_equal 'float: left;', rtl_css, 'float right conversion failed'
  end

  def test_text_align_conversion
    css = 'text-align: left;'
    rtl_css = RTLit::Converter.to_rtl css
    assert_equal 'text-align: right;', rtl_css, 'text-align conversion failed'
  end

  def test_left_position_conversion
    css = 'left: 10px;'
    rtl_css = RTLit::Converter.to_rtl css
    assert_equal 'right: 10px;', rtl_css, 'left position conversion failed'
  end

  def test_right_position_conversion
    css = 'right: 10px;'
    rtl_css = RTLit::Converter.to_rtl css
    assert_equal 'left: 10px;', rtl_css, 'right position conversion failed'
  end

  def test_bg_position_conversion
    css = 'background-position: left top;'
    rtl_css = RTLit::Converter.to_rtl css
    assert_equal 'background-position: left top;', rtl_css, 'background position conversion failed'
  end

  def test_margin_left_conversion
    css = 'margin-left: 10px;'
    rtl_css = RTLit::Converter.to_rtl css
    assert_equal 'margin-right: 10px;', rtl_css, 'margin left conversion failed'
  end

  def test_margin_right_conversion
    css = 'margin-right: 10px;'
    rtl_css = RTLit::Converter.to_rtl css
    assert_equal 'margin-left: 10px;', rtl_css, 'margin right conversion failed'
  end

  def test_padding_left_conversion
    css = 'padding-left: 10px;'
    rtl_css = RTLit::Converter.to_rtl css
    assert_equal 'padding-right: 10px;', rtl_css, 'padding left conversion failed'
  end

  def test_padding_right_conversion
    css = 'padding-right: 10px;'
    rtl_css = RTLit::Converter.to_rtl css
    assert_equal 'padding-left: 10px;', rtl_css, 'padding right conversion failed'
  end

  def test_margin_quad_conversion
    css = 'margin: 1px 2px 3px 4px;'
    rtl_css = RTLit::Converter.to_rtl css
    assert_equal 'margin: 1px 4px 3px 2px;', rtl_css, 'margin quad conversion failed'
  end

  def test_padding_quad_conversion
    css = 'padding: 1px 2px 3px 4px;'
    rtl_css = RTLit::Converter.to_rtl css
    assert_equal 'padding: 1px 4px 3px 2px;', rtl_css, 'padding quad conversion failed'
  end

  def test_margin_tri_conversion
    css = 'margin: 1px 2px 3px;'
    rtl_css = RTLit::Converter.to_rtl css
    assert_equal 'margin: 1px 2px 3px;', rtl_css, 'margin tri conversion failed'
  end

  def test_padding_tri_conversion
    css = 'padding: 1px 2px 3px;'
    rtl_css = RTLit::Converter.to_rtl css
    assert_equal 'padding: 1px 2px 3px;', rtl_css, 'padding tri conversion failed'
  end

end