Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 559A4244BEA
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 17:23:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6bY4-0007vI-WF; Fri, 14 Aug 2020 15:23:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iRrF=BY=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1k6bY3-0007vC-Pl
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 15:23:15 +0000
X-Inumbo-ID: a4644e77-e35c-4baf-a6c6-bbfcbc2e040f
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a4644e77-e35c-4baf-a6c6-bbfcbc2e040f;
 Fri, 14 Aug 2020 15:23:15 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id t14so8239316wmi.3
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2020 08:23:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=4doQWly8isTNwWUwCFj+iSrQt1El8VgjqfTVucCQ208=;
 b=LhRShZy+n+1ogrE3nW6xDtJeT+HOtotYW33FocWJ2rRzEzvUDyEkYRqoRDgrxuqugd
 w4Gq7AefC6vNyCK7bYVSkPQPK0oLD5ncPsqNKb9HAkzkErc/fklZxyG+741D2AnHugJ3
 cXW9M4SFT1riVBNlt8cQeyTtPhfkGZH1oqOqaklGFCvKf0C3ndCkVUdg2OMK+JUALKBw
 MBZme1jwO193cdUdCuXXXTJ4Q1q9xBuCGV5J7uHBCTPOvG2htp0PI372P5r4WYhStq1+
 2CDTnK1sECnw2u4S9EO2/cX6IxjNYXbO0FQDtt7/RHoRzFXU2FVaeTAAhuF63F128OhX
 S0Tw==
X-Gm-Message-State: AOAM531ZsIOBU5s4yBHoaxFyeaa0g33xs6Jwh+aj4MdGLVzqrdm/oRbw
 Y1WpPDt4Et4ukblOktTX/5s=
X-Google-Smtp-Source: ABdhPJz3FmoXoE6peEVJaewBwgYtsKkz2rahWZp0Fbos2FUMuCzh7EIPMcXoDQXW8xOvph5rL5BUOQ==
X-Received: by 2002:a7b:c95a:: with SMTP id i26mr3156607wml.106.1597418594309; 
 Fri, 14 Aug 2020 08:23:14 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id p25sm15122624wma.39.2020.08.14.08.23.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Aug 2020 08:23:13 -0700 (PDT)
Date: Fri, 14 Aug 2020 15:23:11 +0000
From: Wei Liu <wl@xen.org>
To: Don Slutz <don.slutz@gmail.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH] rpmball: Adjust to new rpm, do not require --force
Message-ID: <20200814152311.vqub6iyihijie2ur@liuwe-devbox-debian-v2>
References: <10c7314a9e1b89fa030d11d5ce6664e1e77179d9.1596997354.git.don.slutz@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10c7314a9e1b89fa030d11d5ce6664e1e77179d9.1596997354.git.don.slutz@gmail.com>
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

On Sun, Aug 09, 2020 at 02:22:34PM -0400, Don Slutz wrote:
> From: Don Slutz <Don.Slutz@Gmail.com>
> 
> Also prevent warning: directory /boot: remove failed
> 
> Before:
> 
> [root@TestCloud1 xen]# rpm -hiv dist/xen*rpm
> Preparing...                          ################################# [100%]
>         file /boot from install of xen-4.15-unstable.x86_64 conflicts with file from package filesystem-3.2-25.el7.x86_64
>         file /usr/bin from install of xen-4.15-unstable.x86_64 conflicts with file from package filesystem-3.2-25.el7.x86_64
>         file /usr/lib from install of xen-4.15-unstable.x86_64 conflicts with file from package filesystem-3.2-25.el7.x86_64
>         file /usr/lib64 from install of xen-4.15-unstable.x86_64 conflicts with file from package filesystem-3.2-25.el7.x86_64
>         file /usr/sbin from install of xen-4.15-unstable.x86_64 conflicts with file from package filesystem-3.2-25.el7.x86_64
> [root@TestCloud1 xen]# rpm -e xen
> warning: directory /boot: remove failed: Device or resource busy
> 
> After:
> 
> [root@TestCloud1 xen]# rpm -hiv dist/xen*rpm
> Preparing...                          ################################# [100%]
> Updating / installing...
>    1:xen-4.15-unstable                ################################# [100%]
> [root@TestCloud1 xen]# rpm -e xen
> [root@TestCloud1 xen]#
> 
> Signed-off-by: Don Slutz <Don.Slutz@Gmail.com>

Acked-by: Wei Liu <wl@xen.org>

Since this is only a spec file for developers, I think the risk of
breaking things is minimal.

> ---
>  tools/misc/mkrpm | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/misc/mkrpm b/tools/misc/mkrpm
> index ae40e1a..68819b2 100644
> --- a/tools/misc/mkrpm
> +++ b/tools/misc/mkrpm
> @@ -62,7 +62,8 @@ rm -rf \$RPM_BUILD_ROOT
>  
>  %files
>  %defattr(-,root,root,-)
> -/*
> +/*/*/*
> +/boot/*
>  
>  %post
>  EOF
> -- 
> 1.8.3.1
> 

