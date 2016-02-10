package MyApp::Controller::Pet;
use Mojo::Base 'Mojolicious::Controller';

our $PETS = [
    { id => 123, name => 'cat' },
    { id => 456, name => 'dog' },
];

sub list {
  my ( $self, $args, $cb ) = @_;
  $self->$cb( $PETS, 200 );
}


sub show {
  my ( $self, $args, $cb ) = @_;
  my ( $entry ) = grep { $_->{id} == $args->{id} } @$PETS;
  return $self->$cb( $entry, 200 ) if $entry;
  return $self->$cb( { errors => [ { message => 'Pet not found.', path => '/id' } ] }, 404 );
}

1;
