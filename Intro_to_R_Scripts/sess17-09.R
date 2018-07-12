# Session 9

#Q1 - a few different ways

factorial0 <- function(x){
	f <- 1
	i <- x
	while( i > 1 ){
		f <- f*i
		i <- i-1
	}
	return(f)
}

factorial0(10)

factorial1 <- function(x){
	f <- 1
	for(i in 1:x){
		f <- f*i
		}
	f # last thing that gets evaluated
}

factorial1(4)

factorial2 <- function(x){
	prod(1:x) }

factorial2(4)

# a recursive definition
factorial3 <- function(x){
	output <- ifelse(x>1, x*factorial3(x-1), 1)
	output
}

factorial3(3)
factorial3(150)

# and the easiest! (it's a standard R function)
factorial(4)

# an application - recall the permutation test using the sleep data
# from Session 5
# From two groups of 10, how many permutations of the labels are there?

factorial1(20)/(factorial(10)*factorial(10))
choose(20,10)

#Q2 

convert.f.to.c <- function(fahr){
	(5/9)*(fahr - 32)
}

mytherm <- data.frame(f=30:100)
mytherm$cels <- convert.f.to.c( mytherm$f )
round(mytherm)

# easy to remember that "16=61"
# which other ones are as easy?

mytherm.r <- round(mytherm)
formatC(mytherm.r$f, 2)
formatC(mytherm.r$cels, 2)

formatC(mytherm.r$cels, 2)[1:10]

charf    <- substr(formatC(mytherm.r$f, width=3), 2, 3)
charcU <- substr(formatC(mytherm.r$cels, width=3), 3,3)
charcT <- substr(formatC(mytherm.r$cels, width=3), 2,2)

charf[1:10]
charcU[1:10]

# the ones that are easy (easier) to remember
for(i in 1:71){
	if(charf[i] == paste(charcU[i], charcT[i], sep="")) print(mytherm.r[i,])
}

# Q3 

newton.raphson <- function(f,fprime,x0,thresh){
  myabsdiff <- Inf
  xold <- x0
  while(myabsdiff>thresh){ # have we converged yet? If no, move;
     xnew <- xold-f(xold)/(fprime(xold))
     myabsdiff <- abs(xnew-xold)
     xold <- xnew
  }
return(xnew)
}

myf <- function(x){ x^2+3*x-5 }
myfprime<-function(x){ 2*x+3 }



newton.raphson(f=myf,fprime=myfprime,x0=10,thresh=0.0001)

newton.raphson(f=myf,fprime=myfprime,x0=-10,thresh=0.0001)

curve(myf, -10, 10)
abline(h=0, lty=2)

f3  <- function(x){ 5*x^3   - 4*x^2 + 12*x - 7 }
f3p <- function(x){ 3*5*x^2 - 2*4*x + 12   - 0 }

curve(f3, -3, 3)
abline(h=0, lty=2)

newton.raphson(f3, f3p, 3, 1E-2)
newton.raphson(f3, f3p, 3, 1E-6)

abline(v = newton.raphson(f3, f3p, 3, 1E-2), lwd=2, col="plum")

# NB R can differentiate;

D( expression(5*x^3   - 4*x^2 + 12*x - 7), "x")

 