# Dancer::Plugin::Formatter
Dancer::Plugin::Formatter - Dancer plugin to format data inside templates

## Description

This plugin defines several formattrers which can be used as filters in templates.

## Synopsis

In your configuration, make sure you have enable this plugin.

Use methods of plugin as function or filter in you template. Here is example for Xslate with Kolon syntax:

    Today is <: $today | format_date :>
    : if format_date($yesterday) { # ...

## Methods

### format_date

Format date according to default format

### set_default_date_format

Set default format of date. Available values: `'dd.mm.yyyy'`, '`mm/dd/yyyy'`, `'yyyy-mm-dd'`

## Support

You can find documentation for this module with the `perldoc` command.

    perldoc Dancer::Plugin::Formatter

You can also look for information at:

- RT: CPAN's request tracker  
http://rt.cpan.org/NoAuth/Bugs.html?Dist=Dancer-Plugin-Formatter

- AnnoCPAN: Annotated CPAN documentation  
http://annocpan.org/dist/Dancer-Plugin-Formatter

- CPAN Ratings  
http://cpanratings.perl.org/d/Dancer-Plugin-Formatter

- Search CPAN  
http://search.cpan.org/dist/Dancer-Plugin-Formatter/

- Public repository at github  
https://github.com/shoorick/dancer-plugin-formatter

## Licence

This module is free software and is published under the same terms as Perl itself.

## Author

Alexander Sapozhnikov  
<shoorick@cpan.org>  
http://shoorick.ru
