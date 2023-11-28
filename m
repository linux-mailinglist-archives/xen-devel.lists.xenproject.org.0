Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 626BE7FC966
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 23:22:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643578.1003932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r86Sj-0000vd-Av; Tue, 28 Nov 2023 22:21:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643578.1003932; Tue, 28 Nov 2023 22:21:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r86Sj-0000sw-7U; Tue, 28 Nov 2023 22:21:49 +0000
Received: by outflank-mailman (input) for mailman id 643578;
 Tue, 28 Nov 2023 22:21:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Vht=HJ=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1r86Si-0000rT-8j
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 22:21:48 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8376bf72-8e3c-11ee-9b0e-b553b5be7939;
 Tue, 28 Nov 2023 23:21:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 6D9038285425;
 Tue, 28 Nov 2023 16:21:44 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 0dmXMz8I_-fA; Tue, 28 Nov 2023 16:21:43 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 58D028285646;
 Tue, 28 Nov 2023 16:21:43 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id A9kJkjsV90S0; Tue, 28 Nov 2023 16:21:43 -0600 (CST)
Received: from [10.11.0.3] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id D56618285425;
 Tue, 28 Nov 2023 16:21:42 -0600 (CST)
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
X-Inumbo-ID: 8376bf72-8e3c-11ee-9b0e-b553b5be7939
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 58D028285646
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1701210103; bh=W4ogoQFYuhzwTXqcopBxbeHHUEWSh3pBGF4yRRlPa80=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=blKQ1ZRJd74X0etEtfEwpDnYT9O8fNtejd3u4B8RnZXjllIZbbl4BcgmrDVczRnRd
	 X9XDY9qhSI/SpucyZrBGBz9TRWZ/ohRqcD+6t5S4DHOkr8RxHH4mCDaub84Zi2tzWJ
	 Hnwl6NUAQlFc1LujOQplV3R/qImLxzzkJjKg4JEM=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <22ffed63-8f05-477f-b37c-c660410c2ce6@raptorengineering.com>
Date: Tue, 28 Nov 2023 16:21:42 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/14] xen/asm-generic: introduce stub header monitor.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, Jan Beulich <jbeulich@suse.com>
References: <cover.1701093907.git.oleksii.kurochko@gmail.com>
 <83e16ccc588d35042b804e0d56ebdb5fe710695b.1701093907.git.oleksii.kurochko@gmail.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <83e16ccc588d35042b804e0d56ebdb5fe710695b.1701093907.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 11/27/23 8:13 AM, Oleksii Kurochko wrote:
