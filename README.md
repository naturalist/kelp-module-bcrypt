# TITLE

Kelp::Module::Bcrypt - Bcrypt your passwords

# SYNOPSIS

```perl
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
```

# TITLE

This module adds bcrypt to your Kelp app

# REGISTERED METHODS

## bcrypt( $text, $settings )

Returns the bcrypted `$text`. If the settings are not provided, it will
use the options in the configuration.

# AUTHOR

Stefan G - mimimal <at< cpan.org

```perl
```

# SEE ALSO

[Kelp](http://search.cpan.org/perldoc?Kelp), [Crypt::Eksblowfish::Bcrypt](http://search.cpan.org/perldoc?Crypt::Eksblowfish::Bcrypt)

# LICENSE

Perl
