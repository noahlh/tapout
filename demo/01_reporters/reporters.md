## Reporters

Using the following TAP-Y sample:

    ---
    type: suite
    start: '2011-10-06 18:48:08'
    count: 3
    seed: 36440
    rev: 2
    ---
    type: case
    subtype: ''
    label: ExampleTestCase
    level: 0
    ---
    type: test
    subtype: ''
    status: error
    label: test_error
    exception:
      message: ! 'RuntimeError:'
      file: example.rb
      line: 10
      snippet:
      - 8: ''
      - 9: ! '  def test_error'
      - 10: ! '    raise'
      - 11: ! '  end'
      - 12: ''
      backtrace:
      - example.rb:10
    time: 0.001054606
    ---
    type: test
    subtype: ''
    status: fail
    label: test_failing
    exception:
      message: ! "Expected: \"1\"\n  Actual: \"2\""
      file: example.rb
      line: 14
      snippet:
      - 12: ''
      - 13: ! '  def test_failing'
      - 14: ! '    assert_equal(''1'', ''2'')'
      - 15: ! '  end'
      - 16: ''
      backtrace:
      - example.rb:14
    time: 0.046170916
    ---
    type: test
    subtype: ''
    status: pass
    label: test_passing
    time: 1.04997403
    ---
    type: tally
    time: 1.000800203
    counts:
      total: 3
      pass: 1
      fail: 1
      error: 1
      omit: 0
      todo: 0
    ...

The dot reporter should run without error.

The progress reporter should run without error.

The html reporter should run without error.

The outline reporter should run without error.

The breakdown reporter should run without error.

The tap reporter should run without error.

The turn reporter should run without error.

The pretty reporter should run without error.

