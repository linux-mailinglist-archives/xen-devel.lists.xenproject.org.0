Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B52FA77678A
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 20:42:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581281.909891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTo8C-0007ag-C5; Wed, 09 Aug 2023 18:42:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581281.909891; Wed, 09 Aug 2023 18:42:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTo8C-0007YG-93; Wed, 09 Aug 2023 18:42:04 +0000
Received: by outflank-mailman (input) for mailman id 581281;
 Wed, 09 Aug 2023 18:42:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FTx5=D2=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qTo8A-0007Y8-6g
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 18:42:02 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b779173-36e4-11ee-b281-6b7b168915f2;
 Wed, 09 Aug 2023 20:41:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 4271482854AF;
 Wed,  9 Aug 2023 13:41:57 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id i-jk6jubwgRR; Wed,  9 Aug 2023 13:41:55 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 75239828553F;
 Wed,  9 Aug 2023 13:41:55 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id KFN2J-Za5LsL; Wed,  9 Aug 2023 13:41:55 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 0A37282854AF;
 Wed,  9 Aug 2023 13:41:55 -0500 (CDT)
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
X-Inumbo-ID: 6b779173-36e4-11ee-b281-6b7b168915f2
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 75239828553F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1691606515; bh=mcGoxV1b2BeXAtbsXWVL+8EprU7jc+Wwc/qEI47/3sc=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=X1QZmlzQMM7v5gARlIXQKWy1MFz/43p2uwn9bm/6tF/uGhYoFJVcY5zs9Q/M1bCCb
	 WvU5JlPEDjbcQHzhhAK5VrSOUwyXjYWnTrfp1RVripE093Fmlf8ayVc1/99cTsbF5c
	 iuK9oos3wK81VSaOremfnaUZAW4Cd75h/jN82lsA=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <21365276-8338-12b9-b3b8-2a222e7eceef@raptorengineering.com>
Date: Wed, 9 Aug 2023 13:41:54 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 5/9] xen/ppc: Define minimal stub headers required for
 full build
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1691016993.git.sanastasio@raptorengineering.com>
 <9cd545a4a9ef55d06ea0b81044e22f64ee42823e.1691016993.git.sanastasio@raptorengineering.com>
 <aaabc5d0-aa69-5c30-8e49-635537868346@suse.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <aaabc5d0-aa69-5c30-8e49-635537868346@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/8/23 4:12 AM, Jan Beulich wrote:
> On 03.08.2023 01:03, Shawn Anastasio wrote:
>> --- /dev/null
>> +++ b/xen/arch/ppc/include/asm/altp2m.h
>> @@ -0,0 +1,39 @@
>> +/*
>> + * Alternate p2m
>> + *
>> + * Copyright (c) 2014, Intel Corporation.
>> + *
>> + * This program is free software; you can redistribute it and/or modify it
>> + * under the terms and conditions of the GNU General Public License,
>> + * version 2, as published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope it will be useful, but WITHOUT
>> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
>> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
>> + * more details.
>> + *
>> + * You should have received a copy of the GNU General Public License along with
>> + * this program; If not, see <http://www.gnu.org/licenses/>.
>> + */
> 
> Please use an SPDX header instead in new code. I also wonder about the
> Intel copyright. I realize it's that way in the Arm header that you
> apparently copied, but even there it's pretty odd. I don't think such
> a pair of stub functions is reasonably copyrightable.

Yes, I agree the copyright is a bit strange and was likely just copied
on the Arm side from the original x86 header. Since I'm not copying any
actually implemented code, I think it's safe to drop this in favor of
just a standard SPDX header. I'll make that change.

>> +#ifndef __ASM_PPC_ALTP2M_H__
>> +#define __ASM_PPC_ALTP2M_H__
>> +
>> +#include <xen/sched.h>
> 
> I don't think this is needed here (nor in Arm's original). All you
> need are forward decls of struct domain and struct vcpu. And
> xen/bug.h plus xen/types.h.
>

Fair enough -- and bug.h seems to already include types.h for us, so we
only need the one include plus the two forward declarations. I'll update
this.

