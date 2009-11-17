ascii.density <- function (x, include.rownames = FALSE, include.colnames = TRUE, rownames = NULL, colnames = NULL, format = "f", digits = 2, decimal.mark = ".", na.print = "", caption = "", caption.level = "", width = 0, frame = "", grid = "", valign = "", header = TRUE, footer = FALSE, align = "", col.width = 1, style = "", tgroup = NULL, n.tgroup = NULL, talign = "", tvalign = "", tstyle = "", bgroup = NULL, n.bgroup = NULL, balign = "", bvalign = "", bstyle = "", lgroup = NULL, n.lgroup = NULL, lalign = "", lvalign = "", lstyle = "", rgroup = NULL, n.rgroup = NULL, ralign = "", rvalign = "", rstyle = "", ...){
    y <- unclass(x)
    res <- summary(data.frame(x = y$x, y = y$y))
    obj <- ascii(x = res, include.rownames = include.rownames, 
         include.colnames = include.colnames, rownames = rownames, colnames = colnames,
         format = format, digits = digits, decimal.mark = decimal.mark, na.print = na.print,
         caption = caption, caption.level = caption.level, width = width, frame = frame,
         grid = grid, valign = valign, header = header, footer = footer, align = align,
         col.width = col.width, style = style,
         tgroup = tgroup, n.tgroup = n.tgroup, talign = talign,
         tvalign = tvalign, tstyle = tstyle,
         bgroup = bgroup, n.bgroup = n.bgroup, balign = balign,
         bvalign = bvalign, bstyle = bstyle,
         lgroup = lgroup, n.lgroup = n.lgroup, lalign = lalign,
         lvalign = lvalign, lstyle = lstyle,
         rgroup = rgroup, n.rgroup = n.rgroup, ralign = ralign,
         rvalign = rvalign, rstyle = rstyle)
    class(obj) <- c("ascii", "proto", "environment")
    return(obj)
}
