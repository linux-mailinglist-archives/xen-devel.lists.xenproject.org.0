Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B95284F4158
	for <lists+xen-devel@lfdr.de>; Tue,  5 Apr 2022 23:30:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299300.509920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbqkH-0007v1-2u; Tue, 05 Apr 2022 21:29:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299300.509920; Tue, 05 Apr 2022 21:29:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbqkG-0007t8-Vt; Tue, 05 Apr 2022 21:29:48 +0000
Received: by outflank-mailman (input) for mailman id 299300;
 Tue, 05 Apr 2022 21:29:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MzGd=UP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nbqkF-0007t2-Jy
 for xen-devel@lists.xenproject.org; Tue, 05 Apr 2022 21:29:47 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 836d19ad-b527-11ec-a405-831a346695d4;
 Tue, 05 Apr 2022 23:29:46 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1A08F60B27;
 Tue,  5 Apr 2022 21:29:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E57E7C385A0;
 Tue,  5 Apr 2022 21:29:42 +0000 (UTC)
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
X-Inumbo-ID: 836d19ad-b527-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649194184;
	bh=c51LbxwDI/FcwYFKGIeVEXxJA62Vsl9SruHiV2DaCcg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZOclNNf79KKqisU5KkDbtOfxUAXYJhHyw1NynRQtprV53R+NbkxTyn9WPOUy+Wy+J
	 HQCTZ4y+6Uk05GY8x2cojuC8vj3wccR2Gswt0/y4ymRBQ//KtQstFq0ZbSm1aH8qLg
	 PK1r2NWMLHPp9bkgkbh0ZaFoyjtFv78pjw4r8/Gz77bN/TIpGcyCRUWfPtDHS5NcC6
	 W26Rzlp3GSsQ2X9D5vHn+pmOHUgivWKmHxOhgq0tgAr+ecv2nOjq938VR5VvkhFxCD
	 BaRUaSi5bCsaqdTPEx4El2bJWCAhs4UWzfU2sVEDFtEjQ1d6aTqNLnkXSapL34CZAE
	 JTrNVpCy01jQA==
Date: Tue, 5 Apr 2022 14:29:42 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 15/19] xen/arm: mm: Clean-up the includes and order
 them
In-Reply-To: <20220221102218.33785-16-julien@xen.org>
Message-ID: <alpine.DEB.2.22.394.2204051428150.2910984@ubuntu-linux-20-04-desktop>
References: <20220221102218.33785-1-julien@xen.org> <20220221102218.33785-16-julien@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 21 Feb 2022, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> The numbers of includes in mm.c has been growing quite a lot. However
> some of them (e.g. xen/device_tree.h, xen/softirq.h) doesn't look
> to be directly used by the file or other will be included by
> larger headers (e.g asm/flushtlb.h will be included by xen/mm.h).
> 
> So trim down the number of includes. Take the opportunity to order
> them with the xen headers first, then asm headers and last public
> headers.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

I'll trust you on this one :-)

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>     Changes in v3:
>         - Patch added
> ---
>  xen/arch/arm/mm.c | 27 ++++++++++-----------------
>  1 file changed, 10 insertions(+), 17 deletions(-)
> 
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index b7942464d4de..659bdf25e0ff 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -17,33 +17,26 @@
>   * GNU General Public License for more details.
>   */
>  
> -#include <xen/compile.h>
> -#include <xen/types.h>
> -#include <xen/device_tree.h>
> -#include <xen/init.h>
> -#include <xen/mm.h>
> -#include <xen/preempt.h>
> +#include <xen/domain_page.h>
>  #include <xen/errno.h>
>  #include <xen/grant_table.h>
> -#include <xen/softirq.h>
> -#include <xen/event.h>
>  #include <xen/guest_access.h>
> -#include <xen/domain_page.h>
> -#include <xen/err.h>
> -#include <asm/page.h>
> -#include <asm/current.h>
> -#include <asm/flushtlb.h>
> -#include <public/memory.h>
> +#include <xen/init.h>
> +#include <xen/libfdt/libfdt.h>
> +#include <xen/mm.h>
> +#include <xen/pfn.h>
>  #include <xen/sched.h>
> +#include <xen/sizes.h>
> +#include <xen/types.h>
>  #include <xen/vmap.h>
> +
>  #include <xsm/xsm.h>
> -#include <xen/pfn.h>
> -#include <xen/sizes.h>
> -#include <xen/libfdt/libfdt.h>
>  
>  #include <asm/fixmap.h>
>  #include <asm/setup.h>
>  
> +#include <public/memory.h>
> +
>  /* Override macros from asm/page.h to make them work with mfn_t */
>  #undef virt_to_mfn
>  #define virt_to_mfn(va) _mfn(__virt_to_mfn(va))
> -- 
> 2.32.0
> 