>> --- a/xen/arch/ppc/include/asm/bug.h
>> +++ b/xen/arch/ppc/include/asm/bug.h
>> @@ -4,6 +4,7 @@
>>  #define _ASM_PPC_BUG_H
>>  
>>  #include <xen/stringify.h>
>> +#include <asm/processor.h>
>>  
>>  /*
>>   * Power ISA guarantees that an instruction consisting of all zeroes is
>> @@ -15,4 +16,10 @@
>>  
>>  #define BUG_FN_REG r0
>>  
>> +#define BUG() do { \
>> +    die(); \
>> +} while (0)
> 
> This looks like it's temporary. I think any construct that later needs
> updating wants marking in some common way (such that it's easy to grep
> for items left to be dealt with; you have such a comment in e.g.
> asm/event.h). Of course if an entire header consists of _only_ stubs,
> perhaps a single such comment would suffice.

Yes, agreed that this macro deserves a TODO comment.

As for the rest of the stub functions that this patch implements, are
you suggesting that each file with stubs should contain a similar
comment? Another alternative that I thought of would be to define a
BUG_UNIMPLEMENTED() macro or similar and call that inside of all the
stub functions.

>> --- a/xen/arch/ppc/include/asm/cache.h
>> +++ b/xen/arch/ppc/include/asm/cache.h
>> @@ -3,4 +3,6 @@
>>  #ifndef _ASM_PPC_CACHE_H
>>  #define _ASM_PPC_CACHE_H
>>  
>> +#define __read_mostly __section(".data.read_mostly")
> 
> Not something for you to do, but we really want to move this to
> xen/cache.h.
> 

Perfect, will drop this from my series.

>> diff --git a/xen/arch/ppc/include/asm/desc.h b/xen/arch/ppc/include/asm/desc.h
>> new file mode 100644
>> index 0000000000..e69de29bb2
> 
> Along the lines of the above - common code should not include this
> header, and Arm shouldn't need one either. I'll see if I can sort
> this.
>

Ditto.

>> --- a/xen/arch/ppc/include/asm/mm.h
>> +++ b/xen/arch/ppc/include/asm/mm.h
>> @@ -1,19 +1,270 @@
>>  #ifndef _ASM_PPC_MM_H
>>  #define _ASM_PPC_MM_H
>>  
>> +#include <public/xen.h>
>> +#include <xen/pdx.h>
>> +#include <xen/types.h>
>>  #include <asm/config.h>
>>  #include <asm/page-bits.h>
>>  
>> +void setup_initial_pagetables(void);
>> +
>> +extern unsigned long total_pages;
>> +
>>  #define pfn_to_paddr(pfn) ((paddr_t)(pfn) << PAGE_SHIFT)
>>  #define paddr_to_pfn(pa)  ((unsigned long)((pa) >> PAGE_SHIFT))
>> +#define paddr_to_pdx(pa)    mfn_to_pdx(maddr_to_mfn(pa))
>> +#define gfn_to_gaddr(gfn)   pfn_to_paddr(gfn_x(gfn))
>> +#define gaddr_to_gfn(ga)    _gfn(paddr_to_pfn(ga))
>> +#define mfn_to_maddr(mfn)   pfn_to_paddr(mfn_x(mfn))
>> +#define maddr_to_mfn(ma)    _mfn(paddr_to_pfn(ma))
>> +#define vmap_to_mfn(va)     maddr_to_mfn(virt_to_maddr((vaddr_t)va))
>> +#define vmap_to_page(va)    mfn_to_page(vmap_to_mfn(va))
>>  
>>  #define virt_to_maddr(va) ((paddr_t)((vaddr_t)(va) & PADDR_MASK))
>> -#define maddr_to_virt(pa) ((void *)((paddr_t)(pa) | XEN_VIRT_START)
>> +#define maddr_to_virt(pa) ((void *)((paddr_t)(pa) | XEN_VIRT_START))
>>  
>>  /* Convert between Xen-heap virtual addresses and machine addresses. */
>>  #define __pa(x)             (virt_to_maddr(x))
>>  #define __va(x)             (maddr_to_virt(x))
>>  
>> -void setup_initial_pagetables(void);
>> +/* Convert between Xen-heap virtual addresses and machine frame numbers. */
>> +#define __virt_to_mfn(va) (virt_to_maddr(va) >> PAGE_SHIFT)
>> +#define __mfn_to_virt(mfn) (maddr_to_virt((paddr_t)(mfn) << PAGE_SHIFT))
>> +
>> +/* Convert between Xen-heap virtual addresses and page-info structures. */
>> +static inline struct page_info *virt_to_page(const void *v)
>> +{
>> +    BUG();
>> +    return NULL;
>> +}
>> +
>> +/*
>> + * We define non-underscored wrappers for above conversion functions.
>> + * These are overriden in various source files while underscored version
>> + * remain intact.
>> + */
>> +#define virt_to_mfn(va)     __virt_to_mfn(va)
>> +#define mfn_to_virt(mfn)    __mfn_to_virt(mfn)
>> +
>> +#define PG_shift(idx)   (BITS_PER_LONG - (idx))
>> +#define PG_mask(x, idx) (x ## UL << PG_shift(idx))
>> +
>> +#define PGT_none          PG_mask(0, 1)  /* no special uses of this page   */
>> +#define PGT_writable_page PG_mask(1, 1)  /* has writable mappings?         */
>> +#define PGT_type_mask     PG_mask(1, 1)  /* Bits 31 or 63.                 */
>> +
>> + /* 2-bit count of uses of this frame as its current type. */
>> +#define PGT_count_mask    PG_mask(3, 3)
>> +
>> +/* Cleared when the owning guest 'frees' this page. */
>> +#define _PGC_allocated    PG_shift(1)
>> +#define PGC_allocated     PG_mask(1, 1)
>> +/* Page is Xen heap? */
>> +#define _PGC_xen_heap     PG_shift(2)
>> +#define PGC_xen_heap      PG_mask(1, 2)
>> +/* Page is static memory */
>> +#define PGC_static     0
> 
> You don't need this.
> 

