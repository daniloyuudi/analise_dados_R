duracao <- rename(duracao, replace = c("user_id"="aluno", "course_id"="curso", "timeToFinish"="dias"))

plot(duracao$dias)

jpeg("histograma.jpg")

hist(duracao$dias, breaks = 20, main = "Histograma do Tempo",
     ylab = "Quantidade", xlab = "Tempo", ylim = c(0, 2500), col = "blue")

dev.off()

mean(duracao$dias, na.rm = T)

median(duracao$dias, na.rm = T)

summary(duracao$dias)

dim(duracao)[1]

3828 / 6366

length(unique(duracao$curso))

length(unique(duracao$aluno))

sumario_estatistico <- aggregate(duracao$dias, list(duracao$curso), mean, na.rm = T)

#popularidade_e_duracao <- merge(sumario_estatistico, popularidade, by = 'curso')

sumario_estatistico <- rename(sumario_estatistico, replace = c('Group.1'='curso','x'='dias'))

popularidade <- rename(popularidade, c('course_id'='curso', 'freq'='popularidade'))

popularidade_e_duracao <- merge(sumario_estatistico, popularidade, by = 'curso')

plot(popularidade_e_duracao$dias, popularidade_e_duracao$popularidade)

modelo.linear <- lm(popularidade_e_duracao$popularidade~popularidade_e_duracao$dias)

abline(lm(popularidade_e_duracao$popularidade~popularidade_e_duracao$dias))

modelo.linear

scatter.smooth(popularidade_e_duracao$dias, popularidade_e_duracao$popularidade, pch = 21, col = 'blue')

help('pch')

library(ggplot2)

install.packages('ggplot2')

grafico <- ggplot(popularidade_e_duracao, aes(dias, popularidade))

grafico

grafico <- grafico + geom_point()

grafico

grafico <- grafico + geom_smooth()

grafico
