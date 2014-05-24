## This function is for creating a matrix object that
## can cache its inverse
## Assume that the matrix is inversible

## 	1.	set the value of the matrix
##	2.	get the value of the matrix
##	3.	inverse the matirx
##	4.	get the value of the inversed matrix

makeCacheMatrix <- function(x = matrix()) {
 m <- NULL
 set <- function (y){
 	## The operators <<- and ->> cause a search to made through the ##environment for an existing definition of the variable being assigned. 
 	 
 x <<- y 
 ## search if x exists before,
 ## if x is in cache, then refine it
 ## if x is not in cache, then define it as y
 m <<- NULL
 }
get <- function ()  x
setinver <- function (inverse) m <<- inverse
getinver <- function ()  m
list (set = set, get=get,
setinver=setinver,
getinver=getinver
)

}


## The following function gets the inverse of a matrix, which is
## return by function 'makeCacheMatrix' above.
## if inverse has been calculated, then the function will
## retrive the inverse from the cache

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getinver ()
        if (!is.null(m))  {
        	##which means m exists in the cache 
			message ("getting cached data")
			return (m)
			}
			data <- x$get ()
			m <- solve (data, ...)
			x$setinver(m)
			m                      
}
