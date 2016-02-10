#!perl
use strict;
use warnings;
use utf8;
use 5.010;

use Mojo::Pg;

# Create a table
my $pg = Mojo::Pg->new('postgresql://postgres@/test');
$pg->db->query('create table names (id serial primary key, name text)');
