Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71762218545
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jul 2020 12:50:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jt7d4-0002Du-ND; Wed, 08 Jul 2020 10:48:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=65hh=AT=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jt7d3-0002Do-5C
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2020 10:48:41 +0000
X-Inumbo-ID: 92dac832-c108-11ea-8e28-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 92dac832-c108-11ea-8e28-12813bfff9fa;
 Wed, 08 Jul 2020 10:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594205315;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=96w8xFOqjvMpiz+UgwWoWBOlDLJJV1ZTJ/4HdyPtyiU=;
 b=XeV+SWUUyF2p7/YaZ3vmYNsV3AXfwJN+PUlqmg+GNVaxu3NNNT/2qnf3
 MYuoSA2ZvNjA6/DJ4uz1HSkaFRPIPLjDlfb8n8ftAaMoGcMmMgselCY/4
 XTBm6XJcEx6oZQUHdK5jOxBoYAqO8wopjvpUzA2qHGt1oWtLHtvdKNwPu U=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Vwgn8c+qvSq74E1FDcXRKZSnY5J0JUKdnYXTrXkjPEWjIhztddzMOf/XaHARm3PmgkcSZ4sbhA
 QBY6HAZfV+FnjQRy9Wds8rRzFss59qAgSpkMkFY540J3qO0BETMjRLlOjp7somH5FeWGRpWhXi
 2IkWoeKBC0F5xlW4dJTia9gz5mS33uUbr4sDmOu/GPP5pc96NN/9JzBsjUUtZPdPH7eijKaD6A
 tyBck01yimnWY1WIbaDnXW+N+4hUpPOukbAdHiMRy4aY1AJ4RYSFqQ/jSzzPcX8z2hSdwm5uV6
 bLI=
X-SBRS: 2.7
X-MesageID: 22684830
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,327,1589256000"; d="scan'208";a="22684830"
Date: Wed, 8 Jul 2020 12:48:26 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/mtrr: Drop workaround for old 32bit CPUs
Message-ID: <20200708104826.GB7191@Air-de-Roger>
References: <20200708101443.27321-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200708101443.27321-1-andrew.cooper3@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jul 08, 2020 at 11:14:43AM +0100, Andrew Cooper wrote:
> This logic is dead as Xen is 64bit-only these days.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Wei Liu <wl@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  xen/arch/x86/cpu/mtrr/generic.c | 17 -----------------
>  1 file changed, 17 deletions(-)
> 
> diff --git a/xen/arch/x86/cpu/mtrr/generic.c b/xen/arch/x86/cpu/mtrr/generic.c
> index 89634f918f..06fa0c0420 100644
> --- a/xen/arch/x86/cpu/mtrr/generic.c
> +++ b/xen/arch/x86/cpu/mtrr/generic.c
> @@ -570,23 +570,6 @@ int generic_validate_add_page(unsigned long base, unsigned long size, unsigned i
>  {
>  	unsigned long lbase, last;
>  
> -	/*  For Intel PPro stepping <= 7, must be 4 MiB aligned 
> -	    and not touch 0x70000000->0x7003FFFF */
> -	if (is_cpu(INTEL) && boot_cpu_data.x86 == 6 &&
> -	    boot_cpu_data.x86_model == 1 &&
> -	    boot_cpu_data.x86_mask <= 7) {
> -		if (base & ((1 << (22 - PAGE_SHIFT)) - 1)) {
> -			printk(KERN_WARNING "mtrr: base(%#lx000) is not 4 MiB aligned\n", base);
> -			return -EINVAL;
> -		}
> -		if (!(base + size < 0x70000 || base > 0x7003F) &&
> -		    (type == MTRR_TYPE_WRCOMB
> -		     || type == MTRR_TYPE_WRBACK)) {
> -			printk(KERN_WARNING "mtrr: writable mtrr between 0x70000000 and 0x7003FFFF may hang the CPU.\n");
> -			return -EINVAL;
> -		}
> -	}
> -
>  	/*  Check upper bits of base and last are equal and lower bits are 0
>  	    for base and 1 for last  */
>  	last = base + size - 1;

FWIW, you could also initialize last at definition time.

Roger.

