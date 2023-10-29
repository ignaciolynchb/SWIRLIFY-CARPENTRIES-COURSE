mi_progreso <- function(){
  
  # Get the swirl state
  getState <- function(){
    # Whenever swirl is running, its callback is at the top of its call stack.
    # Swirl's state, named e, is stored in the environment of the callback.
    environment(sys.function(1))$e
  }
  
  # Retrieve the log from swirl's state
  getLog <- function(){
    getState()$log
  }
  
  temp <- tempfile()
  log_ <- getLog()
  nrow_ <- max(unlist(lapply(log_, length)))
  log_tbl <- data.frame(user = rep(log_$user, nrow_),
                        course_name = rep(log_$course_name, nrow_),
                        lesson_name = rep(log_$lesson_name, nrow_),
                        question_number = p(log_$question_number, nrow_, NA),
                        correct = p(log_$correct, nrow_, NA),
                        attempt = p(log_$attempt, nrow_, NA),
                        skipped = p(log_$skipped, nrow_, NA),
                        datetime = p(log_$datetime, nrow_, NA),
                        stringsAsFactors = FALSE)
  write.csv(log_tbl, file = temp, row.names = FALSE)
  encoded_log <- base64encode(temp)
  
  temp <- tempfile()
  temp_hasta <- unlist(gregexpr('file', temp))
  r_temp <- substring(temp,1,last=temp_hasta-2)
  fl = list.files(r_temp, full.names = TRUE)
  colnames_esperado <- c("user","course_name","lesson_name","question_number","correct","attempt","skipped","datetime")
  for (i in fl){
    if(tools::file_ext(i)=="" & unlist(gregexpr('graph', i))==-1){
      archivo <- read.csv(i)
      cabezal <- colnames(archivo)
      if(identical(cabezal,colnames_esperado)){
        progreso <- read.csv(i)
        file.copy(from=i, to=paste0(system.file(package = "swirl"),"/Courses/SWIRLIFY-CARPENTRIES-COURSE/Progress"))
        file.remove(i)
      }
    }
  }
progreso$reported_at <- Sys.time()
progreso$group <- mi_grupo
ss <- "1LI-82639iAKy7LrymSFI6Xw_FrjnrOfFUolaCTDAU_g"
googlesheets4::sheet_append(ss, progress, sheet = 1)
}