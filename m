Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6443D25FBEB
	for <lists+xen-devel@lfdr.de>; Mon,  7 Sep 2020 16:17:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFHxj-0007XI-Uv; Mon, 07 Sep 2020 14:17:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Eb3x=CQ=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kFHxi-0007XC-OD
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2020 14:17:38 +0000
X-Inumbo-ID: 6e730772-7d10-4ae4-bbf3-fbc807e84091
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6e730772-7d10-4ae4-bbf3-fbc807e84091;
 Mon, 07 Sep 2020 14:17:37 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id z4so15998410wrr.4
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2020 07:17:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RekR0mQ0rXTAFLR9a2RVTd5wiQPYIC3xor+1W1cXzUg=;
 b=rTMLF4MyKNFK4OhxHYM5HzV5C/zZgpxG5WzM4HAzLlQ5bEtSnxMJbz9NVDxWQSZ5FN
 u8OnjTPOQs+NrCgbB5ZE2w7KhEzyPPyljHUw0qx6MWw5ZjO9lVxwZTCW8BeDqV4i0LJv
 XvVSjM7UEkwzC1kLboqgGlQWEWmLqpAnwe9EBRWc7Qh9NO2/VeT/i5IA6eVtXK6xQXOM
 tgoFsTDOo7L9nKaitr2D5MpU3RNP58frr3Gvi6AtnT38pgCgIKRBCOL9+H/3Ama7Ck26
 uwe5Nh/s4ZjxemF7VuVAfEwA1qnVIXpbRxqtJX6e6FJxg5qsNPnAJ9YXDY/YrkI1YdXK
 fq+A==
X-Gm-Message-State: AOAM5302birvm/zcCQQzTxJP0DqYop97OCRjw2+Z/MKLGKk9K53zEHZj
 ASh3zzfvQhQCnTCBb/Rmpd0=
X-Google-Smtp-Source: ABdhPJwXOWx7KG+fOhc57mo4aexSEZqmgzdoz+ZSgDNI8ORCxneNSHVwRpeYIls8RvlqJnm8EsH74A==
X-Received: by 2002:a5d:43cf:: with SMTP id v15mr23932066wrr.149.1599488256868; 
 Mon, 07 Sep 2020 07:17:36 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id f1sm21187282wrx.75.2020.09.07.07.17.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 07:17:36 -0700 (PDT)
Date: Mon, 7 Sep 2020 14:17:34 +0000
From: Wei Liu <wl@xen.org>
To: George Dunlap <george.dunlap@citrix.com>
Cc: xen-devel@lists.xenproject.org, Nick Rosbrook <rosbrookn@ainfosec.com>,
 Ian Jackson <ian.jackson@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] golang/xenlight: Move to an entirely external repo
Message-ID: <20200907141734.zf4ikuxhu57lwojm@liuwe-devbox-debian-v2>
References: <20200904164000.602618-1-george.dunlap@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200904164000.602618-1-george.dunlap@citrix.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Sep 04, 2020 at 05:40:00PM +0100, George Dunlap wrote:
> Remove all go files and generation targets.
> 
> Add a convenience macro to build the package from staging.  This isn't
> really meant to be called directly; rather, it's meant to be called
> from a corresponding build target inside the external xenlight package
> repo.
> 
> Signed-off-by: George Dunlap <george.dunlap@citrix.com>
> ---
> CC: Nick Rosbrook <rosbrookn@ainfosec.com>
> CC: Ian Jackson <ian.jackson@citrix.com>
> CC: Wei Liu <wl@xen.org>
> ---
>  tools/Makefile                       |    5 +-
>  tools/golang/xenlight/LICENSE        |  502 ----
>  tools/golang/xenlight/Makefile       |   36 +-
>  tools/golang/xenlight/README.md      |   28 -
>  tools/golang/xenlight/gengotypes.py  |  738 -----
>  tools/golang/xenlight/go.mod         |    3 -
>  tools/golang/xenlight/helpers.gen.go | 4182 --------------------------
>  tools/golang/xenlight/types.gen.go   | 1194 --------
>  tools/golang/xenlight/xenlight.go    | 1273 --------
>  9 files changed, 10 insertions(+), 7951 deletions(-)
>  delete mode 100644 tools/golang/xenlight/LICENSE
>  delete mode 100644 tools/golang/xenlight/README.md
>  delete mode 100644 tools/golang/xenlight/gengotypes.py
>  delete mode 100644 tools/golang/xenlight/go.mod
>  delete mode 100644 tools/golang/xenlight/helpers.gen.go
>  delete mode 100644 tools/golang/xenlight/types.gen.go
>  delete mode 100644 tools/golang/xenlight/xenlight.go
> 
> diff --git a/tools/Makefile b/tools/Makefile
> index 198b239edc..f24d7b6f74 100644
> --- a/tools/Makefile
> +++ b/tools/Makefile
> @@ -31,7 +31,6 @@ endif
>  
>  SUBDIRS-y += xenpmd
>  SUBDIRS-y += libxl
> -SUBDIRS-$(CONFIG_GOLANG) += golang
>  SUBDIRS-y += xl
>  SUBDIRS-y += helpers
>  SUBDIRS-$(CONFIG_X86) += xenpaging
> @@ -113,7 +112,7 @@ endif
>  #    Pull to the most recent update (as if you had checked it out for the
>  #    first time)
>  #  subdir-all-${target}-dir
> -#    Do "make all" for ${target}, including all prerequisites (such as 
> +#    Do "make all" for ${target}, including all prerequisites (such as
>  #    configure)
>  #  subdir-install-${target}-dir
>  #    Do "make install" for $TARGET
> @@ -126,7 +125,7 @@ endif
>  #  ${target}-dir-remote
>  #    Where remote repositories are cloned
>  #  ${target}
> -#    Where a copy of the source files are put when building a source 
> +#    Where a copy of the source files are put when building a source

Unrelated changes here?

Wei.

