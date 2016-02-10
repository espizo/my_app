package MyApp;
use Mojo::Base "Mojolicious";


sub startup {
  my $self = shift;
  $self->plugin(Swagger2 => { url => $self->home->rel_file("api.json") });

    my $r = $self->routes;
    $r->get('/' => sub { shift->redirect_to('posts') });
#    $r->get('/pets')->to('pets#list');
#    $r->get('/pets/:id')->to('pets#show')->name('show_pets');
#    $r->get('/posts/create')->to('post#create')->name('create_post');

      require Swagger2::Editor;
    my $editor = Swagger2::Editor->new(specification_file => $self->home->rel_file('api.json'));
    $r->route('/editor')->detour(app => $editor);
}


1;
