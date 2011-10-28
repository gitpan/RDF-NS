use strict;
use warnings;
use Test::More;

use RDF::NS;

# this should never change
my $rdf  = 'http://www.w3.org/1999/02/22-rdf-syntax-ns#';
my $rdfs = 'http://www.w3.org/2000/01/rdf-schema#';

# get some prefixed URIs
my $ns = RDF::NS->new('20111028');

is( $ns->rdf, $rdf, '$ns->rdf' );
is( $ns->rdf_type, $rdf.'type', '$ns->rdf_type' );
is( $ns->rdf_type('x'), $rdf.'type', '$ns->rdf_type' );
is( $ns->rdf('f-o'), $rdf."f-o", '$ns->rdf("f-o")' );
is( $ns->rdf(0), $rdf."0", '$ns->rdf("0")' );

is( $ns->URI("rdf:type"), $rdf.'type', '$ns->URI("rdf:type")' );
is( $ns->URI("rdf_type"), $rdf.'type', '$ns->URI("rdf_type")' );

# scalar context
is( $ns->SPARQL('rdf'), "PREFIX rdf: <$rdf>", 'SPARQL("rdf")' );
is( $ns->TTL('rdfs'), "\@prefix rdfs: <$rdfs> .", 'TTL("rdfs")' );
# order is relevant
is( $ns->XMLNS('rdfs,rdf'), "xmlns:rdfs=\"$rdfs\"" );
is( $ns->XMLNS('rdf,rdfs'), "xmlns:rdf=\"$rdf\"" );

my $sparql = ["PREFIX rdf: <$rdf>","PREFIX rdfs: <$rdfs>"];
my $turtle = ["\@prefix rdf: <$rdf> .","\@prefix rdfs: <$rdfs> ."];
my $xmlns  = ["xmlns:rdf=\"$rdf\"","xmlns:rdfs=\"$rdfs\""];

# list context
my @args = (['rdfs','rdf'],['rdf|rdfs'],['rdf,xxxxxx','rdfs'],['rdfs  rdf']);
foreach (@args) {
    my @list = $ns->SPARQL(@$_);
    is_deeply( \@list, $sparql, 'SPARQL(...)' );
    @list= $ns->TTL(@$_);
    is_deeply( \@list, $turtle, 'TTL(...)' );
    @list= $ns->XMLNS(@$_);
    is_deeply( \@list, $xmlns, 'XMLNS(...)' );
}

my %s = $ns->SELECT('rdfs,xx','rdf');
is_deeply( \%s, { rdfs => $rdfs, rdf => $rdf }, 'SELECT (list)' );

my $first = $ns->SELECT('xxxxx,,rdf');
is( $first, $rdf, 'SELECT (scalar)' );

done_testing;
