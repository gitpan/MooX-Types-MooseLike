
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Moose Like Types for Moo",
  "AUTHOR" => "Mateu X Hunter <hunter\@missoula.org>",
  "BUILD_REQUIRES" => {
    "English" => 0,
    "File::Find" => 0,
    "File::Temp" => 0,
    "IO::Handle" => 0,
    "Moo" => 0,
    "Test::Fatal" => 0,
    "Test::More" => 0,
    "perl" => "5.006",
    "warnings" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "MooX-Types-MooseLike",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "MooX::Types::MooseLike",
  "PREREQ_PM" => {
    "Data::Dumper::Concise" => 0,
    "Exporter" => 0,
    "List::Util" => 0,
    "Scalar::Util" => 0,
    "Sub::Quote" => 0,
    "base" => 0,
    "strict" => 0,
    "strictures" => 1
  },
  "VERSION" => "0.02",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



