Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACADB227FEC
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jul 2020 14:27:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxrMA-00006W-K4; Tue, 21 Jul 2020 12:26:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UXjz=BA=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jxrM9-00006K-4x
 for xen-devel@lists.xen.org; Tue, 21 Jul 2020 12:26:49 +0000
X-Inumbo-ID: 722ee146-cb4d-11ea-850b-bc764e2007e4
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 722ee146-cb4d-11ea-850b-bc764e2007e4;
 Tue, 21 Jul 2020 12:26:48 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id r12so20915771wrj.13
 for <xen-devel@lists.xen.org>; Tue, 21 Jul 2020 05:26:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=atZwIHpY/sgLajW2nfxSRAQzRfTgPG8P0iRMDyO5FOA=;
 b=TUFtV7VtGyCz2kZwOlC6nsuwma5lYG/5a9E9lfC7vJsfuZE6/toFTEc8rbsedagLIW
 fY5FBzBAsdzaMsWPOmNI93sfxl/DDNYIOszAWjd/lC30ivxjRbHFPVk0rJ3jaQ06/N6g
 ho7SPDHV7A3ZHeWt0ypWNJvKtuZho1HYie64QBhFZow6ADwh7fABkysG6517UJeiQaZw
 Yml6AaY3Z/JDaIpClKqdcCTyrpaaj2snT3bI2Vc7sNWnsU3TE/odsebUBud7WkWds0rF
 y+1DmNP7RfOK1n2orHzBak3Ra+9f5ytHfBH+zSwh5/TC/zDy8XMnD3jtgm1zUAZHLXN+
 dKTg==
X-Gm-Message-State: AOAM531T8tR0iyx4h831xCua3CDNK2/SXwNdNnGLw2gmTByf5uonhMQz
 QHot5SCoIBx00KpkSeBqxbI=
X-Google-Smtp-Source: ABdhPJyIgHV0sGwD2jTmshExbYkeQJPANEAT6pilLxmZTT0bGH2L2e+r1gwDG/PuEyaauqQM/CeJ6w==
X-Received: by 2002:adf:f542:: with SMTP id j2mr26558225wrp.61.1595334407315; 
 Tue, 21 Jul 2020 05:26:47 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id u10sm3156403wml.29.2020.07.21.05.26.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 05:26:46 -0700 (PDT)
Date: Tue, 21 Jul 2020 12:26:45 +0000
From: Wei Liu <wl@xen.org>
To: Elliott Mitchell <ehem+xen@m5p.com>
Subject: Re: [PATCH 1/2] Partially revert "Cross-compilation fixes."
Message-ID: <20200721122645.qcens4lqq5vcnmz4@liuwe-devbox-debian-v2>
References: <20200718033121.GA88869@mattapan.m5p.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200718033121.GA88869@mattapan.m5p.com>
User-Agent: NeoMutt/20180716
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
Cc: dave@recoil.org, ian.jackson@eu.citrix.com, christian.lindig@citrix.com,
 wl@xen.org, xen-devel@lists.xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Jul 17, 2020 at 08:31:21PM -0700, Elliott Mitchell wrote:
> This partially reverts commit 16504669c5cbb8b195d20412aadc838da5c428f7.

Ok, so this commit is really old.

> 
> Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
> ---
> Doesn't look like much of 16504669c5cbb8b195d20412aadc838da5c428f7
> actually remains due to passage of time.
> 
> Of the 3, both Python and pygrub appear to mostly be building just fine
> cross-compiling.  The OCAML portion is being troublesome, this is going
> to cause bug reports elsewhere soon.  The OCAML portion though can
> already be disabled by setting OCAML_TOOLS=n and shouldn't have this
> extra form of disabling.

The reasoning here is fine by me. And it should be part of the commit
message.

I would like to also add "tools: prefix to the subject line:

  tools: Partially revert "Cross-compilation fixes."

If you agree with these changes, no action is required from you. I can
handle everything while committing.

Wei.

> ---
>  tools/Makefile | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/tools/Makefile b/tools/Makefile
> index 7b1f6c4d28..930a533724 100644
> --- a/tools/Makefile
> +++ b/tools/Makefile
> @@ -40,12 +40,9 @@ SUBDIRS-$(CONFIG_X86) += debugger/gdbsx
>  SUBDIRS-$(CONFIG_X86) += debugger/kdd
>  SUBDIRS-$(CONFIG_TESTS) += tests
>  
> -# These don't cross-compile
> -ifeq ($(XEN_COMPILE_ARCH),$(XEN_TARGET_ARCH))
>  SUBDIRS-y += python
>  SUBDIRS-y += pygrub
>  SUBDIRS-$(OCAML_TOOLS) += ocaml
> -endif
>  
>  ifeq ($(CONFIG_RUMP),y)
>  SUBDIRS-y := libs libxc xenstore
> -- 
> 2.20.1
> 
> 
> 
> -- 
> (\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
>  \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
>   \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
> 8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445
> 
> 

