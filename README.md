# Dancer::Plugin::Formatter
Dancer::Plugin::Formatter - Dancer plugin to format data inside templates

## Description

This plugin defines several formattrers which can be used as filters in templates.

## Synopsis

In your configuration, make sure you have enable this plugin.
You can list options right here:

    plugins:
      Formatter:
        default_time_format: "%a, %x - %X"

or default format can be changed later:

    # in code
    $Dancer::Plugin::Formatter::default_time_format = '%Y%m%d';

    # in template
    : set_default_date_format('%Y%m%d');

Use methods of plugin as function or filter in you template. Here is example for Xslate with Kolon syntax:

    Today is <: $today | format_date() :>
    : if ( format_time($yesterday) =~ /:42/ ) { # ...

## Methods

### format

Format string or number by the usual "printf" conventions
of the C library function "sprintf".
See [sprintf](http://perldoc.perl.org/functions/sprintf.html),
[sprintf(3)](http://man.he.net/man3/sprintf)
or [printf(3)](http://man.he.net/man3/printf) on your system
for an explanation of the general principles.

Example:

	<: $pi | format('%.4f') :>

will may return `3.1416`.

### format_time

Parse provided date/time via [Date::Parse](http://search.cpan.org/perldoc?Date::Parse)`::strptime` and print it as arbitrary string.
See [strftime(3)](http://man.he.net/man3/strftime) for format explanation.

    format_time('21/dec/42 17:05', '%Y, %e %B, %A');

or

    <% date('2015-01-25') %>
    <% $date_variable | date %>

Input can have any format which recognized
by [Date::Parse](http://search.cpan.org/perldoc?Date::Parse):

	1995:01:24T09:08:17.1823213           ISO-8601
	1995-01-24T09:08:17.1823213
	Wed, 16 Jun 94 07:29:35 CST           Comma and day name are optional
	Thu, 13 Oct 94 10:13:13 -0700
	Wed, 9 Nov 1994 09:50:32 -0500 (EST)  Text in ()'s will be ignored.
	21 dec 17:05                          Will be parsed in the current time zone
	21-dec 17:05
	21/dec 17:05
	21/dec/93 17:05
	1999 10:02:18 "GMT"
	16 Nov 94 22:28:20 PST

### format_date

Same as above but default date/time format
stored in `$Dancer::Plugin::Formatter::default_time_format`
and can be changed via `set_default_date_format`.

### set\_default_time\_format

Sets default format for time output.

    set_default_time_format('%m/%d/%y')

See [strftime(3)](http://man.he.net/man3/strftime) for format explanation.

### set\_default_date\_format

Same as above, for `$Dancer::Plugin::Formatter::default_time_format`.

## Support

You can find documentation for this module with the `perldoc` command.

    perldoc Dancer::Plugin::Formatter

You can also look for information at:

- RT: CPAN's request tracker  
[http://rt.cpan.org/NoAuth/Bugs.html?Dist=Dancer-Plugin-Formatter](http://rt.cpan.org/NoAuth/Bugs.html?Dist=Dancer-Plugin-Formatter)

- AnnoCPAN: Annotated CPAN documentation  
[http://annocpan.org/dist/Dancer-Plugin-Formatter](http://annocpan.org/dist/Dancer-Plugin-Formatter)

- CPAN Ratings  
[http://cpanratings.perl.org/d/Dancer-Plugin-Formatter](http://cpanratings.perl.org/d/Dancer-Plugin-Formatter)

- Search CPAN  
[http://search.cpan.org/dist/Dancer-Plugin-Formatter/](http://search.cpan.org/dist/Dancer-Plugin-Formatter/)

- Public repository at github  
[https://github.com/shoorick/dancer-plugin-formatter](https://github.com/shoorick/dancer-plugin-formatter)

## Copyright and licence

Copyright © 2015 Alexander Sapozhnikov <shoorick@cpan.org> [http://shoorick.ru](http://shoorick.ru/)

This module is free software and is published under the same terms as Perl itself.

