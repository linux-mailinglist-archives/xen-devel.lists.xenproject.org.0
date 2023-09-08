Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E21A799205
	for <lists+xen-devel@lfdr.de>; Sat,  9 Sep 2023 00:06:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.598208.932814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qejbQ-0000iL-IX; Fri, 08 Sep 2023 22:05:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 598208.932814; Fri, 08 Sep 2023 22:05:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qejbQ-0000ge-Eq; Fri, 08 Sep 2023 22:05:24 +0000
Received: by outflank-mailman (input) for mailman id 598208;
 Fri, 08 Sep 2023 22:05:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6LDZ=EY=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qejbP-0000gY-9I
 for xen-devel@lists.xenproject.org; Fri, 08 Sep 2023 22:05:23 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb7e560a-4e93-11ee-9b0d-b553b5be7939;
 Sat, 09 Sep 2023 00:05:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 12FAC8285509;
 Fri,  8 Sep 2023 17:05:17 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id X_y4p5TNH9Q0; Fri,  8 Sep 2023 17:05:15 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id E82B082856EA;
 Fri,  8 Sep 2023 17:05:14 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Hq681h5S0zQe; Fri,  8 Sep 2023 17:05:14 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 6D50F828566C;
 Fri,  8 Sep 2023 17:05:14 -0500 (CDT)
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
X-Inumbo-ID: cb7e560a-4e93-11ee-9b0d-b553b5be7939
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com E82B082856EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1694210714; bh=jDv5IUYNivmcn06k2nJJjqK9AF24F3z/4po08eKK6wk=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=Grhc7EGcMdxpkNcsdc2WWCsGdtrIrh/PNSt1ccH6hWl4KlotITLEfRzLMF5hIclN7
	 PZ8Kq+4UTa1uAAq19Hmrf+gNDuEVtKeY1cox9uPopS7qMag6GSmNzJLEifQMeFu3/z
	 Xhvc1R0TvUD2vH0ScAGsCfW0FIixGqhBfDrIAVsw=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <7f6914e3-71e8-0bff-dc8f-c0f897ddcd2f@raptorengineering.com>
Date: Fri, 8 Sep 2023 17:05:13 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 3/5] xen/ppc: Define minimal stub headers required for
 full build
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1693590982.git.sanastasio@raptorengineering.com>
 <dd3d9c5d9ec94f9e1747ccc0fbf82629a58bddcb.1693590982.git.sanastasio@raptorengineering.com>
 <16496c4c-4c92-7ed9-a612-72e75f86798f@suse.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <16496c4c-4c92-7ed9-a612-72e75f86798f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/5/23 10:52 AM, Jan Beulich wrote:
> On 01.09.2023 20:25, Shawn Anastasio wrote:
>> --- /dev/null
>> +++ b/xen/arch/ppc/include/asm/device.h
>> @@ -0,0 +1,53 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +#ifndef __ASM_PPC_DEVICE_H__
>> +#define __ASM_PPC_DEVICE_H__
>> +
>> +enum device_type
>> +{
>> +    DEV_DT,
>> +    DEV_PCI,
>> +};
>> +
>> +struct device {
>> +    enum device_type type;
>> +#ifdef CONFIG_HAS_DEVICE_TREE
>> +    struct dt_device_node *of_node; /* Used by drivers imported from Linux */
>> +#endif
>> +};
>> +
>> +enum device_class
>> +{
>> +    DEVICE_SERIAL,
>> +    DEVICE_IOMMU,
>> +    DEVICE_PCI_HOSTBRIDGE,
>> +    /* Use for error */
>> +    DEVICE_UNKNOWN,
>> +};
>> +
>> +struct device_desc {
>> +    /* Device name */
>> +    const char *name;
>> +    /* Device class */
>> +    enum device_class class;
>> +    /* List of devices supported by this driver */
>> +    const struct dt_device_match *dt_match;
>> +    /*
>> +     * Device initialization.
>> +     *
>> +     * -EAGAIN is used to indicate that device probing is deferred.
>> +     */
>> +    int (*init)(struct dt_device_node *dev, const void *data);
>> +};
>> +
>> +typedef struct device device_t;
>> +
>> +#define DT_DEVICE_START(_name, _namestr, _class)                    \
> 
> Nit: Underscore-prefixed macro parameter names again.
>

Will fix.

