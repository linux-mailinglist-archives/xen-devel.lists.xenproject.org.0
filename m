Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE4328CF17
	for <lists+xen-devel@lfdr.de>; Tue, 13 Oct 2020 15:26:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6206.16470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSKJh-0003GL-28; Tue, 13 Oct 2020 13:26:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6206.16470; Tue, 13 Oct 2020 13:26:13 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSKJg-0003Fw-Uf; Tue, 13 Oct 2020 13:26:12 +0000
Received: by outflank-mailman (input) for mailman id 6206;
 Tue, 13 Oct 2020 13:26:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=utaj=DU=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kSKJe-0003Fq-PG
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 13:26:10 +0000
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2244d217-60a2-4ff9-a333-d7491bf52b1d;
 Tue, 13 Oct 2020 13:26:09 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id x7so15436586wrl.3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2020 06:26:09 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id o4sm10503356wrv.8.2020.10.13.06.26.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2020 06:26:08 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=utaj=DU=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
	id 1kSKJe-0003Fq-PG
	for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 13:26:10 +0000
X-Inumbo-ID: 2244d217-60a2-4ff9-a333-d7491bf52b1d
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 2244d217-60a2-4ff9-a333-d7491bf52b1d;
	Tue, 13 Oct 2020 13:26:09 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id x7so15436586wrl.3
        for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2020 06:26:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QPZ70J0XAqH1Y+3yiN9i/DCST6pKlHsLt1ByqYIpk40=;
        b=NZCqdq6EF3mCDTO9pptVYwmTxOFHfptt5CeS3Pt3kK5frhSMzMhPWQHMuZHdGuzSNq
         XSvYqWonFvo76IAn7L2gDKduYPojSG6rzjDB7gBh465OmFMcUl100pQu6B2oTSSHTzyN
         SZnvFZJvICXhSvafO/veFQ/xkKbWrIBHHsS9CiwF//2hTeyYYzUPSMXtB27Tn82Npe80
         P0e317t1shOS+xcC629obgfns0QauOY7YC7VD6vGyoRVGeloYkZv/XhUa2CZm4+2RKfv
         i7DgFJ1hjzlBC/i6Iwfs5HQobXJp+/wmMu3N9oh4f3+iVJqgLEbSiJuHmD1NyNvB49Wr
         BPTQ==
X-Gm-Message-State: AOAM533Pk4AaScttJQiFFA7yw5SHKEnQyBDndvlS385HsfckSu/tkZyx
	uOiO3PIraqMcXGtfYCLpksEPS3W+X7U=
X-Google-Smtp-Source: ABdhPJxs97Jimm846Z8fGA3+LE3GrWk+XhgYsRu5WWMTJFobMmN0e8VDSqVEAyvU21Pic2nhm/xB/w==
X-Received: by 2002:adf:de89:: with SMTP id w9mr12997973wrl.212.1602595569016;
        Tue, 13 Oct 2020 06:26:09 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id o4sm10503356wrv.8.2020.10.13.06.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 06:26:08 -0700 (PDT)
Date: Tue, 13 Oct 2020 13:26:06 +0000
From: Wei Liu <wl@xen.org>
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [SECOND RESEND] [PATCH] tools/python: Pass linker to Python
 build process
Message-ID: <20201013132606.7ff35mmpesklbmcx@liuwe-devbox-debian-v2>
References: <20201012011139.GA82449@mattapan.m5p.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201012011139.GA82449@mattapan.m5p.com>
User-Agent: NeoMutt/20180716

On Sun, Oct 11, 2020 at 06:11:39PM -0700, Elliott Mitchell wrote:
> Unexpectedly the environment variable which needs to be passed is
> $LDSHARED and not $LD.  Otherwise Python may find the build `ld` instead
> of the host `ld`.
> 
> Replace $(LDFLAGS) with $(SHLIB_LDFLAGS) as Python needs shared objects
> it can load at runtime, not executables.
> 
> This uses $(CC) instead of $(LD) since Python distutils appends $CFLAGS
> to $LDFLAGS which breaks many linkers.
> 
> Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
> ---
> This is now the *third* time this has been sent to the list.  Mark Pryor
> has tested and confirms Python cross-building is working.  There is one
> wart left which I'm unsure of the best approach for.
> 
> Having looked around a bit, I believe this is a Python 2/3 compatibility
> issue.  "distutils" for Python 2 likely lacked a separate $LDSHARED or
> $LD variable, whereas Python 3 does have this.  Alas this is pointless
> due to the above (unless you can cause distutils.py to do the final link
> step separately).

