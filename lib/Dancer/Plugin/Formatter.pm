package Dancer::Plugin::Formatter;
our $VERSION = '0.01';

use strict;
use warnings;

#use 5.010;

use Dancer ':syntax';
use Dancer::Plugin;

# TODO Format should be chosen from user/locale settings
our $default_date_format = 'dd.mm.yyyy';

# Quick and dirty date formatter:
# YYYY-MM-DD to MM.DD.YYYY
sub _format_date {
	my @parts = split /\D/, shift;
    my $format = $default_date_format; # TODO get from args

	# Reorder parts
	return "$parts[2].$parts[1].$parts[0]" if $format eq 'dd.mm.yyyy';
	return "$parts[1]/$parts[2]/$parts[0]" if $format eq 'mm/dd/yyyy';
	# else
    debug "unknown date format";
	return "$parts[0]-$parts[1]-$parts[2]"; # if format unknown or omitted
}

register 'date' => sub {
    _format_date(@_);
};

register 'format_date' => sub {
    _format_date(@_);
};

register 'set_default_date_format' => sub {
    $default_date_format = shift;
    return;
};

register_plugin;

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Dancer::Plugin::Formatter - Date formatter for Dancer

=head1 VERSION

version 0.01

=head1 SYNOPSIS

    use Dancer ':syntax';
    use Dancer::Plugin::Formatter;

    get '/' => sub {
        template index;
    }

=head1 DESCRIPTION

Provides an easy way to reformat dates.

=head1 METHODS

=head2 date

    format_date('2015-01-25');
or
    <% date('2015-01-25') %>
    <% $date_variable | date %>

Change date format.

=head1 CONFIGURATION

  plugins:
    Formatter:
      default_date_format: "dd.mm.yyyy"

or default format can be changed later:

  # in code
  $Dancer::Plugin::Formatter::default_date_format = 'mm/dd/yyyy';

  # in template
  : set_default_date_format('yyyy-mm-dd');

=head1 CONTRIBUTING

This module is developed on Github at:

L<http://github.com/shoorick/dancer-plugin-formatter>

=head1 BUGS

Please report any bugs or feature requests in github.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Dancer::Plugin::Formatter

=head1 SEE ALSO

L<Dancer>

=head1 AUTHOR

Alexander Sapozhnikov

=head1 LICENSE

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
