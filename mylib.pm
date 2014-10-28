package mylib;

use Exporter; @ISA = qw(Exporter);
our @EXPORT = qw(d sql);

use DBI; 
use Data::Dumper::Names;
my $debug=1;

my $dbh; 

sub dbh 
{
    $dbh = DBI->connect_cached( "DBI:mysql:indexpl", 'indexpl', 'indexpl' ) or warn 'dbh: Cant connect mysql';
	return $dbh;
}

BEGIN { $dbh = dbh(); }

sub sql
{
	my $sql = shift;
	#warn "sql: $sql" if $debug; 
	return $dbh->selectrow_array($sql) or warn "sql: Cant selectall_array SQL=".$sql.$dbh->errstr();
}

sub title
{
	my $sql = 'SELECT title FROM post WHERE url=?';
	return sql($sql, $url) || 'default title';
}

sub all_tags
{
	my $sql = 'SELECT DISTINCT tag FROM post_tag_lnk';
	return sql($sql);
}

sub tags
{
	my $post_id = shift;
	my $sql = 'SELECT tag FROM post_tag_lnk WHERE post_id = ?';
	return sql($sql, $post_id);
}


sub text
{
	return sql('SELECT text FROM post WHERE id=?', shift);
}

sub d($;$)
{
    #print STDOUT Dumper @_;
    print STDERR Dumper @_;
}


1;
