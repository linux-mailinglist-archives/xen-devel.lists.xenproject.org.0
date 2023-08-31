Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 830CC78F55C
	for <lists+xen-devel@lfdr.de>; Fri,  1 Sep 2023 00:23:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594147.927368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbq3o-0006Il-3Y; Thu, 31 Aug 2023 22:22:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594147.927368; Thu, 31 Aug 2023 22:22:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbq3n-0006FR-VF; Thu, 31 Aug 2023 22:22:43 +0000
Received: by outflank-mailman (input) for mailman id 594147;
 Thu, 31 Aug 2023 22:22:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z9zM=EQ=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qbq3l-0006F2-Tm
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 22:22:42 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e49f79b0-484c-11ee-8783-cb3800f73035;
 Fri, 01 Sep 2023 00:22:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id DBC59828550E;
 Thu, 31 Aug 2023 17:22:37 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id SbiaVbeU6jeb; Thu, 31 Aug 2023 17:22:35 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 5D5F88285944;
 Thu, 31 Aug 2023 17:22:35 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id kBKbXCVRn9ol; Thu, 31 Aug 2023 17:22:35 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 88B10828550E;
 Thu, 31 Aug 2023 17:22:34 -0500 (CDT)
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
X-Inumbo-ID: e49f79b0-484c-11ee-8783-cb3800f73035
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 5D5F88285944
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1693520555; bh=oBNpj+tfF1vmPEGZBqFFCuroBCG9Wiu1UYbJ/4xuoPc=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=AmdhgcJhDuarHgNjnPqmpHOqaYTeKs7b8h/zBIc3ylavLgwY8g+b8timIr3qBOL28
	 g3Z7l79B6drxnJVxAA79sLvhoQT6SLROqvUzfy7aH0BgCJRmAmv5Coq++FKxGbkPoY
	 IrShlQpvGcR3HR+gdxFGEY/b0DPIn2L+cVZ3amvc=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <e07d7f3c-0747-b979-3709-0900ae8798b5@raptorengineering.com>
Date: Thu, 31 Aug 2023 17:22:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 5/8] xen/ppc: Define minimal stub headers required for
 full build
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1692816595.git.sanastasio@raptorengineering.com>
 <a92f99e8f697da99d77bfde562a549dbef3760ce.1692816595.git.sanastasio@raptorengineering.com>
 <47e40325-0521-c2ee-e0da-99bfb4449097@suse.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <47e40325-0521-c2ee-e0da-99bfb4449097@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/30/23 5:49 AM, Jan Beulich wrote:
> On 23.08.2023 22:07, Shawn Anastasio wrote:
>> --- /dev/null
>> +++ b/xen/arch/ppc/include/asm/altp2m.h
>> @@ -0,0 +1,25 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +#ifndef __ASM_PPC_ALTP2M_H__
>> +#define __ASM_PPC_ALTP2M_H__
>> +
>> +#include <xen/bug.h>
>> +
>> +struct domain;
>> +struct vcpu;
>> +
>> +/* Alternate p2m on/off per domain */
>> +static inline bool altp2m_active(const struct domain *d)
>> +{
>> +    /* Not implemented on PPC. */
>> +    return false;
>> +}
>> +
>> +/* Alternate p2m VCPU */
>> +static inline uint16_t altp2m_vcpu_idx(const struct vcpu *v)
>> +{
>> +    /* Not implemented on PPC, should not be reached. */
>> +    BUG_ON("unimplemented");
> 
> I would have thought this construct is meant to flag places that need
> work in the course of bringing up Xen on PPC. This isn't one of those,
> I think. Perhaps ASSERT_UNREACHABLE() is slightly better here than
> Arm's BUG()?
>

Yes, good point. I did an indiscriminate regex to replace all BUG()
calls introduced by my earlier patch with this new construct, but as you
point out it erroneously included functions that are meant to be
unreachable.

I'll go with ASSERT_UNREACHABLE() here.

>> --- /dev/null
>> +++ b/xen/arch/ppc/include/asm/current.h
>> @@ -0,0 +1,42 @@
>> +#ifndef __ASM_PPC_CURRENT_H__
>> +#define __ASM_PPC_CURRENT_H__
>> +
>> +#include <xen/percpu.h>
>> +
>> +#ifndef __ASSEMBLY__
>> +
>> +struct vcpu;
>> +
>> +/* Which VCPU is "current" on this PCPU. */
>> +DECLARE_PER_CPU(struct vcpu *, curr_vcpu);
>> +
>> +#define current            (this_cpu(curr_vcpu))
>> +#define set_current(vcpu)  do { current = (vcpu); } while (0)
>> +#define get_cpu_current(cpu)  (per_cpu(curr_vcpu, cpu))
>> +
>> +/* Per-VCPU state that lives at the top of the stack */
>> +struct cpu_info {
>> +    struct cpu_user_regs guest_cpu_user_regs;
>> +    unsigned long elr;
>> +    uint32_t flags;
> 
> May I suggest that you pick one of fixed-width types or basic C types
> for consistent use here?
>

Sure. I'll go with C types here.

>> +};
>> +
>> +static inline struct cpu_info *get_cpu_info(void)
>> +{
>> +#ifdef __clang__
>> +    unsigned long sp;
>> +
>> +    asm ("mr %0, 1" : "=r" (sp));
> 
> Nit: Style.
> 

Will fix.

>> --- /dev/null
>> +++ b/xen/arch/ppc/include/asm/device.h
>> @@ -0,0 +1,53 @@
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
>> +    DEVICE_GIC,
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
>> +static const struct device_desc __dev_desc_##_name __used           \
>> +__section(".dev.info") = {                                          \
>> +    .name = _namestr,                                               \
>> +    .class = _class,                                                \
>> +
>> +#define DT_DEVICE_END                                               \
>> +};
>> +
>> +#endif /* __ASM_PPC_DEVICE_H__ */
> 
> Do you really need everything you put in here?
>

The device_type enumerations and struct device are required.

Some definition of device_t is required, as well as some definition of
DT_DEVICE_{START,END}. I could of course stub them out (e.g. with empty
structs) but I didn't really see a point when the definitions from ARM
seem largely applicable.

That said, the DEVICE_GIC enumeration definitely doesn't belong, so I'll
remove it.

>> --- /dev/null
>> +++ b/xen/arch/ppc/include/asm/div64.h
>> @@ -0,0 +1,14 @@
>> +#ifndef __ASM_PPC_DIV64_H__
>> +#define __ASM_PPC_DIV64_H__
>> +
>> +#include <xen/types.h>
>> +
>> +#define do_div(n,base) ({                       \
>> +    uint32_t __base = (base);                   \
>> +    uint32_t __rem;                             \
>> +    __rem = ((uint64_t)(n)) % __base;           \
>> +    (n) = ((uint64_t)(n)) / __base;             \
>> +    __rem;                                      \
>> +})
> 
> I understand you're merely copying this from elsewhere, but it would be
> really nice if style could be corrected for such new instances (no
> leading underscores, blank after comma, and ideally also no excess
> parentheses).
>

I'll fix the leading underscores and missing blank. As for unnecessary
parenthesis, I'm assuming you mean (base) in the first statement and (n)
in the second-to-last one, but I'd personally rather leave them.

>> --- /dev/null
>> +++ b/xen/arch/ppc/include/asm/domain.h
>> @@ -0,0 +1,46 @@
>> +#ifndef __ASM_PPC_DOMAIN_H__
>> +#define __ASM_PPC_DOMAIN_H__
>> +
>> +#include <xen/xmalloc.h>
>> +#include <public/hvm/params.h>
>> +
>> +struct hvm_domain
>> +{
>> +    uint64_t              params[HVM_NR_PARAMS];
>> +};
>> +
>> +#define is_domain_direct_mapped(d) ((void)(d), 0)
>> +
>> +/* TODO: Implement */
>> +#define guest_mode(r) ({ (void) (r); BUG_ON("unimplemented"); 0; })
> 
> Nit: Stray blank after cast (more instances of this pattern elsewhere).
>

Will fix.

>> diff --git a/xen/arch/ppc/include/asm/grant_table.h b/xen/arch/ppc/include/asm/grant_table.h
>> new file mode 100644
>> index 0000000000..e69de29bb2
> 
> Instead of introducing a completely empty file, perhaps better to put
> one in that at least has the usual header guard?
> 

