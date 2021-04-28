Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B65FE36DAF9
	for <lists+xen-devel@lfdr.de>; Wed, 28 Apr 2021 17:13:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119448.225936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lblsJ-0000s1-0p; Wed, 28 Apr 2021 15:13:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119448.225936; Wed, 28 Apr 2021 15:13:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lblsI-0000rg-Tw; Wed, 28 Apr 2021 15:13:14 +0000
Received: by outflank-mailman (input) for mailman id 119448;
 Wed, 28 Apr 2021 15:13:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k1fc=JZ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lblsH-0000ra-QQ
 for xen-devel@lists.xenproject.org; Wed, 28 Apr 2021 15:13:13 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ea299211-b00a-422c-8626-5ff78fff2a3f;
 Wed, 28 Apr 2021 15:13:12 +0000 (UTC)
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
X-Inumbo-ID: ea299211-b00a-422c-8626-5ff78fff2a3f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619622792;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=B1kvqioY2QIgFfLucJImIn48CIcFgfNBNhRcQVhS7ZU=;
  b=ZockHUVLoIhYColB4huz02kRkrX24iWLNLkShXLSN3CmwdBHOghqyk6w
   ez3Jz6tJ0MwWIMnz08k6aKIRTKUv/3/RzkiZ0HSRMdms5thGEf9oHwhFz
   WjkNIrYh2GHhwtqrsVYjHZ5MPq8PJ6vYYFib3BqgnYrSorIqi8Q112wfU
   4=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: HI0k7YqSjqQ0kp4ecvWo/tVCWs1mUiW2VA6PDCqpsT0euI0b8vriQa6oIk7ZJjvQESgd4d0mSk
 tTXlQGwtV4pHSmWO/2tCfEqHmktc7La6KNG1B0vA8rNV6YB0O6NWYYslCl9eE24r4ghUGjW3sR
 4Wr0ocA0yQ3dUOMxrFo/aCiMfsEbGeHhm1PADOicBZo0w3SreZHu6lRbrdjXFkV4MAkykjelIT
 43AWlK90RxHcJZ/QspaI28ZBFYuuee72dKGPDE4ReZ/wpVIkenCNSYUdbxArH26DfyMevYpU+1
 gjs=
X-SBRS: 5.1
X-MesageID: 42437383
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:yLyZTqlsqy55uEoy5voSZabYfUvpDfK23DAbvn1ZSRFFG/Gwvc
 aogfgdyFvIkz4XQn4tgpStP6OHTHPa+/dOkOssFJ2lWxTrv3btEZF64eLZsl7dMgDd1soY76
 dvdKBiFMb9ZGIQse/W6BS1euxA/PCp66at7N2w815IbSVHL55t9B14DAHzKCFLbS1LH4AwGp
 bZxucvnUvERV0tYs62BmYIUoH4zrWg+a7OWwIMBBIs9WC17Q+A1biSKXal9yZbdShOz7ck+W
 3siBf4+a2njvG+xnbnpgvu06g=
X-IronPort-AV: E=Sophos;i="5.82,258,1613451600"; 
   d="scan'208";a="42437383"
Date: Wed, 28 Apr 2021 16:13:08 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2 01/21] libxl: don't ignore the return value from
 xc_cpuid_apply_policy
Message-ID: <YIl7hMpnN5lxXJ+m@perard>
References: <20210413140140.73690-1-roger.pau@citrix.com>
 <20210413140140.73690-2-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210413140140.73690-2-roger.pau@citrix.com>

On Tue, Apr 13, 2021 at 04:01:19PM +0200, Roger Pau Monne wrote:
> Also change libxl__cpuid_legacy to propagate the error from
> xc_cpuid_apply_policy into callers.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> ---
> Changes since 1:
>  - Return ERROR_FAIL on error.
> ---
>  tools/libs/light/libxl_cpuid.c    | 15 +++++++++++----
>  tools/libs/light/libxl_create.c   |  5 +++--
>  tools/libs/light/libxl_dom.c      |  2 +-
>  tools/libs/light/libxl_internal.h |  4 ++--
>  tools/libs/light/libxl_nocpuid.c  |  5 +++--
>  5 files changed, 20 insertions(+), 11 deletions(-)
> 
> diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
> index 289c59c7420..539fc4869e6 100644
> --- a/tools/libs/light/libxl_cpuid.c
> +++ b/tools/libs/light/libxl_cpuid.c
> @@ -419,11 +419,13 @@ int libxl_cpuid_parse_config_xend(libxl_cpuid_policy_list *cpuid,
>      return 0;
>  }
>  
> -void libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
> -                         libxl_domain_build_info *info)
> +int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
> +                        libxl_domain_build_info *info)
>  {
> +    GC_INIT(ctx);
>      bool pae = true;
>      bool itsc;
> +    int rc;
>  
>      /*
>       * Gross hack.  Using libxl_defbool_val() here causes libvirt to crash in
> @@ -462,8 +464,13 @@ void libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
>      itsc = (libxl_defbool_val(info->disable_migrate) ||
>              info->tsc_mode == LIBXL_TSC_MODE_ALWAYS_EMULATE);
>  
> -    xc_cpuid_apply_policy(ctx->xch, domid, restore, NULL, 0,
> -                          pae, itsc, nested_virt, info->cpuid);
> +    rc = xc_cpuid_apply_policy(ctx->xch, domid, restore, NULL, 0,
> +                               pae, itsc, nested_virt, info->cpuid);
> +    if (rc)
> +        LOGE(ERROR, "Failed to apply CPUID policy");

Is logging `errno` is going to be accurate enough ? The
xc_cpuid_apply_policy() seems to only set `rc` and never change `errno`
directly. It would often return "-errno" or an error code. There's one
instance where we have "rc = -EOPNOTSUPP" but `errno` doesn't seems to
be change to the same value (when checking "featureset).

So maybe having "LOGEV(ERROR, -rc, ...)" would be better?

And it should be `r` instead of `rc`. The latter is for libxl error
code, the former for system call/libxc.

> +
> +    GC_FREE;
> +    return rc ? ERROR_FAIL : 0;

The rest looks good.

Thanks,

-- 
Anthony PERARD

