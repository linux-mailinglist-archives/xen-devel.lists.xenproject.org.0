Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF78420CD02
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2020 09:41:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jpoPd-0000oX-FX; Mon, 29 Jun 2020 07:41:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xxse=AK=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jpoPc-0000oS-1F
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2020 07:41:08 +0000
X-Inumbo-ID: e456b20e-b9db-11ea-b7bb-bc764e2007e4
Received: from mail-wr1-x42b.google.com (unknown [2a00:1450:4864:20::42b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e456b20e-b9db-11ea-b7bb-bc764e2007e4;
 Mon, 29 Jun 2020 07:41:07 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id r12so15409359wrj.13
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2020 00:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=tphsBSB9nwEvETHetQs2071qRWmYmER5CGxR2YJlEuw=;
 b=KyPOB888QelFaNxi35T4PuLciP5paRHbrElKGKGolczyPAxHyo+AXE6qxtS37jOz5B
 KqCMN+I/vFbeYrYVTPjDBvmjxbbLtrFyUrjwgRcrLzmZ1J+NN92PQR1/gsfO18F7V1yJ
 9gYwmxQMdXutj8uvDE+h82+Blk7rJTQKzCG6HibX90EvNPbRWEYIRh8velD5UVLQ7yA5
 TUaViN1oRPnPuH7kOqmhzUAKIlk4g9pyww3lftnvYonAgVqfiimyz2MdO46DAypynFex
 vF8QU2cDLV/QG3acxP67f6ifGu5tWelK5vgM1KUn3/SRyOmGJXroyoRRHlKYUcdZTq1P
 NDQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=tphsBSB9nwEvETHetQs2071qRWmYmER5CGxR2YJlEuw=;
 b=gObB+9P74jvrF5ajK5jfsx74H2hWhjzdzYCbzQLa0pm2hQ0yrvRaOzZgz+gfd5FxdR
 ki3CFs62d42sjJdeITx6Iw9/d1kQ8vRnhMiBfgpOTZK27wOUETUkYklWW3t/VETuc2L2
 1LN75h4ne8SW0wuXeT5ruD14d4J8e9iAfG3IfzocJ8OG7gjlG0emmO/x/5SGHSqDFUKX
 Jh7IJSEbsVUPRPjC/kmcT4ZhMxkl5AVcIIQwthsSd2q0fTg4swXcfk28sGS60A+mwfgw
 9b9g2JMK2MR+1gs/yN7bPUwnYq8Mlru3a0DCy7GJmt34X0mJzE/uLeVgoDjxshvMAzNh
 loeA==
X-Gm-Message-State: AOAM5331b95F8MvU72u8y2N5F4/9CAKZ8+KsCmN4o5Us6dD7rbP46ued
 DYVtCdAP1uWHv8sODJev4wI=
X-Google-Smtp-Source: ABdhPJwsIWeKp3D+/hy1YeBAVDTJjdswHh06TxviF5wLJ1d/LpfWGlV5fDog720o9tlo2KvVUbUP6w==
X-Received: by 2002:a5d:6045:: with SMTP id j5mr15467570wrt.209.1593416466457; 
 Mon, 29 Jun 2020 00:41:06 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-225.amazon.com. [54.240.197.225])
 by smtp.gmail.com with ESMTPSA id w7sm28677309wmc.32.2020.06.29.00.41.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Jun 2020 00:41:06 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Andrew Cooper'" <andrew.cooper3@citrix.com>,
 "'Xen-devel'" <xen-devel@lists.xenproject.org>
References: <20200626170038.27650-1-andrew.cooper3@citrix.com>
In-Reply-To: <20200626170038.27650-1-andrew.cooper3@citrix.com>
Subject: RE: [PATCH] tools/configure: drop BASH configure variable
Date: Mon, 29 Jun 2020 08:41:05 +0100
Message-ID: <000201d64de8$a5938bf0$f0baa3d0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQG/+PmFeHEa0PFXsi/qRsJidKaVMqkb3yeQ
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: 'Ian Jackson' <Ian.Jackson@citrix.com>,
 'Daniel De Graaf' <dgdegra@tycho.nsa.gov>, 'Wei Liu' <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Andrew Cooper <andrew.cooper3@citrix.com>
> Sent: 26 June 2020 18:01
> To: Xen-devel <xen-devel@lists.xenproject.org>
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; Ian Jackson <Ian.Jackson@citrix.com>; Wei Liu
> <wl@xen.org>; Daniel De Graaf <dgdegra@tycho.nsa.gov>; Paul Durrant <paul@xen.org>
> Subject: [PATCH] tools/configure: drop BASH configure variable
> 
> This is a weird variable to have in the first place.  The only user of it is
> XSM's CONFIG_SHELL, which opencodes a fallback to sh, and the only two scripts
> run with this are shebang sh anyway, so don't need bash in the first place.
> 
> Make the mkflask.sh and mkaccess_vector.sh scripts executable, drop the
> CONFIG_SHELL, and drop the $BASH variable to prevent further use.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Ian Jackson <Ian.Jackson@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Daniel De Graaf <dgdegra@tycho.nsa.gov>
> CC: Paul Durrant <paul@xen.org>
> 
> ./autogen.sh needs rerunning on commit.
> 
> RFC for 4.14.  This is a cleanup to the build system.
> 
> There is a separate check for [BASH] in the configure script, which is
> checking the requirement for the Linux hotplug scripts.  Really, that is a
> runtime requirement not a build time requirement, and it is rude to require
> bash in a build environment on this basis.  IMO, that check wants dropping as
> well.

That sounds quite reasonable.

Release-acked-by: Paul Durrant <paul@xen.org>

> ---
>  config/Tools.mk.in                      | 1 -
>  tools/configure.ac                      | 1 -
>  xen/xsm/flask/Makefile                  | 8 ++------
>  xen/xsm/flask/policy/mkaccess_vector.sh | 0
>  xen/xsm/flask/policy/mkflask.sh         | 0
>  5 files changed, 2 insertions(+), 8 deletions(-)
>  mode change 100644 => 100755 xen/xsm/flask/policy/mkaccess_vector.sh
>  mode change 100644 => 100755 xen/xsm/flask/policy/mkflask.sh
> 
> diff --git a/config/Tools.mk.in b/config/Tools.mk.in
> index 23df47af8d..48bd9ab731 100644
> --- a/config/Tools.mk.in
> +++ b/config/Tools.mk.in
> @@ -12,7 +12,6 @@ PYTHON              := @PYTHON@
>  PYTHON_PATH         := @PYTHONPATH@
>  PY_NOOPT_CFLAGS     := @PY_NOOPT_CFLAGS@
>  PERL                := @PERL@
> -BASH                := @BASH@
>  XGETTTEXT           := @XGETTEXT@
>  AS86                := @AS86@
>  LD86                := @LD86@
> diff --git a/tools/configure.ac b/tools/configure.ac
> index 9d126b7a14..6614a4f130 100644
> --- a/tools/configure.ac
> +++ b/tools/configure.ac
> @@ -297,7 +297,6 @@ AC_ARG_VAR([PYTHON], [Path to the Python parser])
>  AC_ARG_VAR([PERL], [Path to Perl parser])
>  AC_ARG_VAR([BISON], [Path to Bison parser generator])
>  AC_ARG_VAR([FLEX], [Path to Flex lexical analyser generator])
> -AC_ARG_VAR([BASH], [Path to bash shell])
>  AC_ARG_VAR([XGETTEXT], [Path to xgetttext tool])
>  AC_ARG_VAR([AS86], [Path to as86 tool])
>  AC_ARG_VAR([LD86], [Path to ld86 tool])
> diff --git a/xen/xsm/flask/Makefile b/xen/xsm/flask/Makefile
> index 07f36d075d..ba8f31a02c 100644
> --- a/xen/xsm/flask/Makefile
> +++ b/xen/xsm/flask/Makefile
> @@ -8,10 +8,6 @@ CFLAGS-y += -I./include
> 
>  AWK = awk
> 
> -CONFIG_SHELL := $(shell if [ -x "$$BASH" ]; then echo $$BASH; \
> -          else if [ -x /bin/bash ]; then echo /bin/bash; \
> -          else echo sh; fi ; fi)
> -
>  FLASK_H_DEPEND = policy/security_classes policy/initial_sids
>  AV_H_DEPEND = policy/access_vectors
> 
> @@ -24,14 +20,14 @@ extra-y += $(ALL_H_FILES)
> 
>  mkflask := policy/mkflask.sh
>  quiet_cmd_mkflask = MKFLASK $@
> -cmd_mkflask = $(CONFIG_SHELL) $(mkflask) $(AWK) include $(FLASK_H_DEPEND)
> +cmd_mkflask = $(mkflask) $(AWK) include $(FLASK_H_DEPEND)
> 
>  $(subst include/,%/,$(FLASK_H_FILES)): $(FLASK_H_DEPEND) $(mkflask) FORCE
>  	$(call if_changed,mkflask)
> 
>  mkaccess := policy/mkaccess_vector.sh
>  quiet_cmd_mkaccess = MKACCESS VECTOR $@
> -cmd_mkaccess = $(CONFIG_SHELL) $(mkaccess) $(AWK) $(AV_H_DEPEND)
> +cmd_mkaccess = $(mkaccess) $(AWK) $(AV_H_DEPEND)
> 
>  $(subst include/,%/,$(AV_H_FILES)): $(AV_H_DEPEND) $(mkaccess) FORCE
>  	$(call if_changed,mkaccess)
> diff --git a/xen/xsm/flask/policy/mkaccess_vector.sh b/xen/xsm/flask/policy/mkaccess_vector.sh
> old mode 100644
> new mode 100755
> diff --git a/xen/xsm/flask/policy/mkflask.sh b/xen/xsm/flask/policy/mkflask.sh
> old mode 100644
> new mode 100755
> --
> 2.11.0