Sure -- will add a header guard.

>> --- /dev/null
>> +++ b/xen/arch/ppc/include/asm/guest_access.h
>> @@ -0,0 +1,54 @@
>> +#ifndef __ASM_PPC_GUEST_ACCESS_H__
>> +#define __ASM_PPC_GUEST_ACCESS_H__
>> +
>> +#include <xen/mm.h>
>> +
>> +/* TODO */
>> +
>> +static inline unsigned long raw_copy_to_guest(void *to, const void *from, unsigned int len)
>> +{
>> +    BUG_ON("unimplemented");
>> +}
>> +static inline unsigned long raw_copy_to_guest_flush_dcache(void *to, const void *from,
>> +                                             unsigned int len)
> 
> Nit: Indentation. In cases like this it may be better to use the other
> wrapping form:
> 
> static inline unsigned long raw_copy_to_guest_flush_dcache(
>     void *to,
>     const void *from,
>     unsigned int len)
> {
>     ...
> 
> More instances further down.
> 

Thanks for letting me know about this form -- I'll fix it here and
below. I also notice that the function above this (raw_copy_to_guest) is
above the column limit, so I'll change it too.

>> --- /dev/null
>> +++ b/xen/arch/ppc/include/asm/guest_atomics.h
>> @@ -0,0 +1,14 @@
>> +#ifndef __ASM_PPC_GUEST_ATOMICS_H__
>> +#define __ASM_PPC_GUEST_ATOMICS_H__
>> +
>> +#include <xen/lib.h>
>> +
>> +/* TODO: implement */
>> +#define guest_test_bit(d, nr, p)            ({ (void) (d); (void) (nr); (void) (p); BUG_ON("unimplemented"); false; })
>> +#define guest_clear_bit(d, nr, p)           ({ (void) (d); (void) (nr); (void) (p); BUG_ON("unimplemented"); false; })
>> +#define guest_set_bit(d, nr, p)             ({ (void) (d); (void) (nr); (void) (p); BUG_ON("unimplemented"); false; })
>> +#define guest_test_and_set_bit(d, nr, p)    ({ (void) (d); (void) (nr); (void) (p); BUG_ON("unimplemented"); false; })
>> +#define guest_test_and_clear_bit(d, nr, p)  ({ (void) (d); (void) (nr); (void) (p); BUG_ON("unimplemented"); false; })
>> +#define guest_test_and_change_bit(d, nr, p) ({ (void) (d); (void) (nr); (void) (p); BUG_ON("unimplemented"); false; })
> 
> Perhaps deal with these overlong lines by introducing a common helper macro
> that all of the #define-s here then use?
>

Good idea. Will do.

>> --- a/xen/arch/ppc/include/asm/mm.h
>> +++ b/xen/arch/ppc/include/asm/mm.h
>> @@ -1,10 +1,23 @@
>>  #ifndef _ASM_PPC_MM_H
>>  #define _ASM_PPC_MM_H
>>
>> +#include <public/xen.h>
>> +#include <xen/pdx.h>
>> +#include <xen/types.h>
>> +#include <asm/config.h>
>>  #include <asm/page-bits.h>
>>
>> +void setup_initial_pagetables(void);
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
>>  #define maddr_to_virt(pa) ((void *)((paddr_t)(pa) | XEN_VIRT_START))
>> @@ -13,6 +26,240 @@
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
> 
> BUG_ON("unimplemented")?
> 

Will do.

>> +#define mfn_to_gfn(d, mfn) ((void)(d), _gfn(mfn_x(mfn)))
> 
> This looks risky to me. Perhaps better to also use BUG_ON("unimplemented")
> here?
>

This was copied from ARM, though admittedly it does appear to rely on
some design assumptions that haven't yet been made for PPC, so I'm fine
changing this to a BUG_ON.

>> +#define domain_set_alloc_bitsize(d) ((void)0)
> 
> Better ((void)(d)).
> 

Will do.

>> +#define domain_clamp_alloc_bitsize(d, b) (b)
>> +
>> +#define PFN_ORDER(_pfn) ((_pfn)->v.free.order)
> 
> Unnessary leading underscore again.
>

Will fix.

>> [...]
>> +#define PDX_GROUP_SHIFT (16 + 5)
> 
> DYM (PAGE_SHIFT + XEN_PT_ENTRIES_LOG2_LVL_4) or simply XEN_PT_SHIFT_LVL_3?
> Using open-coded literal numbers is always at risk of breaking (when one
> use site is updated, but another missed) and also isn't self-documenting.
>

Ah, yes, I had meant to clean this up before but seemingly forgot.
Will change to XEN_PT_SHIFT_LVL_3.

>> --- /dev/null
>> +++ b/xen/arch/ppc/include/asm/monitor.h
>> @@ -0,0 +1,46 @@
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
>> +    uint32_t capabilities = 0;
>> +
>> +    capabilities = (1U << XEN_DOMCTL_MONITOR_EVENT_GUEST_REQUEST |
>> +                    1U << XEN_DOMCTL_MONITOR_EVENT_PRIVILEGED_CALL);
> 
> Are you sure about putting these here right away?
>

No, I suppose BUG_ON("unimplemented") would be best at this point. Will
update.

>> --- /dev/null
>> +++ b/xen/arch/ppc/include/asm/nospec.h
>> @@ -0,0 +1,18 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * From arch/arm/include/asm/nospec.h.
>> + * Copyright 2018 Amazon.com, Inc. or its affiliates. All Rights Reserved.
> 
> I wonder about both the reference and the copyright, when ...
>

Fair enough I suppose. I think the reference to the corresponding arm
file is useful though. If not for copyright purposes, it at least shows
that this no-op implementation isn't some ppc-specific stub.

I'll drop the unnecessary copyright header.

>> + */
>> +#ifndef __ASM_PPC_NOSPEC_H__
>> +#define __ASM_PPC_NOSPEC_H__
>> +
>> +static inline bool evaluate_nospec(bool condition)
>> +{
>> +    return condition;
>> +}
>> +
>> +static inline void block_speculation(void)
>> +{
>> +}
>> +
>> +#endif /* __ASM_PPC_NOSPEC_H__ */
> 
> ... seeing this trivial content.
> 
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
> Is PPC's memory model really this similar to Arm's? If not, I'd recommend
> ommitting all enumerators you don't need right away.
>

I'm not familiar enough with Arm's memory model to make this
determination right now, so I'll follow your suggestion and remove all
but the first 3 enumeration entries.

>> --- a/xen/arch/ppc/include/asm/page.h
>> +++ b/xen/arch/ppc/include/asm/page.h
>> @@ -36,6 +36,9 @@
>>  #define PTE_XEN_RO   (PTE_XEN_BASE | PTE_EAA_READ)
>>  #define PTE_XEN_RX   (PTE_XEN_BASE | PTE_EAA_READ | PTE_EAA_EXECUTE)
>>
>> +/* TODO */
>> +#define PAGE_HYPERVISOR 0
>> +
>>  /*
>>   * Radix Tree layout for 64KB pages:
>>   *
>> @@ -177,4 +180,18 @@ struct prtb_entry {
>>
>>  void tlbie_all(void);
>>
>> +static inline void invalidate_icache(void)
>> +{
>> +    BUG_ON("unimplemented");
>> +}
>> +
>> +#define clear_page(page) memset((void *)(page), 0, PAGE_SIZE)
>> +#define copy_page(dp, sp) memcpy(dp, sp, PAGE_SIZE)
> 
> Does clear_page() really need a cast, when copy_page() doesn't?
>

Good observation. Will drop the cast.

>> --- /dev/null
>> +++ b/xen/arch/ppc/include/asm/procarea.h
>> @@ -0,0 +1,20 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/*
>> + * Copyright (C) IBM Corp. 2005
>> + *
>> + * Authors: Hollis Blanchard <hollisb@us.ibm.com>
>> + */
>> +
>> +#ifndef _ASM_PROCAREA_H_
>> +#define _ASM_PROCAREA_H_
>> +
>> +struct processor_area
>> +{
>> +    unsigned int whoami;
>> +    unsigned int hard_id;
>> +    struct vcpu *cur_vcpu;
>> +    void *hyp_stack_base;
>> +    unsigned long saved_regs[2];
>> +};
>> +
>> +#endif
> 
> I can't spot a need for this header, and it's also unclear how it / the
> struct it defines would be meant to be used. Perhpas better omit for now.
>

Fair enough -- I'll omit it.

>> --- a/xen/arch/ppc/include/asm/system.h
>> +++ b/xen/arch/ppc/include/asm/system.h
>> @@ -1,6 +1,233 @@
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
>> +#define xchg(ptr,x) 							       \
>> +({									       \
>> +	__typeof__(*(ptr)) _x_ = (x);					       \
>> +	(__typeof__(*(ptr))) __xchg((ptr), (unsigned long)_x_, sizeof(*(ptr))); \
>> +})
>> +
>> +#define build_xchg(fn, type, ldinsn, stinsn) \
>> +static inline unsigned long \
>> +fn(volatile type *m, unsigned long val) \
>> +{ \
>> +    unsigned long dummy; \
>> +                                                    \
>> +    __asm__ __volatile__(                           \
>> +    PPC_ATOMIC_ENTRY_BARRIER                        \
>> +"1: " ldinsn " %0,0,%3\n"                           \
>> +    stinsn " %2,0,%3\n"                             \
>> +"2:  bne- 1b"                                       \
>> +    PPC_ATOMIC_EXIT_BARRIER                         \
>> +    : "=&r" (dummy), "=m" (*m)                      \
>> +    : "r" (val), "r" (m)                            \
>> +    : "cc", "memory");                              \
> 
> Nit: Style and indentation (more such below).
> 

Will fix.

>> [...]
>> +#define local_irq_restore(flags) do { \
>> +        __asm__ __volatile__("": : :"memory"); \
>> +        mtmsrd((flags)); \
>> +} while(0)
>> +
>> +static inline void local_irq_disable(void)
>> +{
>> +        unsigned long msr;
>> +        msr = mfmsr();
>> +        mtmsrd(msr & ~MSR_EE);
>> +        __asm__ __volatile__("" : : : "memory");
>> +}
>> +
>> +static inline void local_irq_enable(void)
>> +{
>> +        unsigned long msr;
>> +        __asm__ __volatile__("" : : : "memory");
>> +        msr = mfmsr();
>> +        mtmsrd(msr | MSR_EE);
>> +}
> 
> Nit: Too deep indentation.
>

Will fix.

>> --- /dev/null
>> +++ b/xen/arch/ppc/include/asm/time.h
>> @@ -0,0 +1,20 @@
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
>> +
>> +typedef unsigned long cycles_t;
>> +
>> +static inline cycles_t get_cycles(void)
>> +{
>> +	return mfspr(SPRN_TBRL);
> 
> Nit: Hard tab left.
>

Will fix.

>> --- /dev/null
>> +++ b/xen/arch/ppc/include/asm/vm_event.h
> 
> For this, please note Oleksii's 2-patch series eliminating the need for
> a per-arch header. Else ...
>

AFAICT, the series in question hasn't been merged or even Ack'd yet.
I'll keep an eye out for it, but for my immediate next series addressing
your comments from this one I'll leave this file in.

>> @@ -0,0 +1,49 @@
>> +#ifndef __ASM_PPC_VM_EVENT_H__
>> +#define __ASM_PPC_VM_EVENT_H__
>> +
>> +#include <xen/sched.h>
>> +#include <xen/vm_event.h>
>> +#include <public/domctl.h>
> 
> ... public/vm_event.h instead and likely no need for xen/vm_event.h.
>

Will change, and you're correct about xen/vm_event.h.

>> diff --git a/xen/arch/ppc/include/asm/xenoprof.h b/xen/arch/ppc/include/asm/xenoprof.h
>> new file mode 100644
>> index 0000000000..e69de29bb2
> 
> Again perhaps better to not introduce an entirely empty header.
>

Will fix.

> I also notice that most new files don't have an SPDX header. Would be
> nice to fulfill this formal aspect right from the start.

Since you've commented on some copyright headers in trivial stub files
before, could you clarify whether you'd want an SPDX header in every
introduced header, including empty/trivially stubbed ones?

> Jan

Thanks,
Shawn

