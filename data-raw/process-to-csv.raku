#!/usr/bin/env raku

my @nodes = "Padgett-Florentine-Families_nodes.txt".IO.lines();

my %id-for-family;
for @nodes[1..*] -> $node {
    my ($id,$family) = $node.split(/\s+/);
    %id-for-family{$id} = $family;
}

my @edges = "Padgett-Florentine-Families_multiplex.edges".IO.lines();
my @links;
@links.push: ["Family1","Family2"];
for @edges -> $edge-line {
    my ($foo,$id1,$id2) = $edge-line.split(/\s+/);
    @links.push: [%id-for-family{$id1},%id-for-family{$id2}];
}

say (@links.map: *.join(",")).join: "\n";


