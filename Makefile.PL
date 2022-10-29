use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
    NAME              => 'Dancer::Plugin::Formatter',
    VERSION_FROM      => 'lib/Dancer/Plugin/Formatter.pm', # finds $VERSION
    PREREQ_PM         => {
        'Dancer'         => 1,
        'Dancer::Plugin' => 1,
        'POSIX'          => 0,
        'Date::Parse'    => 0,
    },
    TEST_REQUIRES => {
        'Test::More'   => 0,
    },
    META_MERGE => {
        'meta-spec' => { version => 2 },
        dynamic_config => 0,
        resources => {
          repository => {
              url => 'https://github.com/shoorick/dancer-plugin-formatter.git',
              web => 'https://github.com/shoorick/dancer-plugin-formatter',
              type => 'git',
          },
          bugtracker => {
              mailto => 'bug-Dancer-Plugin-Formatter@rt.cpan.org',
              web => 'https://rt.cpan.org/Public/Dist/Display.html?Name=Dancer-Plugin-Formatter',
          },
        },
      },
    },
    ($] >= 5.005 ?     ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM  => 'lib/Dancer/Plugin/Formatter.pm', # retrieve abstract from module
       AUTHOR         => 'Alexander Sapozhnikov <shoorick@cpan.org>') : ()),
);
