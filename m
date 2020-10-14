Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F9128DFA4
	for <lists+xen-devel@lfdr.de>; Wed, 14 Oct 2020 13:12:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6614.17545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSehI-0007vm-4k; Wed, 14 Oct 2020 11:11:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6614.17545; Wed, 14 Oct 2020 11:11:56 +0000
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
	id 1kSehI-0007vN-12; Wed, 14 Oct 2020 11:11:56 +0000
Received: by outflank-mailman (input) for mailman id 6614;
 Wed, 14 Oct 2020 11:11:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MeL6=DV=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kSehG-0007vI-FP
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 11:11:54 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4f0a3eec-76d6-42fd-a1fe-0961ed917f17;
 Wed, 14 Oct 2020 11:11:52 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kSehD-0002Un-E3; Wed, 14 Oct 2020 11:11:51 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kSehD-0003pE-5U; Wed, 14 Oct 2020 11:11:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=MeL6=DV=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kSehG-0007vI-FP
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 11:11:54 +0000
X-Inumbo-ID: 4f0a3eec-76d6-42fd-a1fe-0961ed917f17
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 4f0a3eec-76d6-42fd-a1fe-0961ed917f17;
	Wed, 14 Oct 2020 11:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=mWrFnB6uOcagh0LYfIRUsr+Y6y0Rci2+nTuToKgVvBk=; b=u4P0I8F0FkrHoLoGK62XJZZBNr
	5TundeL3HGhPZoThyH26EoFblJNjbbv4Kz/S1r74W0vRdGgeWHFgaS1aamidUfO7wWDCNg2ntJpDd
	xBsxDrwQy4oOaSWEQd/op+kQhbhgI1BLXEe+A6Hwt3lqKe522p9x1WElU5H6aXOqIzoU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kSehD-0002Un-E3; Wed, 14 Oct 2020 11:11:51 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kSehD-0003pE-5U; Wed, 14 Oct 2020 11:11:51 +0000
Subject: Re: [PATCH] xen/arm: Warn user on cpu errata 832075
To: Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <f11fe960a111530501fd0c20893bec4e32edf3cb.1602671985.git.bertrand.marquis@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <c22235d1-9124-74f2-5856-58f7f44dc0b7@xen.org>
Date: Wed, 14 Oct 2020 12:11:49 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <f11fe960a111530501fd0c20893bec4e32edf3cb.1602671985.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 14/10/2020 11:41, Bertrand Marquis wrote:
> When a Cortex A57 processor is affected by CPU errata 832075, a guest
> not implementing the workaround for it could deadlock the system.
> Add a warning during boot informing the user that only trusted guests
> should be executed on the system.

I think we should update SUPPORT.MD to say we will not security support 
those processors. Stefano, what do you think?

> An equivalent warning is already given to the user by KVM on cores
> affected by this errata.

I don't seem to find the warning in Linux. Do you have a link?

> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>   xen/arch/arm/cpuerrata.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
> index 6c09017515..8f9ab6dde1 100644
> --- a/xen/arch/arm/cpuerrata.c
> +++ b/xen/arch/arm/cpuerrata.c
> @@ -240,6 +240,26 @@ static int enable_ic_inv_hardening(void *data)
>   
>   #endif
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

I was going to suggest to use WARN_ON_ONCE() but it looks like it never 
made upstream :(.

> +    }
> +
> +    return 0;
> +}
> +
> +#endif
> +
>   #ifdef CONFIG_ARM_SSBD
>   
>   enum ssbd_state ssbd_state = ARM_SSBD_RUNTIME;
> @@ -419,6 +439,7 @@ static const struct arm_cpu_capabilities arm_errata[] = {
>           .capability = ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE,
>           MIDR_RANGE(MIDR_CORTEX_A57, 0x00,
>                      (1 << MIDR_VARIANT_SHIFT) | 2),
> +        .enable = warn_device_load_acquire_errata,
>       },
>   #endif
>   #ifdef CONFIG_ARM64_ERRATUM_834220
> 

-- 
Julien Grall

