## Below functions will cache the matrix inversion function

## Below function create a cached matrix object for inverse matrix
makeCacheMatrix <-function(x=matrix())
{

	invMatval<-NULL

	list(
		getMatrix=function(){ x},
		setMatrix = function(val){ x<<-val},
		getInvMatrix = function() {invMatval},
		setInvMatrix = function(val) {invMatval<<-val} 
	)	
}

##below function will return the cached inv matrix if it already exsist.
##otherwise, it calculates the inv matrix and caches the value before returning 
cacheSolve<-function(x,...)
{
	Invmat<-x$getInvMatrix()
	if (!is.null(Invmat)){
		message("geting cached data")
		return (Invmat)
	}
	data<-x$getMatrix()
	Invmat<-solve(data)
	x$setInvMatrix(Invmat)
	Invmat	
}