I think this is well-reasoned but I don't have time to figure out and
verify the details.

Marek, do you have any comment on this?

> ---
>  tools/pygrub/Makefile | 9 +++++----
>  tools/python/Makefile | 9 +++++----
>  2 files changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/tools/pygrub/Makefile b/tools/pygrub/Makefile
> index 3063c4998f..37b2146214 100644
> --- a/tools/pygrub/Makefile
> +++ b/tools/pygrub/Makefile
> @@ -3,20 +3,21 @@ XEN_ROOT = $(CURDIR)/../..
>  include $(XEN_ROOT)/tools/Rules.mk
>  
>  PY_CFLAGS = $(CFLAGS) $(PY_NOOPT_CFLAGS)
> -PY_LDFLAGS = $(LDFLAGS) $(APPEND_LDFLAGS)
> +PY_LDFLAGS = $(SHLIB_LDFLAGS) $(APPEND_LDFLAGS)
>  INSTALL_LOG = build/installed_files.txt
>  
>  .PHONY: all
>  all: build
>  .PHONY: build
>  build:
> -	CC="$(CC)" CFLAGS="$(PY_CFLAGS)" LDFLAGS="$(PY_LDFLAGS)" $(PYTHON) setup.py build
> +	CC="$(CC)" CFLAGS="$(PY_CFLAGS)" LDSHARED="$(CC)" LDFLAGS="$(PY_LDFLAGS)" $(PYTHON) setup.py build
>  
>  .PHONY: install
>  install: all
>  	$(INSTALL_DIR) $(DESTDIR)/$(bindir)
> -	CC="$(CC)" CFLAGS="$(PY_CFLAGS)" LDFLAGS="$(PY_LDFLAGS)" $(PYTHON) \
> -		setup.py install --record $(INSTALL_LOG) $(PYTHON_PREFIX_ARG) \
> +	CC="$(CC)" CFLAGS="$(PY_CFLAGS)" LDSHARED="$(CC)" \
> +		LDFLAGS="$(PY_LDFLAGS)" $(PYTHON) setup.py install \
> +		--record $(INSTALL_LOG) $(PYTHON_PREFIX_ARG) \
>  		 --root="$(DESTDIR)" --install-scripts=$(LIBEXEC_BIN) --force
>  	set -e; if [ $(bindir) != $(LIBEXEC_BIN) -a \
>  	             "`readlink -f $(DESTDIR)/$(bindir)`" != \
> diff --git a/tools/python/Makefile b/tools/python/Makefile
> index 8d22c03676..b675f5b4de 100644
> --- a/tools/python/Makefile
> +++ b/tools/python/Makefile
> @@ -5,19 +5,20 @@ include $(XEN_ROOT)/tools/Rules.mk
>  all: build
>  
>  PY_CFLAGS = $(CFLAGS) $(PY_NOOPT_CFLAGS)
> -PY_LDFLAGS = $(LDFLAGS) $(APPEND_LDFLAGS)
> +PY_LDFLAGS = $(SHLIB_LDFLAGS) $(APPEND_LDFLAGS)
>  INSTALL_LOG = build/installed_files.txt
>  
>  .PHONY: build
>  build:
> -	CC="$(CC)" CFLAGS="$(PY_CFLAGS)" $(PYTHON) setup.py build
> +	CC="$(CC)" CFLAGS="$(PY_CFLAGS)" LDSHARED="$(CC)" LDFLAGS="$(PY_LDFLAGS)" $(PYTHON) setup.py build
>  
>  .PHONY: install
>  install:
>  	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
>  
> -	CC="$(CC)" CFLAGS="$(PY_CFLAGS)" LDFLAGS="$(PY_LDFLAGS)" $(PYTHON) \
> -		setup.py install --record $(INSTALL_LOG) $(PYTHON_PREFIX_ARG) \
> +	CC="$(CC)" CFLAGS="$(PY_CFLAGS)" LDSHARED="$(CC)" \
> +		LDFLAGS="$(PY_LDFLAGS)" $(PYTHON) setup.py install \
> +		--record $(INSTALL_LOG) $(PYTHON_PREFIX_ARG) \
>  		--root="$(DESTDIR)" --force
>  
>  	$(INSTALL_PYTHON_PROG) scripts/convert-legacy-stream $(DESTDIR)$(LIBEXEC_BIN)
> -- 
> 2.20.1
> 
> 
> -- 
> (\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
>  \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
>   \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
> 8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445
> 
> 

