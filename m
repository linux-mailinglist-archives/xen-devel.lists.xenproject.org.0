Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6127C785FF2
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 20:40:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589495.921427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYslI-0002f8-FH; Wed, 23 Aug 2023 18:39:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589495.921427; Wed, 23 Aug 2023 18:39:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYslI-0002cK-CO; Wed, 23 Aug 2023 18:39:24 +0000
Received: by outflank-mailman (input) for mailman id 589495;
 Wed, 23 Aug 2023 18:39:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z2Dg=EI=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qYslH-0002cE-QC
 for xen-devel@lists.xenproject.org; Wed, 23 Aug 2023 18:39:23 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5fdeb993-41e4-11ee-8783-cb3800f73035;
 Wed, 23 Aug 2023 20:39:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id CAF7F82853FB;
 Wed, 23 Aug 2023 13:39:19 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id KaieLyvc8Qos; Wed, 23 Aug 2023 13:39:18 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id C849082855C8;
 Wed, 23 Aug 2023 13:39:18 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id BcM9rDYdRGd1; Wed, 23 Aug 2023 13:39:18 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 6F10582853FB;
 Wed, 23 Aug 2023 13:39:18 -0500 (CDT)
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
X-Inumbo-ID: 5fdeb993-41e4-11ee-8783-cb3800f73035
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com C849082855C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1692815958; bh=mB0pDrmvGRu9sIiaCknPr8DjB0toCXd0cLbTYaV0q7g=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=VSUh/gWsrOPXiK+xJ4lonCuNzIgR0bQZpvFg9keUkNLOnXmDTt87dFAUTwPcRGqx7
	 NZeHKZl7Rk+8zHyzeVdzKBi8QI+MRTDwqHFgP+z79rfDWfcZ4lEfd1V/5cn22pA27V
	 fWE237Xqw0uHW0WrxXNqxak7ybQLFZ4TpQCA7T9U=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <b24f0eb8-5dd3-8fba-fd05-e98bcf45c60a@raptorengineering.com>
Date: Wed, 23 Aug 2023 13:39:18 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 8/9] xen/ppc: Add stub function and symbol definitions
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1691016993.git.sanastasio@raptorengineering.com>
 <2702cfa486aa92e82fccd6393519073f10f4c40c.1691016993.git.sanastasio@raptorengineering.com>
 <1866073f-9611-f5bb-9b5b-05ad463650e6@suse.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <1866073f-9611-f5bb-9b5b-05ad463650e6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/8/23 5:27 AM, Jan Beulich wrote:
> On 03.08.2023 01:03, Shawn Anastasio wrote:
>> --- a/xen/arch/ppc/mm-radix.c
>> +++ b/xen/arch/ppc/mm-radix.c
>> @@ -266,3 +266,47 @@ void __init setup_initial_pagetables(void)
>>      /* Turn on the MMU */
>>      enable_mmu();
>>  }
>> +
>> +
> 
> Nit: No double blank lines please.
>

Will fix.

>> +/*
>> + * TODO: Implement the functions below
>> + */
>> +unsigned long total_pages;
> 
> Hmm, yet one more prereq patch for me to make: There should be no need
> for every arch to have a definition, when common code requires the
> variable. While looking there I found max_page, which common code
> references as well. I'm surprised you get away without. I guess I'll
> learn why that is when making the patch moving both.
>

Since your patch for this has gone though, I'll drop this in v2.

>> +unsigned long frametable_base_pdx __read_mostly;
> 
> While we still have many instances like this, we prefer this form:
> 
> unsigned long __read_mostly frametable_base_pdx;
>

Will update.

>> +
>> +void put_page(struct page_info *p)
>> +{
>> +    BUG();
>> +}
>> +
>> +void arch_dump_shared_mem_info(void)
>> +{
>> +    BUG();
>> +}
> 
> And perhaps one further prereq patch to avoid the need for this.
>

Will remove from this series pending merge of your prereq patch.

>> +int xenmem_add_to_physmap_one(struct domain *d,
>> +                              unsigned int space,
>> +                              union add_to_physmap_extra extra,
>> +                              unsigned long idx,
>> +                              gfn_t gfn)
>> +{
>> +    BUG();
>> +}
>> +
>> +int destroy_xen_mappings(unsigned long s, unsigned long e)
>> +{
>> +    BUG();
>> +}
>> +
>> +int map_pages_to_xen(unsigned long virt,
>> +                     mfn_t mfn,
>> +                     unsigned long nr_mfns,
>> +                     unsigned int flags)
> 
> There's a patch in flight regarding the naming of this last parameter.
> I guess PPC would best be in sync right away.
>

I can't seem to find the patch in question and it doesn't seem like it
has been merged in the meantime. Could you provide a link?

>> --- a/xen/arch/ppc/setup.c
>> +++ b/xen/arch/ppc/setup.c
>> @@ -1,5 +1,8 @@
>>  /* SPDX-License-Identifier: GPL-2.0-or-later */
>> +#include <xen/lib.h>
>>  #include <xen/init.h>
>> +#include <xen/mm.h>
>> +#include <public/version.h>
>>  #include <asm/boot.h>
>>  #include <asm/early_printk.h>
>>  #include <asm/processor.h>
> 
> There's no need for xen/lib.h to come ahead of xen/init.h, is there?
>

There is not -- I'll fix the ordering.

>> --- /dev/null
>> +++ b/xen/arch/ppc/stubs.c
>> @@ -0,0 +1,351 @@
>> [...]
>> +static void ack_none(struct irq_desc *irq)
>> +{
>> +    BUG();
>> +}
>> +
>> +static void end_none(struct irq_desc *irq)
>> +{
>> +    BUG();
>> +}
>> +
>> +hw_irq_controller no_irq_type = {
>> +    .typename = "none",
>> +    .startup = irq_startup_none,
>> +    .shutdown = irq_shutdown_none,
>> +    .enable = irq_enable_none,
>> +    .disable = irq_disable_none,
>> +    .ack = ack_none,
>> +    .end = end_none
>> +};
> 
> I would recommend to avoid filling pointers (and hence having private
> hook functions) where it's not clear whether they'll be required. "end",
> for example, is an optional hook on x86. Iirc common code doesn't use
> any of the hooks.
>

Alright, I'll drop the `end_none` stub and leave the .end pointer as
NULL.

> Jan

Thanks,
Shawn

