game <- function()
{
  a <- 5
  b <- 10
  try <- 0
  Ended = FALSE
  winner = ''
  
  while(!Ended)
  {
    if(rbinom(1, 1, 0.5))
    {
      a = a+1
      b = b-1
    }else
    {
      b = b+1
      a = a-1
    }
    try = try + 1
    
    if(a == 15 || b == 15)
      Ended = TRUE
  }
  
  if(a == 15)
    winner = 0
  else
    winner = 1
  
  return (c(winner, try))
}

a <- 0
b <- 0
tries <- numeric(length = 1e3)
for(i in 1:1e3)
{
  result <- game()
  if(result[1] == 0)
    a = a+1
  else
    b = b+1
  
  tries[i] = result[2]
}

probA <- a/1e3
probB <- b/1e3

hist(tries)