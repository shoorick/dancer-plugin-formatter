use 5.014002;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME              => 'Dancer::Plugin::Formatter',
    VERSION_FROM      => 'lib/Dancer/Plugin/Formatter.pm', # finds $VERSION
    PREREQ_PM         => {
        'Dancer'         => 1,
        'Dancer::Plugin' => 1,
    }, # e.g., Module::Name => 1.1
    ($] >= 5.005 ?     ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM  => 'lib/Dancer/Plugin/Formatter.pm', # retrieve abstract from module
       AUTHOR         => 'Alexander Sapozhnikov <shoorick@cpan.org>') : ()),
);
