Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E03B56A5CA
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jul 2022 16:47:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363009.593315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9SlY-0004As-Jq; Thu, 07 Jul 2022 14:46:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363009.593315; Thu, 07 Jul 2022 14:46:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9SlY-00048q-GY; Thu, 07 Jul 2022 14:46:04 +0000
Received: by outflank-mailman (input) for mailman id 363009;
 Thu, 07 Jul 2022 14:46:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OPum=XM=citrix.com=prvs=180b97372=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1o9SlW-00048k-Ie
 for xen-devel@lists.xenproject.org; Thu, 07 Jul 2022 14:46:02 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8286445c-fe03-11ec-924f-1f966e50362f;
 Thu, 07 Jul 2022 16:45:59 +0200 (CEST)
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
X-Inumbo-ID: 8286445c-fe03-11ec-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1657205159;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GHa4za0cnyCaXsE/HB2cx8kWg7YDvwgRAJqgMqmSCy4=;
  b=eZa9sSfm8pbSkpG3GL68OtgPGLJ3M68doaupFj6L+VYy0Oq5zLymuWMu
   3OJI+6+LBMknJlvZsx/HQez5uJrzm8WdV3BL8SfeOo6Et1cGD2YBO0iHJ
   do+BU7SeYqEYPPEhAYyswfMhbAIT75ZqwJw6qg/sivcrcZjiqg30McLm4
   k=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 75113405
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:hV8MwKJi4BMw2bZtFE+RhpUlxSXFcZb7ZxGr2PjKsXjdYENS1GEOz
 2QdXz+Bbq2OMzHxeNxzYI218kIAsMKDmt5jTQdlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA14+IMsdoUg7wbRh3dY32YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 I1WkaCXSFotB4nFgsccCQNbA2ZhIqITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBMDtIIMYvGAm1TzDBOwqaZvCX7/L9ZlT2zJYasVmQquHP
 pFFMWcHgBLoJAZEIVQNA5QHrsj5h3jaUDAIkQiQjP9ii4TU5FMoi+W8WDbPQfSVQe1Fk0Deo
 XjJl0zpDxdfONGBxD6t9nO3mvSJjS79QJgVFrCz6rhtmlL77m4cEhoNTnOgvOK0zEW5Xrpix
 1c8o3R06/JorQryE4e7D0bQTGO4UgA0A8F0L8o7tQW07qPOwAfDHGsUCSFeZ4lz3CMpfgDGx
 mNljvuwW2Ew6eXNGS/HnluHhWjsYHZIdAfucQdBFFJYuIe7/enfmzqVFr5e/LiJYsoZ8N0a6
 xSDt2AAiroalqbnPI3rrAmc01pASnUkJzPZBzk7vUr/t2uVnKb/O+SVBaHztJ6s1rqxQFibp
 2QjkMOD9u0IBpzlvHXTHbpUR+v3vqjZame0bbtT834Jrm3FxpJeVdoIvGEWyLlBaK7ohgMFk
 GeM4FgMtfe/zVOhbLNtYpLZNvnGOZPITIy/PtiNN4ImSsEoKGevoXA1DWbNjj+FraTZufxmU
 XttWZ30XShy5GUO5GfeetrxJpdynX1imzyPGcGTItbO+eP2WUN5gIwtaDOmBt3VJoveyOkJ2
 76z7/e39ig=
IronPort-HdrOrdr: A9a23:0rZIAa2EO2d1ImTDILYtVAqjBLIkLtp133Aq2lEZdPRUGvb3qy
 mLpoV+6faUskd1ZJhOo7290cW7LU80sKQFhrX5Xo3SPjUO2lHJEGgK1+KLqFfd8m/Fh41gPM
 9bAs5D4bbLbGSS4/yU3DWF
X-IronPort-AV: E=Sophos;i="5.92,253,1650945600"; 
   d="scan'208";a="75113405"
Date: Thu, 7 Jul 2022 15:45:36 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Juergen Gross <jgross@suse.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] tools/init-xenstore-domain: fix memory map for PVH
 stubdom
Message-ID: <YsbxkNT+3w/lL9He@perard.uk.xensource.com>
References: <20220624092806.27700-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220624092806.27700-1-jgross@suse.com>

On Fri, Jun 24, 2022 at 11:28:06AM +0200, Juergen Gross wrote:
> In case of maxmem != memsize the E820 map of the PVH stubdom is wrong,
> as it is missing the RAM above memsize.
> 
> Additionally the MMIO area should only cover the HVM special pages.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  tools/helpers/init-xenstore-domain.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/tools/helpers/init-xenstore-domain.c b/tools/helpers/init-xenstore-domain.c
> index b4f3c65a8a..dad8e43c42 100644
> --- a/tools/helpers/init-xenstore-domain.c
> +++ b/tools/helpers/init-xenstore-domain.c
> @@ -157,21 +158,24 @@ static int build(xc_interface *xch)
>          config.flags |= XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap;
>          config.arch.emulation_flags = XEN_X86_EMU_LAPIC;
>          dom->target_pages = mem_size >> XC_PAGE_SHIFT;
> -        dom->mmio_size = GB(4) - LAPIC_BASE_ADDRESS;
> +        dom->mmio_size = X86_HVM_NR_SPECIAL_PAGES << XC_PAGE_SHIFT;
>          dom->lowmem_end = (mem_size > LAPIC_BASE_ADDRESS) ?
>                            LAPIC_BASE_ADDRESS : mem_size;
>          dom->highmem_end = (mem_size > LAPIC_BASE_ADDRESS) ?
>                             GB(4) + mem_size - LAPIC_BASE_ADDRESS : 0;
> -        dom->mmio_start = LAPIC_BASE_ADDRESS;
> +        dom->mmio_start = (X86_HVM_END_SPECIAL_REGION -
> +                           X86_HVM_NR_SPECIAL_PAGES) << XC_PAGE_SHIFT;
>          dom->max_vcpus = 1;
>          e820[0].addr = 0;
> -        e820[0].size = dom->lowmem_end;
> +        e820[0].size = (max_size > LAPIC_BASE_ADDRESS) ?
> +                       LAPIC_BASE_ADDRESS : max_size;
>          e820[0].type = E820_RAM;
> -        e820[1].addr = LAPIC_BASE_ADDRESS;
> +        e820[1].addr = dom->mmio_start;


So, it isn't expected to have an entry covering the LAPIC addresses,
right? I guess not as seen in df1ca1dfe20.

But based on that same commit info, shouldn't the LAPIC address part of
`dom->mmio_start, dom->mmio_size`? (I don't know how dom->mmio_start is
used, yet, but maybe it's used by Xen or xen libraries to avoid
allocations in the wrong places)

Thanks,

-- 
Anthony PERARD

