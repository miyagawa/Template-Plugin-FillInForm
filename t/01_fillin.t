use strict;
use CGI;
use Template::Test;

my $query = CGI->new({ foo => 'bar', bar => 'baz' });
test_expect(\*DATA, undef, { query => $query });

__END__
--test--
[% USE FillInForm -%]
[% FILTER fillinform fobject => query -%]
<form action="foo" method="POST"><input name="foo" type="text"></form>
[%- END %]
--expect--
<form action="foo" method="POST"><input name="foo" type="text" value="bar"></form>

--test--
[% USE FillInForm -%]
[% FILTER fillinform fdat => { foo => 'foo&' } -%]
<form action="foo" method="POST"><input name="foo" type="text"></form>
[%- END %]
--expect--
<form action="foo" method="POST"><input name="foo" type="text" value="foo&amp;"></form>
