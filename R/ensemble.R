

#=================================================================================#
#                             RANDOM MATRIX ENSEMBLES
#=================================================================================#

# Random matrix ensemble
## FIX: generalize to multiple arguments rather than just dimensions, accounting for defaults
RME <- function(mat_type, args, ensemble_size){
  # If the mat_type entry is not the function itself, parse the mat_type string
  if(class(mat_type) == "function"){fxn <- mat_type}
  else{fxn <- .parse_matString(mat_type)}
  # Replicate with appopriate number of arguments by using parse_args
  ensemble <- replicate(n = ensemble_size, expr = .parse_args(fxn, args), simplify = F)
  # Return the ensemble
  ensemble
}

#=================================================================================#
#                                  LOW-LEVEL
#=================================================================================#


.parse_args <- function(fxn, args){
  # Get number of arguments
  n_args <- length(args)
  if(n_args == 1){return(fxn(args[[1]]))}
  if(n_args == 2){return(fxn(args[[1]], args[[2]]))}
  if(n_args == 3){return(fxn(args[[1]], args[[2]], args[[3]]))}
  if(n_args == 4){return(fxn(args[[1]], args[[2]], args[[3]], args[[4]]))}
  if(n_args == 5){return(fxn(args[[1]], args[[2]], args[[3]], args[[4]], args[[5]]))}
  if(n_args == 6){return(fxn(args[[1]], args[[2]], args[[3]], args[[4]], args[[5]], args[[6]]))}
}

# Take a list of arguments, and an index holding a vector to properly return a vector of the arguments
# Steps: get the length of the vector argument, then do args[[i]][j] for j in 1:len(vec)
#vector_arg <- function(args, index){NA}

# Elementary matrix type string parser
# FUTURE: develop to enable string subsets to be appopriately parsed.
.parse_matString <- function(type_str){
  # Basic lexicon of string interpretation
  normal_str <- c("Normal", "normal","norm","n","N")
  stoch_str <- c("Stochastic","stochastic", "stoch", "st", "s", "S")
  erdos_str <- c("Erdos","erdos","er","e", "ER", "E")
  # Test whether its normal
  if(type_str %in% normal_str){return(RM_norm)}
  # Test whether its stochastic
  if(type_str %in% stoch_str){return(RM_stoch)}
  # Test whether its an Erdos-Renyi walk
  if(type_str %in% erdos_str){return(RM_erdos)}
  # If all conditions fail, return NA
  else{warning("Matrix not found.")}
}

#=================================================================================#
#                                  EXPERIMENTAL
#=================================================================================#

# Arbitrary stacker function which returns a stacked array of the results
# Dimensions to ensure correct sizing, or unnecessary?
# Argument array conventions?
#stacker <- function(fxn, args, iter, dimensions){
# stack <- fxn(args[1,]) # Initialize the array
# for(i in 2:iter){ # Iterate over the rest of the argument array
#   curr <- fxn(args[i,])
#   stack <- rbind(stack, curr)
# }
# stack # Return the stack
#}

