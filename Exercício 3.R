duracao <- rename(duracao, replace = c("user_id"="aluno", "course_id"="curso", "timeToFinish"="dias"))

mean(duracao$dias, na.rm = T)
median(duracao$dias, na.rm = T)
summary(duracao)
