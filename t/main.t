use Test::More;
use Kelp;

my $app = Kelp->new;
ok $app->can('bcrypt');


done_testing;


