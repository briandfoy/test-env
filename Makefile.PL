# $Id$
use ExtUtils::MakeMaker;

WriteMakefile
        (
        'NAME'      => 'Test::Env',
        'ABSTRACT'  => 'Test the environment',
        'VERSION'   => '0.5_01',
 		'PREREQ_PM' => {
 			'Test::Pod'             => 0,
 			'Test::Manifest'        => 0,
 			'Test::Builder'         => 0,
 			'Test::More'            => 0,
 			'Test::Builder::Tester' => 0,
 			},
        'PM' => 
        	{
            'lib/Env.pm'     => '$(INST_LIBDIR)/Env.pm',
			},
 
 		depend => { Makefile => 't/test_manifest' },
        test   => { TESTS => eval {
        	require Test::Manifest;
        	scalar Test::Manifest::get_t_files();
        	} }
        );

