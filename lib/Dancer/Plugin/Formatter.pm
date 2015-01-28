package Dancer::Plugin::Formatter;

our @ISA = qw();
our $VERSION = '0.02';

use strict;
use warnings;

use Dancer ':syntax';
use Dancer::Plugin;

use Date::Parse;
use POSIX;
use Data::Dumper::Perltidy;

# TODO Format should be chosen from user/locale settings
our $default_date_format = 'dd.mm.yyyy'; # handmade
our $default_time_format = '%c'; # strftime


register 'format_date' => sub {
    my $format = shift // $default_date_format;
	return sub {
		# Quick and dirty date formatter:
		# YYYY-MM-DD to MM.DD.YYYY
		my @parts = split /\D/, shift;

		# Reorder parts
		return join '.', @parts[2, 1, 0] if $format eq 'dd.mm.yyyy';
		return join '/', @parts[1, 2, 0] if $format eq 'mm/dd/yyyy';
		# else
		# fallback to yyyy-mm-dd
		return join '-', @parts[0, 1, 2];
	}
};

register 'set_default_date_format' => sub {
    $default_date_format = shift;
    return;
};

register 'format_time' => sub {
    my $format = shift // $default_time_format;
	return sub {
		my @parts = map { $_ //= 0 } strptime shift;
		# undefined parts set to 0 to prevent error
		# Use of uninitialized value in subroutine entry
		return POSIX::strftime $format, @parts;
	}
};

register 'set_default_time_format' => sub {
    $default_time_format = shift;
    return;
};


register 'format' => sub {
	my $format = shift;
	return sub {
		return sprintf $format, @_;
	};
};

register_plugin;

1;

__END__

=head1 NAME

Dancer::Plugin::Formatter - Data formatter for Dancer

=head1 VERSION

version 0.02

=head1 DESCRIPTION

Provides an easy way to reformat time/date and other data in templates.

=head1 CONFIGURATION

In your configuration file, make sure you have enable this plugin.
You can list options right here:

  plugins:
    Formatter:
      default_time_format: "%a, %x - %X"

or default format can be changed later:

  # in code
  $Dancer::Plugin::Formatter::default_time_format = '%Y%m%d';

  # in template
  : set_default_date_format('%Y%m%d');

=head1 USAGE

  # in template
  <: $today | format_date()  :><!-- use default date/time format -->
  <: $e     | format('%.7f') :><!-- sprintf's format rules -->

=head1 METHODS

=head2 format

Format string or number by the usual "printf" conventions
of the C library function "sprintf".
See L<sprintf>, L<sprintf(3)> or L<printf(3)> on your system
for an explanation of the general principles.

Example:

	<: $pi | format('%.4f') :>

will may return C<3.1416>.

=head2 format_time

Parse provided date/time via C<L<Date::Parse>::strptime> and print it as arbitrary string.
See L<strftime(3)> for format explanation.

    format_time('21/dec/42 17:05', '%Y, %e %B, %A');

or

    <% date('2015-01-25') %>
    <% $date_variable | date %>

Input can have any format which recognized by L<Date::Parse>:

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

=head2 set_default_time_format

Sets default date format.

    set_default_time_format('%m/%d/%y')

See L<strftime(3)> for format explanation.

=head2 DEPRECATED METHODS

=head3 format_date

Changes format of provided date.

    format_date('2015-01-25');

or

    <% date('2015-01-25') %>
    <% $date_variable | date %>

Input should be a ISO 8601 date - C<YYYY-MM-DD>.

=head3 set_default_date_format

Sets default date format.

    set_default_date_format('mm/dd/yyyy')

Available values: C<'dd.mm.yyyy'>, C<'mm/dd/yyyy'>, C<'yyyy-mm-dd'>.
Please feel free to suggest other formats to me - see below.

=head1 CONTRIBUTING

This module is developed on Github at:

L<http://github.com/shoorick/dancer-plugin-formatter>

=head1 BUGS

Please report any bugs or feature requests
to C<bug-dancer-plugin-formatter at rt.cpan.org>, or through the web interface
at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Dancer-Plugin-Formatter>
or to Github at L<https://github.com/shoorick/dancer-plugin-formatter/issues>

I will be notified, and then
you'll automatically be notified of progress on your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Dancer::Plugin::Formatter

You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Dancer-Plugin-Formatter>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Dancer-Plugin-Formatter>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Dancer-Plugin-Formatter>

=item * Search CPAN

L<http://search.cpan.org/dist/Dancer-Plugin-Formatter/>

=item * Public repository at github

L<https://github.com/shoorick/dancer-plugin-formatter>

=back

=head1 SEE ALSO

L<Dancer>,
L<POSIX>, L<strftime(3)>,
L<sprintf>, L<sprintf(3)> or L<printf(3)>

=head1 COPYRIGHT AND LICENSE

Copyright 2015 Alexander Sapozhnikov
E<lt>shoorick@cpan.orgE<gt> L<http://shoorick.ru>

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl programming language system itself.

See L<http://dev.perl.org/licenses/> for more information.

=cut