> The header is shared between several archs so it is
> moved to asm-generic.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>.
> ---
> Changes in V4:
>  - Removed the double blank line.
>  - Added Acked-by: Jan Beulich <jbeulich@suse.com>.
>  - Update the commit message
> ---
> Changes in V3:
>  - Use forward-declaration of struct domain instead of " #include <xen/sched.h> ".
>  - Add ' include <xen/errno.h> '
>  - Drop PPC's monitor.h.
> ---
> Changes in V2:
> 	- remove inclusion of "+#include <public/domctl.h>"
> 	- add "struct xen_domctl_monitor_op;"
> 	- remove one of SPDX tags.
> ---
>  xen/arch/ppc/include/asm/Makefile  |  1 +
>  xen/arch/ppc/include/asm/monitor.h | 43 ---------------------
>  xen/include/asm-generic/monitor.h  | 62 ++++++++++++++++++++++++++++++
>  3 files changed, 63 insertions(+), 43 deletions(-)
>  delete mode 100644 xen/arch/ppc/include/asm/monitor.h
>  create mode 100644 xen/include/asm-generic/monitor.h
> 
> diff --git a/xen/arch/ppc/include/asm/Makefile b/xen/arch/ppc/include/asm/Makefile
> index 319e90955b..bcddcc181a 100644
> --- a/xen/arch/ppc/include/asm/Makefile
> +++ b/xen/arch/ppc/include/asm/Makefile
> @@ -5,6 +5,7 @@ generic-y += div64.h
>  generic-y += hardirq.h
>  generic-y += hypercall.h
>  generic-y += iocap.h
> +generic-y += monitor.h
>  generic-y += paging.h
>  generic-y += percpu.h
>  generic-y += random.h
> diff --git a/xen/arch/ppc/include/asm/monitor.h b/xen/arch/ppc/include/asm/monitor.h
> deleted file mode 100644
> index e5b0282bf1..0000000000
> --- a/xen/arch/ppc/include/asm/monitor.h
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-only */
> -/* Derived from xen/arch/arm/include/asm/monitor.h */
> -#ifndef __ASM_PPC_MONITOR_H__
> -#define __ASM_PPC_MONITOR_H__
> -
> -#include <public/domctl.h>
> -#include <xen/errno.h>
> -
> -static inline
> -void arch_monitor_allow_userspace(struct domain *d, bool allow_userspace)
> -{
> -}
> -
> -static inline
> -int arch_monitor_domctl_op(struct domain *d, struct xen_domctl_monitor_op *mop)
> -{
> -    /* No arch-specific monitor ops on PPC. */
> -    return -EOPNOTSUPP;
> -}
> -
> -int arch_monitor_domctl_event(struct domain *d,
> -                              struct xen_domctl_monitor_op *mop);
> -
> -static inline
> -int arch_monitor_init_domain(struct domain *d)
> -{
> -    /* No arch-specific domain initialization on PPC. */
> -    return 0;
> -}
> -
> -static inline
> -void arch_monitor_cleanup_domain(struct domain *d)
> -{
> -    /* No arch-specific domain cleanup on PPC. */
> -}
> -
> -static inline uint32_t arch_monitor_get_capabilities(struct domain *d)
> -{
> -    BUG_ON("unimplemented");

I'm not sure how I feel about this assertion being dropped in the
generic header. In general my philosophy when creating these stub
headers was to insert as many of these assertions as possible so we
don't end up in a scenario where during early bringup I miss a function
that was originally stubbed but ought to be implemented eventually.

Looking at ARM's monitor.h too, it seems that this function is the only
one that differs from the generic/stub version. I'm wondering if it
would make sense to leave this function out of the generic header, to be
defined by the arch similar to what you've done with some other
functions in this series. That would also allow ARM to be brought in to
using the generic variant.

> -    return 0;
> -}
> -
> -#endif /* __ASM_PPC_MONITOR_H__ */
> diff --git a/xen/include/asm-generic/monitor.h b/xen/include/asm-generic/monitor.h
> new file mode 100644
> index 0000000000..6be8614431
> --- /dev/null
> +++ b/xen/include/asm-generic/monitor.h
> @@ -0,0 +1,62 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * include/asm-GENERIC/monitor.h
> + *
> + * Arch-specific monitor_op domctl handler.
> + *
> + * Copyright (c) 2015 Tamas K Lengyel (tamas@tklengyel.com)
> + * Copyright (c) 2016, Bitdefender S.R.L.
> + *
> + */
> +
> +#ifndef __ASM_GENERIC_MONITOR_H__
> +#define __ASM_GENERIC_MONITOR_H__
> +
> +#include <xen/errno.h>
> +
> +struct domain;
> +struct xen_domctl_monitor_op;
> +
> +static inline
> +void arch_monitor_allow_userspace(struct domain *d, bool allow_userspace)
> +{
> +}
> +
> +static inline
> +int arch_monitor_domctl_op(struct domain *d, struct xen_domctl_monitor_op *mop)
> +{
> +    /* No arch-specific monitor ops on GENERIC. */
> +    return -EOPNOTSUPP;
> +}
> +
> +int arch_monitor_domctl_event(struct domain *d,
> +                              struct xen_domctl_monitor_op *mop);
> +
> +static inline
> +int arch_monitor_init_domain(struct domain *d)
> +{
> +    /* No arch-specific domain initialization on GENERIC. */
> +    return 0;
> +}
> +
> +static inline
> +void arch_monitor_cleanup_domain(struct domain *d)
> +{
> +    /* No arch-specific domain cleanup on GENERIC. */
> +}
> +
> +static inline uint32_t arch_monitor_get_capabilities(struct domain *d)
> +{

See previous comment.

> +    return 0;
> +}
> +
> +#endif /* __ASM_GENERIC_MONITOR_H__ */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: BSD
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */

Thanks,
Shawn

