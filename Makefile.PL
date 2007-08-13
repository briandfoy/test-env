# $Id$
use ExtUtils::MakeMaker;

eval "use Test::Manifest 1.14";

WriteMakefile
	(
	'NAME'           => 'Test::Env',
	'ABSTRACT'       => 'Test the environment',
	'VERSION_FROM'   => 'lib/Env.pm',
	'LICENSE'        => 'perl',
	'AUTHOR'         => 'brian d foy <bdfoy@cpan.org>',
	
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