>> --- a/xen/arch/ppc/include/asm/mm.h
>> +++ b/xen/arch/ppc/include/asm/mm.h
>> @@ -1,10 +1,25 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>  #ifndef _ASM_PPC_MM_H
>>  #define _ASM_PPC_MM_H
>>
>> +#include <public/xen.h>
>> +#include <xen/pdx.h>
>> +#include <xen/types.h>
>> +#include <asm/config.h>
>>  #include <asm/page-bits.h>
>> +#include <asm/page.h>
>> +
>> +void setup_initial_pagetables(void);
>>
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
>>  #define maddr_to_virt(pa) ((void *)((paddr_t)(pa) | XEN_VIRT_START))
> 
> Is it intentional that the additions don't align, padding-wise, with the
> surrounding #define-s?
>

No -- good catch. I'll adjust the padding to line up properly.

>> @@ -13,6 +28,237 @@
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
>> +    BUG_ON("unimplemented");
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
> 
> Is the comment really applicable? The only non-arch-specific file still
> doing so is xenoprof.c, and I'm not sure you mean to support xenoprof
> on PPC. PPC-specific files would better be introduced in a type-safe way
> right from the beginning.
>

To be clear, you're suggesting that I define virt_to_mfn and mfn_to_virt
to operate on the type-safe mfn_t wrapper? When doing this,
xen/include/xen/domain_page.h:63 fails to build, since it seems to
assume that these macros do not use the type-safe mfn_t:

  static inline void *map_domain_page_global(mfn_t mfn)
  {
      return mfn_to_virt(mfn_x(mfn));
  }

If the comment is no longer accurate I can drop it, but there definitely
seems to be an assumption in the codebase that these macros operate on
raw unsigned longs rather than mfn_t.

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
> 
> Please use (or, preferred, do not use) & and cast consistently on _start
> and _end.
>

Will fix.

