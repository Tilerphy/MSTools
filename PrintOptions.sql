declare @options int

select @options = @@OPTIONS

print @options
if ( (1 & @options) = 1 ) print 'DISABLE_DEF_CNST_CHK'
if ( (2 & @options) = 2 ) print 'IMPLICIT_TRANSACTIONS'
if ( (4 & @options) = 4 ) print 'CURSOR_CLOSE_ON_COMMIT'
if ( (8 & @options) = 8 ) print 'ANSI_WARNINGS'
if ( (16 & @options) = 16 ) print 'ANSI_PADDING'
if ( (32 & @options) = 32 ) print 'ANSI_NULLS'
if ( (64 & @options) = 64 ) print 'ARITHABORT'
if ( (128 & @options) = 128 ) print 'ARITHIGNORE'
if ( (256 & @options) = 256 ) print 'QUOTED_IDENTifIER'
if ( (512 & @options) = 512 ) print 'NOCOUNT'
if ( (1024 & @options) = 1024 ) print 'ANSI_NULL_DFLT_ON'
if ( (2048 & @options) = 2048 ) print 'ANSI_NULL_DFLT_OFF'
if ( (4096 & @options) = 4096 ) print 'CONCAT_NULL_YIELDS_NULL'
if ( (8192 & @options) = 8192 ) print 'NUMERIC_ROUNDABORT'
if ( (16384 & @options) = 16384 ) print 'XACT_ABORT' 