Will drop.

>> +/* Page is broken? */
>> +#define _PGC_broken       PG_shift(7)
>> +#define PGC_broken        PG_mask(1, 7)
>> + /* Mutually-exclusive page states: { inuse, offlining, offlined, free }. */
>> +#define PGC_state         PG_mask(3, 9)
>> +#define PGC_state_inuse   PG_mask(0, 9)
>> +#define PGC_state_offlining PG_mask(1, 9)
>> +#define PGC_state_offlined PG_mask(2, 9)
>> +#define PGC_state_free    PG_mask(3, 9)
>> +#define page_state_is(pg, st) (((pg)->count_info&PGC_state) == PGC_state_##st)
>> +/* Page is not reference counted */
>> +#define _PGC_extra        PG_shift(10)
>> +#define PGC_extra         PG_mask(1, 10)
>> +
>> +/* Count of references to this frame. */
>> +#define PGC_count_width   PG_shift(10)
>> +#define PGC_count_mask    ((1UL<<PGC_count_width)-1)
>> +
>> +/*
>> + * Page needs to be scrubbed. Since this bit can only be set on a page that is
>> + * free (i.e. in PGC_state_free) we can reuse PGC_allocated bit.
>> + */
>> +#define _PGC_need_scrub   _PGC_allocated
>> +#define PGC_need_scrub    PGC_allocated
>> +
>> +#define is_xen_heap_page(page) ((page)->count_info & PGC_xen_heap)
>> +#define is_xen_heap_mfn(mfn) \
>> +    (mfn_valid(mfn) && is_xen_heap_page(mfn_to_page(mfn)))
>> +
>> +#define is_xen_fixed_mfn(mfn)                                   \
>> +    ((mfn_to_maddr(mfn) >= virt_to_maddr(&_start)) &&           \
>> +     (mfn_to_maddr(mfn) <= virt_to_maddr((vaddr_t)_end - 1)))
>> +
>> +#define page_get_owner(_p)    (_p)->v.inuse.domain
>> +#define page_set_owner(_p,_d) ((_p)->v.inuse.domain = (_d))
>> +
>> +/* TODO: implement */
>> +#define mfn_valid(mfn) ({ (void) (mfn); 0; })
>> +#define max_page ((unsigned long )0)
> 
> It's clear this is temporary, but it would still be nice if you could
> omit stray blanks.
> 

With your max_page/total_pages common patch I can drop this entirely.

>> --- /dev/null
>> +++ b/xen/arch/ppc/include/asm/monitor.h
>> @@ -0,0 +1,48 @@
>> +/* Derived from xen/arch/arm/include/asm/monitor.h */
>> +#ifndef __ASM_PPC_MONITOR_H__
>> +#define __ASM_PPC_MONITOR_H__
>> +
>> +#include <public/domctl.h>
>> +
>> +#include <xen/sched.h>
>> +#include <public/domctl.h>
> 
> Judging from the contents of the file, you don't need either (and you
> certainly don't need public/domctl.h twice). Only xen/types.h looks to
> be needed right now.

The implementation of `arch_monitor_get_capabilities` uses XEN_DOMCTL_*
macros defined in public/domctl.h. xen/errno.h is also needed for
EOPNOTSUPP (it seemed to be getting included by sched.h). I'll drop the
sched.h include as well as the duplicate public/domctl.h include though.

>> --- /dev/null
>> +++ b/xen/arch/ppc/include/asm/numa.h
>> @@ -0,0 +1,26 @@
>> +#ifndef __ASM_PPC_NUMA_H__
>> +#define __ASM_PPC_NUMA_H__
>> +
>> +#include <xen/types.h>
>> +#include <xen/mm.h>
>> +
>> +typedef uint8_t nodeid_t;
>> +
>> +/* Fake one node for now. See also node_online_map. */
>> +#define cpu_to_node(cpu) 0
>> +#define node_to_cpumask(node)   (cpu_online_map)
>> +
>> +/*
>> + * TODO: make first_valid_mfn static when NUMA is supported on Arm, this
>> + * is required because the dummy helpers are using it.
>> + */
>> +extern mfn_t first_valid_mfn;
> 
> At least "Arm" wants replacing in the comment, I think.
>

