Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C641036C80D
	for <lists+xen-devel@lfdr.de>; Tue, 27 Apr 2021 16:54:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.118592.224787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbP63-0007lH-Sh; Tue, 27 Apr 2021 14:53:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118592.224787; Tue, 27 Apr 2021 14:53:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbP63-0007ks-PE; Tue, 27 Apr 2021 14:53:55 +0000
Received: by outflank-mailman (input) for mailman id 118592;
 Tue, 27 Apr 2021 14:53:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DJzn=JY=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lbP62-0007kn-Fj
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 14:53:54 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 06709bdb-e01d-4f81-b927-4191a5d58cb4;
 Tue, 27 Apr 2021 14:53:53 +0000 (UTC)
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
X-Inumbo-ID: 06709bdb-e01d-4f81-b927-4191a5d58cb4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619535233;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PmraJt2PcZLw3ukoqUIUIMkKDk24eKFb6OB4E8yxfWI=;
  b=H3YCvxlWBzRLSQMTFhTkrr40dnzYYk8AOhQqtKMTo6IOH0iX5tbzXUjr
   eDYkm/cT9Ug0PWc1Xf1kBfrjCFByjc/k9uJVQJW3h873leX9NA1KXibMr
   4Gkr8vf1ioTq3Kfw16WYUjHBP2ys49CJ2AaUODDriawxgj0z6fO0UR3Cl
   M=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: DkviUs63HqyqHYYrNN0GLeM6LxJMLtcFF5kch6awNEytKwxD1tW3rrHCCDoFG9etmHDgmNKHPB
 5yGatkp2srVuVyq+IWQL7Svtd0Sda1K6fkosY/gzt2y0oQSLgO7N/p8wuAKZV035StNROYAXFy
 9eC7CQTr6BLLyL8PqchWPhrrjLT3GEur8yh1d4tdWX576lsZvsJJOMkcS+GOwv5btHRsmwMl0U
 rTRqvRZmWoP0mUYp3hWYPk6Lm5uA44jryIzULsikcFvlwxDioXRj3oBesqC/7bUQuIPf0IaNys
 kto=
X-SBRS: 5.1
X-MesageID: 42902082
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:ifoPCqgK0Fmgv1wWzjBkTCaJMXBQXkUji2hD6mlwRA09T+Wzva
 mV8sgz/xnylToXRTUMmcqYPrOBXHPb8vdOkO0sFJ2lWxTrv3btEZF64eLZsljdMgD36+I178
 pdWodkDtmYNzRHpOb8pDK1CtMxhOSAmZrY4tv261dIYUVUZ7p77wF/YzzrcHFeYAVdH5I2GN
 69y6N8xwaIQngcYsSlCnRtZYGqzLf2vanrbhIcCxks5BPmt0LK1JfAHwWFxRBbajtTwN4ZgA
 74ujbk7aauuezT8H7h/lLUhq44pOfc
X-IronPort-AV: E=Sophos;i="5.82,254,1613451600"; 
   d="scan'208";a="42902082"
Date: Tue, 27 Apr 2021 15:53:47 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Elliott Mitchell <ehem+xen@m5p.com>
CC: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>
Subject: Re: [RESEND PATCH 1/2] tools/libxl: Mark pointer args of many
 functions constant
Message-ID: <YIgle+MaWg8fhtQy@perard>
References: <cover.1613496229.git.ehem+xen@m5p.com>
 <2e18b114fc91028459b2d6cbfd0f1204501dfde9.1613496229.git.ehem+xen@m5p.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2e18b114fc91028459b2d6cbfd0f1204501dfde9.1613496229.git.ehem+xen@m5p.com>

On Fri, Dec 18, 2020 at 01:37:44PM -0800, Elliott Mitchell wrote:
> Anything *_is_empty(), *_is_default(), or *_gen_json() is going to be
> examining the pointed to thing, not modifying it.  This potentially
> results in higher-performance output.  This also allows spreading
> constants further, allowing more checking and security.
> 
> Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
> ---
> diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
> index 028bc013d9..e3df881d08 100644
> --- a/tools/libs/light/libxl_internal.h
> +++ b/tools/libs/light/libxl_internal.h
[..]
> -static inline bool libxl__string_is_default(char **s)
> +static inline bool libxl__string_is_default(char *const *s)

That looks weird to not also have "char" been "const", but I've tried to
change that and the compiler wasn't cooperative so I guess that's fine.


> diff --git a/tools/libs/light/libxl_nocpuid.c b/tools/libs/light/libxl_nocpuid.c
> index f47336565b..73580351b3 100644
> --- a/tools/libs/light/libxl_nocpuid.c
> +++ b/tools/libs/light/libxl_nocpuid.c
> @@ -40,7 +40,7 @@ void libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
>  }
>  
>  yajl_gen_status libxl_cpuid_policy_list_gen_json(yajl_gen hand,
> -                                libxl_cpuid_policy_list *pcpuid)
> +                                const libxl_cpuid_policy_list *pcpuid)

That change is missing in libxl_cpuid.c.


The rest looks fine, so once libxl_cpuid.c is fix, you can have my Reviewed-by.

Thanks,

-- 
Anthony PERARD

