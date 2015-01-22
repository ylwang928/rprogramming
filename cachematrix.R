## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
	i <- NULL   # initialize the matrix inversion
    
    
    set <- function(y) {
        x <<- y
        i <<- NULL
    }
    get <- function() x
    setInversion <- function(inversion) i <<- inversion
    getInversion <- function() i
    
    # Return the list
    list(set = set, get = get
         , setInversion = setInversion
         , getInversion = getInversion)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
	i <- x$getInversion()   # get the matrix inversion by calling the function in the list
    
    if (!is.null(i)) {
        # The matrix inversion has been calculated
        message("Getting cached matrix inversion")
        return(i)
    }
    
    # The matrix inversion doesn't exist, we need to calculate it and return it
    data <- x$get()
    i <- solve(data, ...)
    x$setInversion(i)
    i
}