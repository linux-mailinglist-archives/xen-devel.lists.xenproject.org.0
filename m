Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8C62B0139
	for <lists+xen-devel@lfdr.de>; Thu, 12 Nov 2020 09:31:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25537.53355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kd80w-0008AP-1Z; Thu, 12 Nov 2020 08:31:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25537.53355; Thu, 12 Nov 2020 08:31:30 +0000
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
	id 1kd80v-0008A0-UL; Thu, 12 Nov 2020 08:31:29 +0000
Received: by outflank-mailman (input) for mailman id 25537;
 Thu, 12 Nov 2020 08:31:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2UFB=ES=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kd80t-00089v-Tt
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 08:31:27 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9da97217-b18a-4f16-99f5-fddbde9e71e4;
 Thu, 12 Nov 2020 08:31:26 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B6A65AB95;
 Thu, 12 Nov 2020 08:31:25 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2UFB=ES=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kd80t-00089v-Tt
	for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 08:31:27 +0000
X-Inumbo-ID: 9da97217-b18a-4f16-99f5-fddbde9e71e4
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 9da97217-b18a-4f16-99f5-fddbde9e71e4;
	Thu, 12 Nov 2020 08:31:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605169885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O1dPkWLjtvBC5R6zavbQ4rFJdkZlkirqroDdoeHfwBo=;
	b=XwWmUh6g146sj0GLPdIBM3OxRfxzgIGhM95VW7EVxi8NwThrCdmp29fCpE6f0ZQSR65ir1
	L7ufwD1rjQkwj7fYfAeJXfmFz4OLmT4OQku4IAGX0E9WzSrhmX2m9adBIhFhUWUzc3If+Q
	u52o5AjpOZbC0WNeVXSxeiuKL1RksOo=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id B6A65AB95;
	Thu, 12 Nov 2020 08:31:25 +0000 (UTC)
Subject: Re: [RFC PATCH v2 05/15] xen/arm: pull in Linux atomics helpers and
 dependencies
To: Ash Wilding <ash.j.wilding@gmail.com>
Cc: julien@xen.org, bertrand.marquis@arm.com, rahul.singh@arm.com,
 xen-devel@lists.xenproject.org
References: <20201111215203.80336-1-ash.j.wilding@gmail.com>
 <20201111215203.80336-6-ash.j.wilding@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e5603684-1f4b-83f3-8b80-6c9d045912cc@suse.com>
Date: Thu, 12 Nov 2020 09:31:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <20201111215203.80336-6-ash.j.wilding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11.11.2020 22:51, Ash Wilding wrote:
> From: Ash Wilding <ash.j.wilding@gmail.com>
> 
> This patch pulls in Linux's atomics helpers for arm32 and arm64, and
> their dependencies, as-is.
> 
> Note that Linux's arm32 atomics helpers use the READ_ONCE() and
> WRITE_ONCE() macros defined in <asm-generic/rwonce.h>, while Linux's
> arm64 atomics helpers use __READ_ONCE() and __WRITE_ONCE().

And our ACCESS_ONCE() can't be used, or be made usable? I don't think
we want a 3rd variant when we're already in the process of discussing
how to fold the two ones we have right now.

> The only difference is that the __* versions skip checking whether the
> object being accessed is the same size as a native C type (e.g. char,
> int, long, etc). Given the arm32 helpers are using the macros to access
> an atomic_t's counter member, which is an int, we can skip this check by
> using the __* versions like the arm64 code does.
> 
> I mention this here because it forms the first part of my justification
> for *not* copying Linux's <linux/compiler_types.h> to Xen; the size
> check described above is performed by __native_word() defined in that
> header.
> 
> The second part of my justification may be more contentious; as you'll
> see in the next patch, I intend to drop the __unqual_scalar_typeof()
> calls in __READ_ONCE() and __WRITE_ONCE(). This is because the pointer
> to the atomic_t's counter member is always a basic (int *) so we don't
> need this, and dropping it means we can avoid having to port Linux's
> <linux/compiler_types.h>.

I don't think weakening the checking is a good idea when the macros
are being made available for general use. If they'd be renamed to be
private flavors for use just in Arm's atomics, this would be a
different thing.

