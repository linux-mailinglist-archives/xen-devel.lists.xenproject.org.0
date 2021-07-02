Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BD93BA5F2
	for <lists+xen-devel@lfdr.de>; Sat,  3 Jul 2021 00:23:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149350.276141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzRYl-0000s7-M4; Fri, 02 Jul 2021 22:22:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149350.276141; Fri, 02 Jul 2021 22:22:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzRYl-0000qI-IS; Fri, 02 Jul 2021 22:22:55 +0000
Received: by outflank-mailman (input) for mailman id 149350;
 Fri, 02 Jul 2021 22:22:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2ZMt=L2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lzRYk-0000q8-Ah
 for xen-devel@lists.xenproject.org; Fri, 02 Jul 2021 22:22:54 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 80df7d79-ec09-4269-aa45-50be355b2d5a;
 Fri, 02 Jul 2021 22:22:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5B51D61405;
 Fri,  2 Jul 2021 22:22:52 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 80df7d79-ec09-4269-aa45-50be355b2d5a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1625264572;
	bh=Iqikf0GglF2rjBlBCK0w5hpWr/YpU8lp+Uws8c+boYk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HJm0//bOy6goiu9XQ7lonVgUlGlRzOWGpffun0TVuoG2xI/XSIbtiZsyKQ+Xa4d0B
	 5+QM6JkxnaVt0+I2CKIRhdK7r9HL1I7QjFUcVSE/1GTKm0LlAED08iKpYGwpSk6pnC
	 vH8/N3PQndhw2mXJpb2hJVFyizG3EyEWcqNS0Txx72D4vbZhlIwOhNkdA3nig7QXtV
	 n9jJUWLwcnBXHncNCFtLpE7zRsRnzag5I0tDuYB6kyg8TLuvoyKQ9l7ROpJf3RQO28
	 1perlfYzM7rn68V3KpBcVEs3uT5SRL7orG0ZG7H6MJYXmsrq8251hhsU7pIJ2jLb5o
	 tOc+skz85q0+w==
Date: Fri, 2 Jul 2021 15:22:51 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Luca Fancellu <luca.fancellu@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, wei.chen@arm.com, 
    Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v6 5/9] docs: add checks to configure for sphinx and
 doxygen
In-Reply-To: <20210510084105.17108-6-luca.fancellu@arm.com>
Message-ID: <alpine.DEB.2.21.2107021456440.9437@sstabellini-ThinkPad-T480s>
References: <20210510084105.17108-1-luca.fancellu@arm.com> <20210510084105.17108-6-luca.fancellu@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 10 May 2021, Luca Fancellu wrote:
> Add checks in the configure files to see if the system
> is capable of generate the sphinx html docs using
            ^ of generating

> doxygen and sphinx-breathe tools.

I take you updated the configure script but running autoconf again,
right?

