# $Id$
use ExtUtils::MakeMaker;

sub ExtUtils::MM_Any::test_via_harness
	{
    my($self, $perl, $tests) = @_;

    return qq|\t$perl "-MTest::Manifest" | .
           qq|"-e" "run_t_manifest(\$(TEST_VERBOSE), '\$(INST_LIB)', | .
           qq|'\$(INST_ARCHLIB)')"\n|;
	}
	
WriteMakefile
        (
        'NAME'           => 'Test::Env',
        'ABSTRACT'       => 'Test the environment',
        'VERSION_FROM'   => 'lib/Env.pm',
 		'PREREQ_PM'      => {
 			'File::Find::Rule'      => '0',
 			'Test::Builder'         => '0',
 			'Test::Builder::Tester' => '0',
 			'Test::Manifest'        => '0.9',
  			'Test::More'            => '0',
			'Test::Pod'             => '0',
 			'Test::Prereq'          => '0.14',
 			},
        'PM' => {
            'lib/Env.pm'     => '$(INST_LIBDIR)/Env.pm',
			},
        'MAN3PODS' =>
        	{
        	'lib/Env.pm' => '$(INST_MAN3DIR)/Test::Env.3',
        	},

        clean  => { FILES    => 'Test-Env-*' },
        );

