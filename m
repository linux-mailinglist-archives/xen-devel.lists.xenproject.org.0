Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3AC28DFDD
	for <lists+xen-devel@lfdr.de>; Wed, 14 Oct 2020 13:35:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6666.17589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSf41-0001je-Qe; Wed, 14 Oct 2020 11:35:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6666.17589; Wed, 14 Oct 2020 11:35:25 +0000
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
	id 1kSf41-0001jF-Ne; Wed, 14 Oct 2020 11:35:25 +0000
Received: by outflank-mailman (input) for mailman id 6666;
 Wed, 14 Oct 2020 11:35:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aNf1=DV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kSf40-0001jA-BA
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 11:35:24 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f58c69ee-8373-4657-a52a-65d125a55e4e;
 Wed, 14 Oct 2020 11:35:22 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=aNf1=DV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kSf40-0001jA-BA
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 11:35:24 +0000
X-Inumbo-ID: f58c69ee-8373-4657-a52a-65d125a55e4e
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id f58c69ee-8373-4657-a52a-65d125a55e4e;
	Wed, 14 Oct 2020 11:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602675323;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=I2rD9uri+Q+irdWguf9s0RoPX7S6hAcBXSic7kVKv8w=;
  b=iWWoGogMIehUKt6v1yh/+EMfZv/0C3nkeHs/ncegKpLowGMbSAj7e48h
   anFVEl8yf7w0FrA4XK+1FUtLwJm93J2isx5F3DxLyWnAhKW2HTvpO0nIk
   x8NhUhIB79o82md5/IsS5M7vJGGj8HSZIFmca2/LpoCRN/3JAfb0ZunrM
   8=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: sTMiV0CrnjHyYLETWirfhUTpObTkYBt5Z8zksrqayeCnzf7NCn2EUHPyFV3jKVsTEWKMzKgH9T
 bRwbdfaATlHWh8kRhdaOdin0v+2yP22RqMdyQ/hYkjmZ7tOo83lRbor30d7qN6/7denJNSk5hb
 VwfuhvIvXyZkQZhwcHWBpObuL11b9yeJcsnAaBUHM3vgSbF0qrOOEscyp+Ew9RFR4v7GA7Xmsa
 GFQxALddI3ELBToF96rC1HD9vnB5skpAxX7Y+KiatIKBdog71K3rcOyWgloqpmtAs+nuSZxMeK
 nKg=
X-SBRS: 2.5
X-MesageID: 29303081
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,374,1596513600"; 
   d="scan'208";a="29303081"
Subject: Re: [PATCH] xen/arm: Warn user on cpu errata 832075
To: Bertrand Marquis <bertrand.marquis@arm.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <f11fe960a111530501fd0c20893bec4e32edf3cb.1602671985.git.bertrand.marquis@arm.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <26742825-25fc-0f82-2b20-d536e8380b2a@citrix.com>
Date: Wed, 14 Oct 2020 12:35:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f11fe960a111530501fd0c20893bec4e32edf3cb.1602671985.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL05.citrite.net (10.13.108.178)

On 14/10/2020 11:41, Bertrand Marquis wrote:
> When a Cortex A57 processor is affected by CPU errata 832075, a guest
> not implementing the workaround for it could deadlock the system.
> Add a warning during boot informing the user that only trusted guests
> should be executed on the system.
> An equivalent warning is already given to the user by KVM on cores
> affected by this errata.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>  xen/arch/arm/cpuerrata.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
> index 6c09017515..8f9ab6dde1 100644
> --- a/xen/arch/arm/cpuerrata.c
> +++ b/xen/arch/arm/cpuerrata.c
> @@ -240,6 +240,26 @@ static int enable_ic_inv_hardening(void *data)
>  
>  #endif
>  
> +#ifdef CONFIG_ARM64_ERRATUM_832075
> +
> +static int warn_device_load_acquire_errata(void *data)
> +{
> +    static bool warned = false;
> +
> +    if ( !warned )
> +    {
> +        warning_add("This CPU is affected by the errata 832075.\n"
> +                    "Guests without required CPU erratum workarounds\n"
> +                    "can deadlock the system!\n"
> +                    "Only trusted guests should be used on this system.\n");
> +        warned = true;

This is an antipattern, which probably wants fixing elsewhere as well.

warning_add() is __init.  It's not legitimate to call from a non-init
function, and a less useless build system would have modpost to object.

The ARM_SMCCC_ARCH_WORKAROUND_1 instance asserts based on system state,
but this provides no safety at all.


What warning_add() actually does is queue messages for some point near
the end of boot.  It's not clear that this is even a clever thing to do.

I'm very tempted to suggest a blanket change to printk_once().

~Andrew

> +    }
> +
> +    return 0;
> +}
> +
> +#endif
> +
>  #ifdef CONFIG_ARM_SSBD
>  
>  enum ssbd_state ssbd_state = ARM_SSBD_RUNTIME;
> @@ -419,6 +439,7 @@ static const struct arm_cpu_capabilities arm_errata[] = {
>          .capability = ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE,
>          MIDR_RANGE(MIDR_CORTEX_A57, 0x00,
>                     (1 << MIDR_VARIANT_SHIFT) | 2),
> +        .enable = warn_device_load_acquire_errata,
>      },
>  #endif
>  #ifdef CONFIG_ARM64_ERRATUM_834220


