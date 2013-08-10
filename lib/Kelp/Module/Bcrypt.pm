package Kelp::Module::Bcrypt;

use Kelp::Base 'Kelp::Module';
use Crypt::Eksblowfish::Bcrypt qw(bcrypt en_base64);

our $VERSION = 0.1;

sub build {
    my ( $self, %args ) = @_;

    my $cost = sprintf( '%02d', $args{cost} // 6 );
    my $salt = $args{salt} // do {
        my $num = 999999;
        my $rnd = crypt( rand($num), rand($num) ) . crypt( rand($num), rand($num) );
        en_base64( substr( $rnd, 4, 16 ) );
    };
    my $_set = join( '$', '$2a', $cost, $salt );

    $self->register(
        bcrypt => sub {
            my ( $app, $text, $settings ) = @_;
            return bcrypt( $text, $settings // $_set );
        }
    );
}

1;

__END__

=pod

=head1 TITLE

Kelp::Module::Bcrypt - Bcrypt your passwords

=head1 SYNOPSIS

    # conf/config.pl
    {
        modules_init => {
            Bcrypt => {
                cost => 6,
                salt => 'secret salt passphrase'
            }
        };
    };

    # lib/MyApp.pm
    ...

      sub some_soute {
        my $self             = shift;
        my $crypted_password = $self->bcrypt($plain_password);
    }

    sub another_route {    # Maybe a bridge?
        my $self = shift;
        if ( $self->bcrypt($plain_password) eq $crypted_passwrod ) {
            ...;
        }
    }

=head1 TITLE

This module adds bcrypt to your Kelp app

=head1 REGISTERED METHODS

=head2 bcrypt( $text, $settings )

Returns the bcrypted C<$text>. If the settings are not provided, it will
use the options in the configuration.

=head1 AUTHOR

Stefan G - mimimal E<lt>atE<lt> cpan.org


=head1 SEE ALSO

L<Kelp>, L<Crypt::Eksblowfish::Bcrypt>

=head1 LICENSE

Perl

=cut
