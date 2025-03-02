#' @export
str.measure <- function(
    object, max.level = NA, vec.len = strO$vec.len, digits.d = strO$digits.d,
    nchar.max = 128, give.attr = TRUE, drop.deparse.attr = strO$drop.deparse.attr,
    give.head = TRUE, give.length = give.head, width = getOption("width"),
    nest.lev = 0,
    indent.str = paste(rep.int(" ", max(0, nest.lev + 1)), collapse = ".."),
    comp.str = "$ ", no.list = FALSE, envir = baseenv(),
    strict.width = strO$strict.width, formatNum = strO$formatNum,
    list.len = strO$list.len, deparse.lines = strO$deparse.lines, ...) {
  oDefs <- c("vec.len", "digits.d", "strict.width", "formatNum",
             "drop.deparse.attr", "list.len", "deparse.lines")
  strO <- getOption("str")
  if (!is.list(strO)) {
    warning("invalid options(\"str\") -- using defaults instead")
    strO <- utils::strOptions()
  }
  else {
    if (!all(names(strO) %in% oDefs))
      warning(gettextf("invalid components in options(\"str\"): %s",
                       paste(setdiff(names(strO), oDefs), collapse = ", ")),
              domain = NA)
    strO <- utils::modifyList(utils::strOptions(), strO)
  }
  u <- units(object)
  formatNumMeasure <- if(unitless(object)) formatNum else
    function(x, ...) paste(formatNum(x, ...), format(u))
  object <- get_data(object)
  strict.width <- match.arg(strict.width, choices = c("no",
                                                      "cut", "wrap"))
  if (strict.width != "no") {
    ss <- utils::capture.output(utils::str(object, max.level = max.level,
                                     vec.len = vec.len, digits.d = digits.d, nchar.max = nchar.max,
                                     give.attr = give.attr, give.head = give.head, give.length = give.length,
                                     width = width, nest.lev = nest.lev, indent.str = indent.str,
                                     comp.str = comp.str, no.list = no.list || is.data.frame(object),
                                     envir = envir, strict.width = "no", formatNum = formatNum,
                                     list.len = list.len, deparse.lines = deparse.lines,
                                     ...))
    if (strict.width == "wrap") {
      nind <- nchar(indent.str) + 2
      ss <- strwrap(ss, width = width, exdent = nind)
    }
    if (length(iLong <- which(nchar(ss) > width))) {
      sL <- ss[iLong]
      k <- as.integer(width - 2L)
      if (any(i <- grepl("\"", substr(sL, k + 1L, nchar(sL))))) {
        ss[iLong[i]] <- paste0(substr(sL[i], 1, k -
                                        1L), "\"..")
        ss[iLong[!i]] <- paste0(substr(sL[!i], 1, k),
                                "..")
      }
      else {
        ss[iLong] <- paste0(substr(sL, 1, k), "..")
      }
    }
    cat(ss, sep = "\n")
    return(invisible())
  }
  oo <- options(digits = digits.d)
  on.exit(options(oo))
  le <- length(object)[1L]
  if (is.na(le)) {
    warning("'str.measure': 'le' is NA, so taken as 0",
            immediate. = TRUE)
    le <- 0
    vec.len <- 0
  }
  nchar.w <- function(x) nchar(x, type = "w", allowNA = TRUE)
  ncharN <- function(x) {
    r <- nchar(x, type = "w", allowNA = TRUE)
    if (anyNA(r)) {
      iN <- is.na(r)
      r[iN] <- nchar(x[iN], type = "bytes")
    }
    r
  }
  maybe_truncate <- function(x, nx = nchar.w(x), S = "\"",
                             ch = "| __truncated__") {
    ok <- if (anyNA(nx))
      !is.na(nx)
    else TRUE
    if (any(lrg <- ok & nx > nchar.max)) {
      nc <- nchar(ch <- paste0(S, ch))
      if (nchar.max <= nc)
        stop(gettextf("'nchar.max = %d' is too small",
                      nchar.max), domain = NA)
      x.lrg <- x[lrg]
      tr.x <- strtrim(x.lrg, nchar.max - nc)
      if (any(ii <- tr.x != x.lrg & paste0(tr.x, S) !=
              x.lrg)) {
        x[lrg][ii] <- paste0(tr.x[ii], ch)
      }
    }
    x
  }
  pClass <- function(cls) paste0("Class", if (length(cls) >
                                              1)
    "es", " '", paste(cls, collapse = "', '"), "' ")
  nfS <- names(fStr <- formals())
  strSub <- function(obj, ...) {
    nf <- setdiff(nfS, c("object", "give.length", "comp.str",
                         "no.list", names(match.call())[-(1:2)], "..."))
    aList <- as.list(fStr)[nf]
    aList[] <- lapply(nf, function(n) eval(as.name(n)))
    do.call(function(...) utils::str(obj, ...), c(aList, list(...)),
            quote = TRUE)
  }
  le.str <- if (is.na(le))
    " __no length(.)__ "
  else if (give.length) {
    if (le > 0)
      paste0("[1:", paste(le), "]")
    else "(0)"
  }
  else ""
  v.len <- vec.len
  std.attr <- "names"
  cl <- if ((S4 <- isS4(object)))
    class(object)
  else oldClass(object)
  has.class <- S4 || !is.null(cl)
  mod <- ""
  char.like <- FALSE
  if (give.attr)
    a <- attributes(object)
  dCtrl <- eval(formals(deparse)$control)
  if (drop.deparse.attr)
    dCtrl <- dCtrl[dCtrl != "showAttributes"]
  width.cutoff <- min(500L, max(20L, width - 10L))
  nlines <- deparse.lines %||% (1L + as.integer(max(nchar.max,
                                                    width.cutoff)/8))
  deParse <- function(.) deparse(., width.cutoff = width.cutoff,
                                 control = dCtrl, nlines = nlines)
  n.of. <- function(n, singl, plural) paste(n, ngettext(n,
                                                        singl, plural))
  n.of <- function(n, noun) n.of.(n, noun, paste0(noun, "s"))
  l.i <- function(i) paste0("[[", i, "]]")
  arrLenstr <- function(obj) {
    rnk <- length(di. <- dim(obj))
    di <- paste0(ifelse(di. > 1, "1:", ""), di., ifelse(di. >
                                                          0, "", " "))
    pDi <- function(...) paste(c("[", ..., "]"), collapse = "")
    if (rnk == 1)
      pDi(di[1L], "(1d)")
    else pDi(paste0(di[-rnk], ", "), di[rnk])
  }
  if (is.null(object))
    cat(" NULL\n")
  else {
    if (is.atomic(object)) {
      mod <- "measure"
    }
    if (!is.null(names(object))) {
      mod <- paste("Named", mod)
      std.attr <- std.attr[std.attr != "names"]
    }
    str1 <- if (le == 1 && !is.array(object))
      paste(NULL, mod)
    else paste0(" ", mod, if (le > 0)
      " ", le.str)
    if (is.numeric(object)) {
      iv.len <- round(2.5 * v.len)
      if (iSurv <- inherits(object, "Surv"))
        std.attr <- c(std.attr, "class")
      int.surv <- iSurv || is.integer(object)
      if (!int.surv) {
        ob <- if (le > iv.len)
          object[seq_len(iv.len)]
        else object
        ao <- abs(ob <- unclass(ob[!is.na(ob)]))
      }
      else if (iSurv) {
        nc <- ncol(object)
        le <- length(object <- as.character(object))
      }
      if (int.surv || (all(ao > 1e-10 | ao == 0) && all(ao <
                                                        1e+10 | ao == 0) && all(abs(ob - signif(ob,
                                                                                                digits.d)) <= 9e-16 * ao))) {
        if (!iSurv || nc == 2L)
          v.len <- iv.len
      }
      else {
        v.len <- round(1.25 * v.len)
      }
      format.fun <- formatNumMeasure
    }
    if (char.like) {
      max.len <- max(100L, width%/%3L + 1L, if (!missing(vec.len)) vec.len)
      if (le > max.len)
        le <- length(object <- object[seq_len(max.len)])
      trimWidth <- as.integer(nchar.max)
      encObj <- tryCatch(strtrim(object, trimWidth), error = function(e) NULL)
      encObj <- if (is.null(encObj)) {
        e <- encodeString(object, quote = "\"", na.encode = FALSE)
        r <- tryCatch(strtrim(e, trimWidth), error = function(.) NULL)
        if (is.null(r))
          e
        else r
      }
      else encodeString(encObj, quote = "\"", na.encode = FALSE)
      if (le > 0)
        encObj <- maybe_truncate(encObj)
      v.len <- if (missing(vec.len)) {
        max(1, sum(cumsum(1 + if (le > 0) ncharN(encObj) else 0) <
                     width - (4 + 5 * nest.lev + nchar(str1, type = "w"))))
      }
      else round(v.len)
      ile <- min(le, v.len)
      if (ile >= 1)
        object <- encObj[seq_len(ile)]
      formObj <- function(x) paste(as.character(x), collapse = " ")
    }
    else {
      if (!exists("format.fun"))
        format.fun <- switch(mod, num = , cplx = format,
                             language = deParse, as.character)
      ile <- min(v.len, le)
      formObj <- function(x) maybe_truncate(paste(format.fun(x),
                                                  collapse = " "), S = "")
    }
    cat(if (give.head)
      paste0(str1, " "), formObj(if (ile >= 1 && mod !=
                                     "...")
        object[seq_len(ile)]
        else if (v.len > 0)
          object), if (le > v.len)
            " ...", "\n", sep = "")
  }
  if (give.attr) {
    nam <- names(a)
    give.L <- give.length || identical(attr(give.length,
                                            "from"), "data.frame")
    for (i in seq_along(a)) if (all(nam[i] != std.attr)) {
      cat(indent.str, paste0("- attr(*, \"", nam[i], "\")="),
          sep = "")
      strSub(a[[i]], give.length = give.L, indent.str = paste(indent.str,
                                                              ".."), nest.lev = nest.lev + 1)
    }
  }
  invisible()
}
