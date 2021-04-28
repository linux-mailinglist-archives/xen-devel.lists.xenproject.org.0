Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D80D036DD64
	for <lists+xen-devel@lfdr.de>; Wed, 28 Apr 2021 18:46:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119488.225979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbnKV-00011l-Dn; Wed, 28 Apr 2021 16:46:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119488.225979; Wed, 28 Apr 2021 16:46:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbnKV-00011M-AN; Wed, 28 Apr 2021 16:46:27 +0000
Received: by outflank-mailman (input) for mailman id 119488;
 Wed, 28 Apr 2021 16:46:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k1fc=JZ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lbnKT-00011H-Is
 for xen-devel@lists.xenproject.org; Wed, 28 Apr 2021 16:46:25 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 55e21b68-c561-4e78-b39f-01abe6afd4fe;
 Wed, 28 Apr 2021 16:46:24 +0000 (UTC)
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
X-Inumbo-ID: 55e21b68-c561-4e78-b39f-01abe6afd4fe
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619628384;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=s8Wl/0SNGm01WkEH6lmRxy+gLY5wuyFsVXOVP9gosiQ=;
  b=c/sSMYqsgAVcgPOJXba0bS1ZvRM3LL4PvGTiZsoDejieixxSHo4MpcW/
   vKlj1XTz91XhAdo/KUHtwEZZBeUl33YFZNiOuxxXHZEXQOfmJObtwgpAv
   6XFetC2oNSE6CzNQQ04VWpOlxrnHM1pXqGRbAV8cG8eLHRjETagQpAa9Q
   w=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: YZNX38uhHeiNnrQ8TT4+aPPFs0zROO1tfRo6NVfMkZM6QA4K+X3CqgmFiTGh8qRQTrSwtjMM+l
 Pbqg+1oObi8rQoBjBlh4ml2ot7h3al+ZXafJsM8UlZfMNMQJdRcINAxR3nU6GJXOzPugMx9lX9
 QQoVk64voLDrhrmuW5Ewhdwsva2dbkHnvyono70k1GgmYWcBmwkG/RGU23HPX/pPNCKfJDDbDt
 vFh1EBu8Rc4jcKUSecM1PotizR2CokbEs58vX5qX5f4fEJj1qZp0G+shwR1nGML2AB3ahc+DS3
 fyI=
X-SBRS: 5.1
X-MesageID: 42641249
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:AUO3sauiKy02AJZc3YsYGOHp7skD6dV00zAX/kB9WHVpW+az/v
 rBoN0w0xjohDENHFwhg8mHIqmcQXXanKQFhbU5F7GkQQXgpS+UPJhvhLGSpgHINiXi+odmuJ
 tIXLN5DLTLYWRSrcG/2wWgFsZl/d/vytHOuc7771NACT5ncLth6QARMHf4LmRTSBNdDZQ0UL
 qwj/AmmxOadX4abtu2CxA+NoCpzeHjr57obQULABQq8mC1/FCVwYX3DgSC2VMmWy5PqI1Sl1
 TtqRDz5amorpiAqyP06mm71ftrpOc=
X-IronPort-AV: E=Sophos;i="5.82,258,1613451600"; 
   d="scan'208";a="42641249"
Date: Wed, 28 Apr 2021 17:45:59 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v2 21/21] libs/guest: (re)move xc_cpu_policy_apply_cpuid
Message-ID: <YImRRw++5Kayv+Cn@perard>
References: <20210413140140.73690-1-roger.pau@citrix.com>
 <20210413140140.73690-22-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210413140140.73690-22-roger.pau@citrix.com>

On Tue, Apr 13, 2021 at 04:01:39PM +0200, Roger Pau Monne wrote:
> diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
> index cadc8b2a05e..6be2d773d1d 100644
> --- a/tools/libs/light/libxl_cpuid.c
> +++ b/tools/libs/light/libxl_cpuid.c
> @@ -419,6 +419,136 @@ int libxl_cpuid_parse_config_xend(libxl_cpuid_policy_list *cpuid,
>      return 0;
>  }
>  
> +static int apply_cpuid(libxl_ctx *ctx, xc_cpu_policy_t policy,

I'm pretty sure we want `libxl__gc` here instead of `ctx`. `ctx` will
then by available via `CTX`. (and the GC_* macro will not need to be called)


Beside that, there is also the need to store libxc return values in 'r'
instead 'rc', and maybe use LOG*D macros to log the domid on error
messages.

Thanks,

-- 
Anthony PERARD