Good catch.

>> --- /dev/null
>> +++ b/xen/arch/ppc/include/asm/percpu.h
>> @@ -0,0 +1,26 @@
>> +#ifndef __PPC_PERCPU_H__
>> +#define __PPC_PERCPU_H__
>> +
>> +#ifndef __ASSEMBLY__
>> +
>> +#include <xen/types.h>
> 
> Looks like nothing in the file requires this.
> 

You are correct. I'll drop it.

>> --- /dev/null
>> +++ b/xen/arch/ppc/include/asm/procarea.h
>> @@ -0,0 +1,38 @@
>> +/*
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation; either version 2 of the License, or
>> + * (at your option) any later version.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + *
>> + * You should have received a copy of the GNU General Public License
>> + * along with this program; if not, write to the Free Software
>> + * Foundation, 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
> 
> SPDX again please (and there's at least one more below).
>

Will fix.

>> + * Copyright (C) IBM Corp. 2005
>> + *
>> + * Authors: Hollis Blanchard <hollisb@us.ibm.com>
>> + */
>> +
>> +#ifndef _ASM_PROCAREA_H_
>> +#define _ASM_PROCAREA_H_
>> +
>> +#include <xen/types.h>
> 
> Again nothing looks to require this.
> 

Will remove.

>> +struct vcpu;
>> +struct gdb_state;
> 
> The later of these is unused below. The former is used, but in a way
> that would require a forward decl only in C++.
>

I'll drop them both.

>> --- a/xen/arch/ppc/include/asm/processor.h
>> +++ b/xen/arch/ppc/include/asm/processor.h
>> @@ -110,6 +110,10 @@
>>  /* Macro to adjust thread priority for hardware multithreading */
>>  #define HMT_very_low()  asm volatile ( "or %r31, %r31, %r31" )
>>  
>> +/* TODO: This isn't correct */
>> +#define cpu_to_core(_cpu)   (0)
>> +#define cpu_to_socket(_cpu) (0)
> 
> As mentioned elsewhere, please try to avoid leading underscores in
> macro parameter names (or macro local variables, just to mention
> it again in this context).
> 

Will fix.

>> @@ -175,6 +179,8 @@ static inline void noreturn die(void)
>>          HMT_very_low();
>>  }
>>  
>> +#define cpu_relax() asm volatile ( "or %r1, %r1, %r1; or %r2, %r2, %r2" )
> 
> Just like HMT_very_low() this could do with a comment explaining
> the "interesting" ORs (until such time when the assembler supports
> suitable mnemonics).
> 
>> --- a/xen/arch/ppc/include/asm/regs.h
>> +++ b/xen/arch/ppc/include/asm/regs.h
>> @@ -23,6 +23,8 @@
>>  #ifndef _ASM_REG_DEFS_H_
>>  #define _ASM_REG_DEFS_H_
>>  
>> +#include <xen/types.h>
>> +
>>  /* Special Purpose Registers */
>>  #define SPRN_VRSAVE 256
>>  #define SPRN_DSISR  18
> 
> Why would this #include be needed here all of the sudden?
> 

This was a stray change I forgot to remove. Will fix.

>> --- a/xen/arch/ppc/include/asm/system.h
>> +++ b/xen/arch/ppc/include/asm/system.h
>> @@ -1,6 +1,247 @@
>> +/*
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation; either version 2 of the License, or
>> + * (at your option) any later version.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + *
>> + * You should have received a copy of the GNU General Public License
>> + * along with this program; if not, write to the Free Software
>> + * Foundation, 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
>> + *
>> + * Copyright (C) IBM Corp. 2005
>> + * Copyright (C) Raptor Engineering LLC
>> + *
>> + * Authors: Jimi Xenidis <jimix@watson.ibm.com>
>> + *          Shawn Anastasio <sanastasio@raptorengineering.com>
>> + */
>> +
>>  #ifndef _ASM_SYSTEM_H_
>>  #define _ASM_SYSTEM_H_
>>  
>> -#define smp_wmb() __asm__ __volatile__ ( "lwsync" : : : "memory" )
>> +#include <xen/config.h>
> 
> As mentioned before - any such #include you find is a leftover.

Will update.

> Jan

Thanks,
Shawn

