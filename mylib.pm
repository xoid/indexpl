package mylib;

my $debug=1;
my $dbh; BEGIN { $dbh = dbh(); }

sub dbh 
{

    $dbh = DBI->connect_cached( connect("DBI:mysql:indexpl", 'indexpl', 'indexpl' ) or warn 'dbh: Cant connect mysql';
	return $dbh;
}

sub sql_row
{
	my $sql = shift;
	warn "sql: $sql" if $debug; 
	return $dbh->selectall_arrayref($sql) or warn 'sql_row: Cant selectall_arrayref';
}

sub title
{
	my $sql = 'SELECT title FROM post WHERE url=$url';
	return sql($sql);
}

sub all_tags
{
	my $sql = 'SELECT DISTINCT tag FROM tag_post_lnk';
	return sql($sql);
}

sub tags
{
	my $post_id = shift;
	my $sql = 'SELECT tag FROM tag_post_lnk WHERE post_id = ?';
	return sql($sql, $post_id);
}


sub text
{
	return sql('SELECT * FROM post WHERE post_id=?', shift);
}


1;
