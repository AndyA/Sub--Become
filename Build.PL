use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name       => 'Sub::Become',
    license           => 'perl',
    dist_author       => 'Andy Armstrong <andy@hexten.net>',
    dist_version_from => 'lib/Sub/Become.pm',
    requires          => {
        'Test::More' => 0,
    },
    add_to_cleanup => ['Sub-Become-*'],
);

$builder->create_build_script();