>> +#define page_get_owner(_p)    (_p)->v.inuse.domain
>> +#define page_set_owner(_p,_d) ((_p)->v.inuse.domain = (_d))
>> +
>> +/* TODO: implement */
>> +#define mfn_valid(mfn) ({ (void) (mfn); 0; })
>> +
>> +#define domain_set_alloc_bitsize(d) ((void)(d))
>> +#define domain_clamp_alloc_bitsize(d, b) (b)
>> +
>> +#define PFN_ORDER(pfn_) ((pfn_)->v.free.order)
>> +
>> +struct page_info
>> +{
>> +    /* Each frame can be threaded onto a doubly-linked list. */
>> +    struct page_list_entry list;
>> +
>> +    /* Reference count and various PGC_xxx flags and fields. */
>> +    unsigned long count_info;
>> +
>> +    /* Context-dependent fields follow... */
>> +    union {
>> +        /* Page is in use: ((count_info & PGC_count_mask) != 0). */
>> +        struct {
>> +            /* Type reference count and various PGT_xxx flags and fields. */
>> +            unsigned long type_info;
>> +        } inuse;
>> +        /* Page is on a free list: ((count_info & PGC_count_mask) == 0). */
>> +        union {
>> +            struct {
>> +                /*
>> +                 * Index of the first *possibly* unscrubbed page in the buddy.
>> +                 * One more bit than maximum possible order to accommodate
>> +                 * INVALID_DIRTY_IDX.
>> +                 */
>> +#define INVALID_DIRTY_IDX ((1UL << (MAX_ORDER + 1)) - 1)
>> +                unsigned long first_dirty:MAX_ORDER + 1;
>> +
>> +                /* Do TLBs need flushing for safety before next page use? */
>> +                bool need_tlbflush:1;
>> +
>> +#define BUDDY_NOT_SCRUBBING    0
>> +#define BUDDY_SCRUBBING        1
>> +#define BUDDY_SCRUB_ABORT      2
>> +                unsigned long scrub_state:2;
>> +            };
>> +
>> +            unsigned long val;
>> +        } free;
>> +
>> +    } u;
>> +
>> +    union {
>> +        /* Page is in use, but not as a shadow. */
>> +        struct {
>> +            /* Owner of this page (zero if page is anonymous). */
>> +            struct domain *domain;
> 
> Since this is a pointer, NULL (instead of zero) would seem more appropriate
> in the comment.
>

Will update comment.

>> +        } inuse;
>> +
>> +        /* Page is on a free list. */
>> +        struct {
>> +            /* Order-size of the free chunk this page is the head of. */
>> +            unsigned int order;
>> +        } free;
>> +
>> +    } v;
>> +
>> +    union {
>> +        /*
>> +         * Timestamp from 'TLB clock', used to avoid extra safety flushes.
>> +         * Only valid for: a) free pages, and b) pages with zero type count
>> +         */
>> +        u32 tlbflush_timestamp;
>> +    };
>> +    u64 pad;
> 
> uint<N>_t please (or unsigned int/long).
>

Will use uint<N>_t.

>> --- /dev/null
>> +++ b/xen/arch/ppc/include/asm/monitor.h
>> @@ -0,0 +1,43 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/* Derived from xen/arch/arm/include/asm/monitor.h */
>> +#ifndef __ASM_PPC_MONITOR_H__
>> +#define __ASM_PPC_MONITOR_H__
>> +
>> +#include <public/domctl.h>
>> +#include <xen/errno.h>
>> +
>> +static inline
>> +void arch_monitor_allow_userspace(struct domain *d, bool allow_userspace)
>> +{
>> +}
>> +
>> +static inline
>> +int arch_monitor_domctl_op(struct domain *d, struct xen_domctl_monitor_op *mop)
>> +{
>> +    /* No arch-specific monitor ops on PPC. */
>> +    return -EOPNOTSUPP;
>> +}
>> +
>> +int arch_monitor_domctl_event(struct domain *d,
>> +                              struct xen_domctl_monitor_op *mop);
>> +
>> +static inline
>> +int arch_monitor_init_domain(struct domain *d)
>> +{
>> +    /* No arch-specific domain initialization on PPC. */
>> +    return 0;
>> +}
>> +
>> +static inline
>> +void arch_monitor_cleanup_domain(struct domain *d)
>> +{
>> +    /* No arch-specific domain cleanup on PPC. */
>> +}
>> +
>> +static inline uint32_t arch_monitor_get_capabilities(struct domain *d)
>> +{
>> +    BUG_ON("unimplemented");
>> +    return 0;
>> +}
>> +
>> +#endif /* __ASM_PPC_MONITOR_H__ */
> 
>>From a formal perspective you'll need Tamas's ack for this file, so you
> may want to Cc him. (Also for vm_event.h, unless the generic solution
> there doesn't land first.)
>

My apologies, meant to CC him but forgot. Will do for next version of
series.

>> --- /dev/null
>> +++ b/xen/arch/ppc/include/asm/p2m.h
>> @@ -0,0 +1,105 @@
>> +#ifndef __ASM_PPC_P2M_H__
>> +#define __ASM_PPC_P2M_H__
>> +
>> +#include <asm/page-bits.h>
>> +
>> +#define paddr_bits PADDR_BITS
>> +
>> +/*
>> + * List of possible type for each page in the p2m entry.
>> + * The number of available bit per page in the pte for this purpose is 4 bits.
>> + * So it's possible to only have 16 fields. If we run out of value in the
>> + * future, it's possible to use higher value for pseudo-type and don't store
>> + * them in the p2m entry.
>> + */
>> +typedef enum {
>> +    p2m_invalid = 0,    /* Nothing mapped here */
>> +    p2m_ram_rw,         /* Normal read/write guest RAM */
>> +    p2m_ram_ro,         /* Read-only; writes are silently dropped */
>> +    p2m_mmio_direct_dev,/* Read/write mapping of genuine Device MMIO area */
>> +    p2m_mmio_direct_nc, /* Read/write mapping of genuine MMIO area non-cacheable */
>> +    p2m_mmio_direct_c,  /* Read/write mapping of genuine MMIO area cacheable */
> 
> Didn't you agree to drop at least what's clear Arm-specific?
>

Yes -- that was an oversight. Will fix.

>> --- a/xen/arch/ppc/include/asm/system.h
>> +++ b/xen/arch/ppc/include/asm/system.h
>> @@ -1,6 +1,228 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/*
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
>> +#include <xen/lib.h>
>> +#include <asm/memory.h>
>> +#include <asm/time.h>
>> +#include <asm/processor.h>
>> +#include <asm/msr.h>
>> +
>> +#define xchg(ptr,x) 							                               \
>> +({									                                           \
>> +	__typeof__(*(ptr)) _x_ = (x);					                           \
> 
> Hard tabs look to have slipped in here.
>

Good eye. Will fix.

>> +	(__typeof__(*(ptr))) __xchg((ptr), (unsigned long)_x_, sizeof(*(ptr)));    \
>> +})
>> +
>> +#define build_xchg(fn, type, ldinsn, stinsn) \
>> +static inline unsigned long fn(volatile type *m, unsigned long val)            \
>> +{                                                                              \
>> +    unsigned long dummy;                                                       \
>> +    asm volatile ( PPC_ATOMIC_ENTRY_BARRIER                                    \
>> +                   "1: " ldinsn " %0,0,%3\n"                                   \
>> +                   stinsn " %2,0,%3\n"                                         \
>> +                   "2:  bne- 1b"                                               \
>> +                   PPC_ATOMIC_EXIT_BARRIER                                     \
>> +                   : "=&r" (dummy), "=m" (*m)                                  \
>> +                   : "r" (val), "r" (m)                                        \
>> +                   : "cc", "memory" );                                         \
>> +    return dummy;                                                              \
>> +}
>> +
>> +build_xchg(__xchg_u8, uint8_t, "lbarx", "stbcx.")
>> +build_xchg(__xchg_u16, uint16_t, "lharx", "sthcx.")
>> +build_xchg(__xchg_u32, uint32_t, "lwarx", "stwcx.")
>> +build_xchg(__xchg_u64, uint64_t, "ldarx", "stdcx.")
>> +
>> +#undef build_xchg
>> +
>> +/*
>> + * This function doesn't exist, so you'll get a linker error
>> + * if something tries to do an invalid xchg().
>> + */
>> +extern void __xchg_called_with_bad_pointer(void);
>> +
>> +static inline unsigned long __xchg(volatile void *ptr, unsigned long x,
>> +                                   int size)
>> +{
>> +    switch (size) {
> 
> Nit: Since the file looks like it wants to use Xen style:
> 
>     switch ( size )
>     {
> 
> please.
>

Will do.

>> +    case 1:
>> +        return __xchg_u8(ptr, x);
>> +    case 2:
>> +        return __xchg_u16(ptr, x);
>> +    case 4:
>> +        return __xchg_u32(ptr, x);
>> +    case 8:
>> +        return __xchg_u64(ptr, x);
>> +    }
>> +    __xchg_called_with_bad_pointer();
>> +    return x;
>> +}
>> +
>> +
>> +static inline unsigned long __cmpxchg_u32(volatile int *p, int old, int new)
>> +{
>> +    unsigned int prev;
>> +
>> +    asm volatile ( PPC_ATOMIC_ENTRY_BARRIER
>> +                   "1: lwarx   %0,0,%2\n"
>> +                   "cmpw    0,%0,%3\n"
>> +                   "bne-    2f\n "
>> +                   "stwcx.  %4,0,%2\n"
>> +                   "bne-    1b\n"
>> +                   PPC_ATOMIC_EXIT_BARRIER "\n"
>> +                   "2:"
>> +                   : "=&r" (prev), "=m" (*p)
>> +                   : "r" (p), "r" (old), "r" (new), "m" (*p)
>> +                   : "cc", "memory" );
>> +
>> +    return prev;
>> +}
>> +
>> +static inline unsigned long __cmpxchg_u64(volatile long *p, unsigned long old,
>> +                                          unsigned long new)
>> +{
>> +    unsigned long prev;
>> +
>> +    asm volatile ( PPC_ATOMIC_ENTRY_BARRIER
>> +                   "1: ldarx   %0,0,%2\n"
>> +                   "cmpd    0,%0,%3\n"
>> +                   "bne-    2f\n"
>> +                   "stdcx.  %4,0,%2\n"
>> +                   "bne-    1b"
>> +                   PPC_ATOMIC_EXIT_BARRIER "\n"
>> +                   "2:"
>> +                   : "=&r" (prev), "=m" (*p)
>> +                   : "r" (p), "r" (old), "r" (new), "m" (*p)
>> +                   : "cc", "memory" );
>> +
>> +    return prev;
>> +}
>> +
>> +/* This function doesn't exist, so you'll get a linker error
>> +   if something tries to do an invalid cmpxchg().  */
>> +extern void __cmpxchg_called_with_bad_pointer(void);
>> +
>> +static always_inline unsigned long __cmpxchg(
>> +    volatile void *ptr,
>> +    unsigned long old,
>> +    unsigned long new,
>> +    int size)
>> +{
>> +    switch (size) {
>> +    case 2:
>> +        BUG_ON("unimplemented"); return 0; /* XXX implement __cmpxchg_u16 ? */
>> +    case 4:
>> +        return __cmpxchg_u32(ptr, old, new);
>> +    case 8:
>> +        return __cmpxchg_u64(ptr, old, new);
>> +    }
>> +    __cmpxchg_called_with_bad_pointer();
>> +    return old;
>> +}
>> +
>> +#define cmpxchg_user(ptr,o,n) cmpxchg(ptr,o,n)
>> +
>> +#define cmpxchg(ptr,o,n)                         \
>> +  ({                                     \
>> +     __typeof__(*(ptr)) _o_ = (o);                   \
>> +     __typeof__(*(ptr)) _n_ = (n);                   \
>> +     (__typeof__(*(ptr))) __cmpxchg((ptr), (unsigned long)_o_,       \
>> +                    (unsigned long)_n_, sizeof(*(ptr))); \
> 
> Not: Style (multiple previously mentioned issues).
>

Will clean up.

>> +  })
>> +
>> +
>> +/*
>> + * Memory barrier.
>> + * The sync instruction guarantees that all memory accesses initiated
>> + * by this processor have been performed (with respect to all other
>> + * mechanisms that access memory).  The eieio instruction is a barrier
>> + * providing an ordering (separately) for (a) cacheable stores and (b)
>> + * loads and stores to non-cacheable memory (e.g. I/O devices).
>> + *
>> + * mb() prevents loads and stores being reordered across this point.
>> + * rmb() prevents loads being reordered across this point.
>> + * wmb() prevents stores being reordered across this point.
>> + * read_barrier_depends() prevents data-dependent loads being reordered
>> + *  across this point (nop on PPC).
>> + *
>> + * We have to use the sync instructions for mb(), since lwsync doesn't
>> + * order loads with respect to previous stores.  Lwsync is fine for
>> + * rmb(), though.
>> + * For wmb(), we use sync since wmb is used in drivers to order
>> + * stores to system memory with respect to writes to the device.
>> + * However, smp_wmb() can be a lighter-weight eieio barrier on
>> + * SMP since it is only used to order updates to system memory.
>> + */
>> +#define mb()   __asm__ __volatile__ ("sync" : : : "memory")
>> +#define rmb()  __asm__ __volatile__ ("lwsync" : : : "memory")
>> +#define wmb()  __asm__ __volatile__ ("sync" : : : "memory")
> 
> Nit: Missing blanks.
>

Will fix.

>> +#define read_barrier_depends()  do { } while(0)
>> +
>> +#define set_mb(var, value)  do { var = value; smp_mb(); } while (0)
>> +#define set_wmb(var, value) do { var = value; smp_wmb(); } while (0)
>> +
>> +#define smp_mb__before_atomic()    smp_mb()
>> +#define smp_mb__after_atomic()     smp_mb()
>> +
>> +#ifdef CONFIG_SMP
>> +#define smp_mb()    mb()
>> +#define smp_rmb()   rmb()
>> +#define smp_wmb()   __asm__ __volatile__ ("lwsync" : : : "memory")
>> +#define smp_read_barrier_depends()  read_barrier_depends()
>> +#else
>> +#define smp_mb()    __asm__ __volatile__("": : :"memory")
>> +#define smp_rmb()   __asm__ __volatile__("": : :"memory")
>> +#define smp_wmb()   __asm__ __volatile__("": : :"memory")
> 
> And more missing blanks (further below from here).
>

Will fix, along with removal of dead !CONFIG_SMP path.

>> +#define smp_read_barrier_depends()  do { } while(0)
>> +#endif /* CONFIG_SMP */
>> +
>> +#define local_save_flags(flags) ((flags) = mfmsr())
>> +#define local_irq_restore(flags) do { \
>> +        __asm__ __volatile__("": : :"memory"); \
>> +        mtmsrd((flags)); \
>> +} while(0)
>> +
>> +static inline void local_irq_disable(void)
>> +{
>> +    unsigned long msr;
>> +    msr = mfmsr();
>> +    mtmsrd(msr & ~MSR_EE);
>> +    asm volatile ( "" : : : "memory" );
> 
> That's simply barrier(), isn't it? Please avoid open-coding. (More
> further down.)
>

Good call. Will change all occurrences to barrier().

>> --- /dev/null
>> +++ b/xen/arch/ppc/include/asm/time.h
>> @@ -0,0 +1,21 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +#ifndef __ASM_PPC_TIME_H__
>> +#define __ASM_PPC_TIME_H__
>> +
>> +#include <xen/lib.h>
>> +#include <asm/processor.h>
>> +#include <asm/regs.h>
>> +
>> +struct vcpu;
>> +
>> +/* TODO: implement */
>> +static inline void force_update_vcpu_system_time(struct vcpu *v) { BUG_ON("unimplemented"); }
> 
> Nit: Too long line.
>

Will fix.

> Jan

Thanks,
Shawn

