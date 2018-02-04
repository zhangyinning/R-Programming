## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  m<- NULL
  set <- function(y){
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) m <<- solve
  getsolve <- function() m
  list(set = set, get = get, setsolve = setsolve, getsolve = getsolve)
}




## Write a short comment describing this function
# This function gets the cached data of the inversed matrix. If the cached value is null, it apply the solve function and set the cached value to the result. If the cached value exists, then it retrieve the cached value instead of executing solve() function. 
cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m <- x$getsolve()
  n <- x$get()
  if (!is.null(m)) {
    message("retrieving cached data")
    return(m)
  }
  m <- solve(n, ...)
  x$setsolve(m)
  m
}

m1 <- matrix(c(1/2, -1/4, -1, 3/4), nrow = 2, ncol = 2)
m1
aMatrix <- makeCacheMatrix(m1)
cacheSolve(aMatrix)

