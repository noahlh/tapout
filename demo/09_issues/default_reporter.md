## Default Reporter

### Issue #1 - tapout not defaulting output with minitap and minitest

#### Report Summary

Using minitap 0.3.0 and tapout 0.3.0 together, the command:

    rake -q test | tapout

results in a stacktrace. This goes away if you actually specify a report
style to output.  It seems the default dotprogress selection is getting
lost somehow.

See http://github.com/rubyworks/tapout/issues/1.

#### Problem

Each parser sets a default reporter name on it's own if no
name is given. But they were using an old name for the `dot`
reporter which caused this bug:

    format = options[:format] || 'dotprogess'

The dotprogress reporter was renamed to `dot` in the 0.3 release.

#### Solution

Instead of having each parser worry about setting the default
we can let the factory method do it when `nil` is passed as an
argument.

    reporter = Tapout::Reporters.factory(nil)

    reporter #=> Tapout::Reporters::DotReporter

