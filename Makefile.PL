# $Id$
use ExtUtils::MakeMaker;

eval "use Test::Manifest";

unless( $@ )
	{
	* ExtUtils::MM_Any::test_via_harness = sub
		{
		my($self, $perl, $tests) = @_;

		return qq|\t$perl "-MTest::Manifest" | .
			   qq|"-e" "run_t_manifest(\$(TEST_VERBOSE), '\$(INST_LIB)', | .
			   qq|'\$(INST_ARCHLIB)')"\n|;
		}
	}

WriteMakefile
	(
	'NAME'           => 'Test::Env',
	'ABSTRACT'       => 'Test the environment',
	'VERSION_FROM'   => 'lib/Env.pm',
	'PREREQ_PM'      => {
		'Test::Builder'         => '0',
		'Test::Builder::Tester' => '0',
		'Test::More'            => '0',
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

