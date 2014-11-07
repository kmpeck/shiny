library(shiny)
dat <- read.csv("Kvsmu.csv")
dat$pch <- as.numeric(dat$virus)

shinyServer(function(input,output)
{
  #renderPlot indicates that the function is "reactive" - it should automatically
  #  re-execute when the input changes
  output$virusPlot <- renderPlot({
    
    #render the plot
    par(mar=c(5,5,2,2))
    plot(log10(K)~log10(mu), data=dat, xaxt='n', yaxt='n', col="grey40", 
         pch=dat$pch, 
         xlab="", ylab="", ylim=c(-5.5,-1.5), xlim=c(-7.5,-3.5), cex=1.5,
         main=paste("You chose: ", input$virus))
    virus_of_choice <- subset(dat, dat$virus==input$virus) #names need to match exactly
    points(log10(K)~log10(mu), data=virus_of_choice, pch=virus_of_choice$pch, col=2, cex=1.5)
    mtext(expression(paste("Evolution rate, ", K, " (s/n/y)")),side=2,line=3.5, cex=1.5) 
    mtext(expression(paste("Mutation rate, ", mu, " (s/n/c)")),side=1,line=3, cex=1.5)
    axis(1, at=c(-7,-6,-5,-4), labels=c(expression(paste(10^{-7})), expression(paste(10^{-6})), expression(paste(10^{-5})), expression(paste(10^{-4}))), cex.axis=1.5)
    axis(2, las=2, at=c(-5,-4,-3,-2), labels=c(expression(paste(10^{-5})), expression(paste(10^{-4})), expression(paste(10^{-3})), expression(paste(10^{-2}))), cex.axis=1.5)

    text(log10(mean(virus_of_choice$mu))+.3, log10(mean(virus_of_choice$K)), labels=mean(virus_of_choice$mu), col=2)
  })
})