> If people are against this approach, please bear in mind that the
> current version of __unqual_scalar_typeof() in <linux/compiler_types.h>
> was actually the reason for Linux upgrading the minimum GCC version
> required to 4.9 earlier this year so that they can guarantee C11
> _Generic support [1].
> 
> So if we do want to take Linux's <linux/compiler_types.h> we'll either
> need to:
> 
>    A) bump up the minimum required version of GCC to 4.9 to match
>       that required by Linux; in the Xen README we currently state
>       GCC 4.8 for Arm and GCC 4.1.2_20070115 for x86.

Discussion about bumping the baseline has started, but is progressing
rather slowly. I'm not an Arm maintainer, but it would seem to me
that going from 4.8 to 4.9 just for Arm at this point may be easier
than the decision what the new baseline ought to be for x86.

> --- /dev/null
> +++ b/xen/include/xen/rwonce.h
> @@ -0,0 +1,90 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Prevent the compiler from merging or refetching reads or writes. The
> + * compiler is also forbidden from reordering successive instances of
> + * READ_ONCE and WRITE_ONCE, but only when the compiler is aware of some
> + * particular ordering. One way to make the compiler aware of ordering is to
> + * put the two invocations of READ_ONCE or WRITE_ONCE in different C
> + * statements.
> + *
> + * These two macros will also work on aggregate data types like structs or
> + * unions.
> + *
> + * Their two major use cases are: (1) Mediating communication between
> + * process-level code and irq/NMI handlers, all running on the same CPU,
> + * and (2) Ensuring that the compiler does not fold, spindle, or otherwise
> + * mutilate accesses that either do not require ordering or that interact
> + * with an explicit memory barrier or atomic instruction that provides the
> + * required ordering.
> + */
> +#ifndef __ASM_GENERIC_RWONCE_H
> +#define __ASM_GENERIC_RWONCE_H
> +
> +#ifndef __ASSEMBLY__
> +
> +#include <linux/compiler_types.h>
> +#include <linux/kasan-checks.h>
> +#include <linux/kcsan-checks.h>
> +
> +/*
> + * Yes, this permits 64-bit accesses on 32-bit architectures. These will
> + * actually be atomic in some cases (namely Armv7 + LPAE), but for others we
> + * rely on the access being split into 2x32-bit accesses for a 32-bit quantity
> + * (e.g. a virtual address) and a strong prevailing wind.
> + */
> +#define compiletime_assert_rwonce_type(t)					\
> +	compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),	\
> +		"Unsupported access size for {READ,WRITE}_ONCE().")
> +
> +/*
> + * Use __READ_ONCE() instead of READ_ONCE() if you do not require any
> + * atomicity. Note that this may result in tears!
> + */
> +#ifndef __READ_ONCE
> +#define __READ_ONCE(x)	(*(const volatile __unqual_scalar_typeof(x) *)&(x))
> +#endif
> +
> +#define READ_ONCE(x)							\
> +({									\
> +	compiletime_assert_rwonce_type(x);				\
> +	__READ_ONCE(x);							\
> +})
> +
> +#define __WRITE_ONCE(x, val)						\
> +do {									\
> +	*(volatile typeof(x) *)&(x) = (val);				\
> +} while (0)
> +
> +#define WRITE_ONCE(x, val)						\
> +do {									\
> +	compiletime_assert_rwonce_type(x);				\
> +	__WRITE_ONCE(x, val);						\
> +} while (0)
> +
> +static __no_sanitize_or_inline
> +unsigned long __read_once_word_nocheck(const void *addr)
> +{
> +	return __READ_ONCE(*(unsigned long *)addr);
> +}
> +
> +/*
> + * Use READ_ONCE_NOCHECK() instead of READ_ONCE() if you need to load a
> + * word from memory atomically but without telling KASAN/KCSAN. This is
> + * usually used by unwinding code when walking the stack of a running process.
> + */
> +#define READ_ONCE_NOCHECK(x)						\
> +({									\
> +	compiletime_assert(sizeof(x) == sizeof(unsigned long),		\
> +		"Unsupported access size for READ_ONCE_NOCHECK().");	\
> +	(typeof(x))__read_once_word_nocheck(&(x));			\
> +})
> +
> +static __no_kasan_or_inline
> +unsigned long read_word_at_a_time(const void *addr)
> +{
> +	kasan_check_read(addr, 1);
> +	return *(unsigned long *)addr;
> +}
> +
> +#endif /* __ASSEMBLY__ */
> +#endif	/* __ASM_GENERIC_RWONCE_H */
> \ No newline at end of file

This wants taking care of in any event - there are multiple instances
in this patch (in fact it looks as if all of the new files had this
issue), and I didn't check others.

Jan