Assuming that is the case:

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>  config/Docs.mk.in |   2 +
>  docs/configure    | 258 ++++++++++++++++++++++++++++++++++++++++++++++
>  docs/configure.ac |  15 +++
>  3 files changed, 275 insertions(+)
> 
> diff --git a/config/Docs.mk.in b/config/Docs.mk.in
> index e76e5cd5ff..dfd4a02838 100644
> --- a/config/Docs.mk.in
> +++ b/config/Docs.mk.in
> @@ -7,3 +7,5 @@ POD2HTML            := @POD2HTML@
>  POD2TEXT            := @POD2TEXT@
>  PANDOC              := @PANDOC@
>  PERL                := @PERL@
> +SPHINXBUILD         := @SPHINXBUILD@
> +DOXYGEN             := @DOXYGEN@
> diff --git a/docs/configure b/docs/configure
> index 569bd4c2ff..0ebf046a79 100755
> --- a/docs/configure
> +++ b/docs/configure
> @@ -588,6 +588,8 @@ ac_unique_file="misc/xen-command-line.pandoc"
>  ac_subst_vars='LTLIBOBJS
>  LIBOBJS
>  PERL
> +DOXYGEN
> +SPHINXBUILD
>  PANDOC
>  POD2TEXT
>  POD2HTML
> @@ -673,6 +675,7 @@ POD2MAN
>  POD2HTML
>  POD2TEXT
>  PANDOC
> +DOXYGEN
>  PERL'
>  
>  
> @@ -1318,6 +1321,7 @@ Some influential environment variables:
>    POD2HTML    Path to pod2html tool
>    POD2TEXT    Path to pod2text tool
>    PANDOC      Path to pandoc tool
> +  DOXYGEN     Path to doxygen tool
>    PERL        Path to Perl parser
>  
>  Use these variables to override the choices made by `configure' or to help
> @@ -1800,6 +1804,7 @@ ac_configure="$SHELL $ac_aux_dir/configure"  # Please don't use this var.
>  
>  
>  
> +
>  case "$host_os" in
>  *freebsd*) XENSTORED_KVA=/dev/xen/xenstored ;;
>  *) XENSTORED_KVA=/proc/xen/xsd_kva ;;
> @@ -1812,6 +1817,53 @@ case "$host_os" in
>  esac
>  
>  
> +# ===========================================================================
> +#     https://www.gnu.org/software/autoconf-archive/ax_python_module.html
> +# ===========================================================================
> +#
> +# SYNOPSIS
> +#
> +#   AX_PYTHON_MODULE(modname[, fatal, python])
> +#
> +# DESCRIPTION
> +#
> +#   Checks for Python module.
> +#
> +#   If fatal is non-empty then absence of a module will trigger an error.
> +#   The third parameter can either be "python" for Python 2 or "python3" for
> +#   Python 3; defaults to Python 3.
> +#
> +# LICENSE
> +#
> +#   Copyright (c) 2008 Andrew Collier
> +#
> +#   Copying and distribution of this file, with or without modification, are
> +#   permitted in any medium without royalty provided the copyright notice
> +#   and this notice are preserved. This file is offered as-is, without any
> +#   warranty.
> +
> +#serial 9
> +
> +# This is what autoupdate's m4 run will expand.  It fires
> +# the warning (with _au_warn_XXX), outputs it into the
> +# updated configure.ac (with AC_DIAGNOSE), and then outputs
> +# the replacement expansion.
> +
> +
> +# This is an auxiliary macro that is also run when
> +# autoupdate runs m4.  It simply calls m4_warning, but
> +# we need a wrapper so that each warning is emitted only
> +# once.  We break the quoting in m4_warning's argument in
> +# order to expand this macro's arguments, not AU_DEFUN's.
> +
> +
> +# Finally, this is the expansion that is picked up by
> +# autoconf.  It tells the user to run autoupdate, and
> +# then outputs the replacement expansion.  We do not care
> +# about autoupdate's warning because that contains
> +# information on what to do *after* running autoupdate.
>  
>  
>  test "x$prefix" = "xNONE" && prefix=$ac_default_prefix
> @@ -2232,6 +2284,212 @@ $as_echo "$as_me: WARNING: pandoc is not available so some documentation won't b
>  fi
>  
>  
> +# If sphinx is installed, make sure to have also the dependencies to build
> +# Sphinx documentation.
> +for ac_prog in sphinx-build
> +do
> +  # Extract the first word of "$ac_prog", so it can be a program name with args.
> +set dummy $ac_prog; ac_word=$2
> +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
> +$as_echo_n "checking for $ac_word... " >&6; }
> +if ${ac_cv_prog_SPHINXBUILD+:} false; then :
> +  $as_echo_n "(cached) " >&6
> +else
> +  if test -n "$SPHINXBUILD"; then
> +  ac_cv_prog_SPHINXBUILD="$SPHINXBUILD" # Let the user override the test.
> +else
> +as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
> +for as_dir in $PATH
> +do
> +  IFS=$as_save_IFS
> +  test -z "$as_dir" && as_dir=.
> +    for ac_exec_ext in '' $ac_executable_extensions; do
> +  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> +    ac_cv_prog_SPHINXBUILD="$ac_prog"
> +    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
> +    break 2
> +  fi
> +done
> +  done
> +IFS=$as_save_IFS
> +
> +fi
> +fi
> +SPHINXBUILD=$ac_cv_prog_SPHINXBUILD
> +if test -n "$SPHINXBUILD"; then
> +  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $SPHINXBUILD" >&5
> +$as_echo "$SPHINXBUILD" >&6; }
> +else
> +  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
> +$as_echo "no" >&6; }
> +fi
> +
> +
> +  test -n "$SPHINXBUILD" && break
> +done
> +test -n "$SPHINXBUILD" || SPHINXBUILD="no"
> +
> +    if test "x$SPHINXBUILD" = xno; then :
> +  { $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: sphinx-build is not available so sphinx documentation \
> +won't be built" >&5
> +$as_echo "$as_me: WARNING: sphinx-build is not available so sphinx documentation \
> +won't be built" >&2;}
> +else
> +
> +            # Extract the first word of "sphinx-build", so it can be a program name with args.
> +set dummy sphinx-build; ac_word=$2
> +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
> +$as_echo_n "checking for $ac_word... " >&6; }
> +if ${ac_cv_path_SPHINXBUILD+:} false; then :
> +  $as_echo_n "(cached) " >&6
> +else
> +  case $SPHINXBUILD in
> +  [\\/]* | ?:[\\/]*)
> +  ac_cv_path_SPHINXBUILD="$SPHINXBUILD" # Let the user override the test with a path.
> +  ;;
> +  *)
> +  as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
> +for as_dir in $PATH
> +do
> +  IFS=$as_save_IFS
> +  test -z "$as_dir" && as_dir=.
> +    for ac_exec_ext in '' $ac_executable_extensions; do
> +  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> +    ac_cv_path_SPHINXBUILD="$as_dir/$ac_word$ac_exec_ext"
> +    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
> +    break 2
> +  fi
> +done
> +  done
> +IFS=$as_save_IFS
> +
> +  ;;
> +esac
> +fi
> +SPHINXBUILD=$ac_cv_path_SPHINXBUILD
> +if test -n "$SPHINXBUILD"; then
> +  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $SPHINXBUILD" >&5
> +$as_echo "$SPHINXBUILD" >&6; }
> +else
> +  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
> +$as_echo "no" >&6; }
> +fi
> +
> +
> +
> +
> +    # Extract the first word of "doxygen", so it can be a program name with args.
> +set dummy doxygen; ac_word=$2
> +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
> +$as_echo_n "checking for $ac_word... " >&6; }
> +if ${ac_cv_path_DOXYGEN+:} false; then :
> +  $as_echo_n "(cached) " >&6
> +else
> +  case $DOXYGEN in
> +  [\\/]* | ?:[\\/]*)
> +  ac_cv_path_DOXYGEN="$DOXYGEN" # Let the user override the test with a path.
> +  ;;
> +  *)
> +  as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
> +for as_dir in $PATH
> +do
> +  IFS=$as_save_IFS
> +  test -z "$as_dir" && as_dir=.
> +    for ac_exec_ext in '' $ac_executable_extensions; do
> +  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> +    ac_cv_path_DOXYGEN="$as_dir/$ac_word$ac_exec_ext"
> +    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
> +    break 2
> +  fi
> +done
> +  done
> +IFS=$as_save_IFS
> +
> +  ;;
> +esac
> +fi
> +DOXYGEN=$ac_cv_path_DOXYGEN
> +if test -n "$DOXYGEN"; then
> +  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $DOXYGEN" >&5
> +$as_echo "$DOXYGEN" >&6; }
> +else
> +  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
> +$as_echo "no" >&6; }
> +fi
> +
> +
> +    if ! test -x "$ac_cv_path_DOXYGEN"; then :
> +
> +        as_fn_error $? "doxygen is needed" "$LINENO" 5
> +
> +fi
> +
> +
> +    if test -z $PYTHON;
> +    then
> +        if test -z "";
> +        then
> +            PYTHON="python3"
> +        else
> +            PYTHON=""
> +        fi
> +    fi
> +    PYTHON_NAME=`basename $PYTHON`
> +    { $as_echo "$as_me:${as_lineno-$LINENO}: checking $PYTHON_NAME module: breathe" >&5
> +$as_echo_n "checking $PYTHON_NAME module: breathe... " >&6; }
> +    $PYTHON -c "import breathe" 2>/dev/null
> +    if test $? -eq 0;
> +    then
> +        { $as_echo "$as_me:${as_lineno-$LINENO}: result: yes" >&5
> +$as_echo "yes" >&6; }
> +        eval HAVE_PYMOD_BREATHE=yes
> +    else
> +        { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
> +$as_echo "no" >&6; }
> +        eval HAVE_PYMOD_BREATHE=no
> +        #
> +        if test -n "yes"
> +        then
> +            as_fn_error $? "failed to find required module breathe" "$LINENO" 5
> +            exit 1
> +        fi
> +    fi
> +
> +
> +    if test -z $PYTHON;
> +    then
> +        if test -z "";
> +        then
> +            PYTHON="python3"
> +        else
> +            PYTHON=""
> +        fi
> +    fi
> +    PYTHON_NAME=`basename $PYTHON`
> +    { $as_echo "$as_me:${as_lineno-$LINENO}: checking $PYTHON_NAME module: sphinx_rtd_theme" >&5
> +$as_echo_n "checking $PYTHON_NAME module: sphinx_rtd_theme... " >&6; }
> +    $PYTHON -c "import sphinx_rtd_theme" 2>/dev/null
> +    if test $? -eq 0;
> +    then
> +        { $as_echo "$as_me:${as_lineno-$LINENO}: result: yes" >&5
> +$as_echo "yes" >&6; }
> +        eval HAVE_PYMOD_SPHINX_RTD_THEME=yes
> +    else
> +        { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
> +$as_echo "no" >&6; }
> +        eval HAVE_PYMOD_SPHINX_RTD_THEME=no
> +        #
> +        if test -n "yes"
> +        then
> +            as_fn_error $? "failed to find required module sphinx_rtd_theme" "$LINENO" 5
> +            exit 1
> +        fi
> +    fi
> +
> +
> +
> +fi
> +
>  
>  # Extract the first word of "perl", so it can be a program name with args.
>  set dummy perl; ac_word=$2
> diff --git a/docs/configure.ac b/docs/configure.ac
> index c2e5edd3b3..a2ff55f30a 100644
> --- a/docs/configure.ac
> +++ b/docs/configure.ac
> @@ -20,6 +20,7 @@ m4_include([../m4/docs_tool.m4])
>  m4_include([../m4/path_or_fail.m4])
>  m4_include([../m4/features.m4])
>  m4_include([../m4/paths.m4])
> +m4_include([../m4/ax_python_module.m4])
>  
>  AX_XEN_EXPAND_CONFIG()
>  
> @@ -29,6 +30,20 @@ AX_DOCS_TOOL_PROG([POD2HTML], [pod2html])
>  AX_DOCS_TOOL_PROG([POD2TEXT], [pod2text])
>  AX_DOCS_TOOL_PROG([PANDOC], [pandoc])
>  
> +# If sphinx is installed, make sure to have also the dependencies to build
> +# Sphinx documentation.
> +AC_CHECK_PROGS([SPHINXBUILD], [sphinx-build], [no])
> +    AS_IF([test "x$SPHINXBUILD" = xno],
> +        [AC_MSG_WARN(sphinx-build is not available so sphinx documentation \
> +won't be built)],
> +        [
> +            AC_PATH_PROG([SPHINXBUILD], [sphinx-build])
> +            AX_DOCS_TOOL_REQ_PROG([DOXYGEN], [doxygen])
> +            AX_PYTHON_MODULE([breathe],[yes])
> +            AX_PYTHON_MODULE([sphinx_rtd_theme], [yes])
> +        ]
> +    )
> +
>  AC_ARG_VAR([PERL], [Path to Perl parser])
>  AX_PATH_PROG_OR_FAIL([PERL], [perl])

