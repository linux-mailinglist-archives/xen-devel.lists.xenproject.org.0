Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A1A774091
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 19:05:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580222.908567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTQ8f-00069K-9I; Tue, 08 Aug 2023 17:04:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580222.908567; Tue, 08 Aug 2023 17:04:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTQ8f-000673-5q; Tue, 08 Aug 2023 17:04:57 +0000
Received: by outflank-mailman (input) for mailman id 580222;
 Tue, 08 Aug 2023 17:04:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K7Oi=DZ=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qTQ8e-00062a-JW
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 17:04:56 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b1163a2e-360d-11ee-8613-37d641c3527e;
 Tue, 08 Aug 2023 19:04:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 21B538285626;
 Tue,  8 Aug 2023 12:04:52 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id zcTuPCpCFHRq; Tue,  8 Aug 2023 12:04:51 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id EFC1282856A2;
 Tue,  8 Aug 2023 12:04:50 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id c5x8cFD2Kyjd; Tue,  8 Aug 2023 12:04:50 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id D252D8285626;
 Tue,  8 Aug 2023 12:04:49 -0500 (CDT)
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
X-Inumbo-ID: b1163a2e-360d-11ee-8613-37d641c3527e
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com EFC1282856A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1691514291; bh=8mDkZMO38zMcyRoQH/8OKwJ+pAJdMUYCt14tcGDJBsE=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=G5COsaTNrdoAo4OMZuqGVaY5f3O0gnMsQb2oAcsXE+R21gxG03iKI/tpYJl3WF9WP
	 RU3yCWbYeGhZurjdrNn4WtwqrWfYjmAqQZSfcgJWPkRlBe+w8oHS7UEPvX05gu5BYu
	 4az8lFDMhWdW81EbMv9xUtIPOpgDJd/Ji+KLI3e4=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <95e2da23-1c04-266f-5a26-e43564485751@raptorengineering.com>
Date: Tue, 8 Aug 2023 12:04:48 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/9] xen/ppc: Add public/arch-ppc.h
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1691016993.git.sanastasio@raptorengineering.com>
 <14d8455ca49f69a56e87aad5d4e20cf8f77e55cd.1691016993.git.sanastasio@raptorengineering.com>
 <2705d5dd-e74f-4093-aad9-3e54060160f6@suse.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <2705d5dd-e74f-4093-aad9-3e54060160f6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/7/23 10:51 AM, Jan Beulich wrote:
> On 03.08.2023 01:02, Shawn Anastasio wrote:
>> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
>> ---
>>  xen/include/public/arch-ppc.h | 140 ++++++++++++++++++++++++++++++++++
>>  1 file changed, 140 insertions(+)
>>  create mode 100644 xen/include/public/arch-ppc.h
>>
>> diff --git a/xen/include/public/arch-ppc.h b/xen/include/public/arch-ppc.h
>> new file mode 100644
>> index 0000000000..0eb7ce4208
>> --- /dev/null
>> +++ b/xen/include/public/arch-ppc.h
>> @@ -0,0 +1,140 @@
>> +/*
>> + * Permission is hereby granted, free of charge, to any person obtaining a copy
>> + * of this software and associated documentation files (the "Software"), to
>> + * deal in the Software without restriction, including without limitation the
>> + * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
>> + * sell copies of the Software, and to permit persons to whom the Software is
>> + * furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice shall be included in
>> + * all copies or substantial portions of the Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
>> + * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
>> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
>> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
>> + * DEALINGS IN THE SOFTWARE.
> 
> Any reason for a spelled out license rather than an SPDX header?
> 

This was an oversight when importing the file from the old Xen 3.2
source tree. I'll drop the license text in favor of an SPDX header.

>> + * Copyright (C) IBM Corp. 2005, 2006
>> + * Copyright (C) Raptor Engineering, LLC 2023
>> + *
>> + * Authors: Hollis Blanchard <hollisb@us.ibm.com>
>> + *          Timothy Pearson <tpearson@raptorengineering.com>
>> + */
>> +
>> +#ifndef __XEN_PUBLIC_ARCH_PPC64_H__
>> +#define __XEN_PUBLIC_ARCH_PPC64_H__
> 
> The 64 wants dropping here, considering the name of the header.

Ditto. Will fix.

>> +#define  int64_aligned_t  int64_t __attribute__((aligned(8)))
>> +#define uint64_aligned_t uint64_t __attribute__((aligned(8)))
> 
> I understand arch-arm.h has it this way too, but in public headers I
> think we're better off using __aligned__ (in the example here).

Sure, I can make that change.

>> +#ifndef __ASSEMBLY__
>> +#define ___DEFINE_XEN_GUEST_HANDLE(name, type)                  \
>> +    typedef union { type *p; unsigned long q; }                 \
>> +        __guest_handle_ ## name;                                \
>> +    typedef union { type *p; uint64_aligned_t q; }              \
>> +        __guest_handle_64_ ## name
>> +
>> +#define __DEFINE_XEN_GUEST_HANDLE(name, type) \
>> +    ___DEFINE_XEN_GUEST_HANDLE(name, type);   \
>> +    ___DEFINE_XEN_GUEST_HANDLE(const_##name, const type)
>> +#define DEFINE_XEN_GUEST_HANDLE(name)   __DEFINE_XEN_GUEST_HANDLE(name, name)
>> +#define __XEN_GUEST_HANDLE(name)        __guest_handle_64_ ## name
>> +#define XEN_GUEST_HANDLE(name)          __XEN_GUEST_HANDLE(name)
>> +#define XEN_GUEST_HANDLE_PARAM(name)    __guest_handle_ ## name
>> +#define set_xen_guest_handle_raw(hnd, val)                  \
>> +    do {                                                    \
>> +        __typeof__(&(hnd)) _sxghr_tmp = &(hnd);             \
> 
> In new code, can you please avoid underscore-prefixed macro locals,
> which violate name space rules set forth by the standard? We appear
> to be adopting underscore-suffixed naming for such locals.

Sure, will fix.

>> +        _sxghr_tmp->q = 0;                                  \
>> +        _sxghr_tmp->p = val;                                \
> 
> "val" need parenthesizing here.

Will fix.

>> +    } while ( 0 )
>> +#define set_xen_guest_handle(hnd, val) set_xen_guest_handle_raw(hnd, val)
>> +
>> +#ifdef __XEN_TOOLS__
>> +#define get_xen_guest_handle(val, hnd)  do { val = (hnd).p; } while (0)
>> +#endif
>> +
>> +typedef uint64_t xen_pfn_t;
>> +#define PRI_xen_pfn PRIx64
>> +#define PRIu_xen_pfn PRIu64
>> +
>> +/*
>> + * Maximum number of virtual CPUs in legacy multi-processor guests.
>> + * Only one. All other VCPUS must use VCPUOP_register_vcpu_info.
>> + */
>> +#define XEN_LEGACY_MAX_VCPUS 1
>> +
>> +typedef uint64_t xen_ulong_t;
>> +#define PRI_xen_ulong PRIx64
>> +#endif
>> +
>> +/*
>> + * Pointers and other address fields inside interface structures are padded to
>> + * 64 bits. This means that field alignments aren't different between 32- and
>> + * 64-bit architectures.
>> + */
>> +/* NB. Multi-level macro ensures __LINE__ is expanded before concatenation. */
>> +#define __MEMORY_PADDING(_X)
>> +#define _MEMORY_PADDING(_X)  __MEMORY_PADDING(_X)
>> +#define MEMORY_PADDING       _MEMORY_PADDING(__LINE__)
> 
> This doesn't parallel anything in other architectures afaics, and it is
> also not used anywhere in this header. What is this about? If it needs
> to stay, it'll need properly moving into XEN_* namespace.

This was another holdover from the old Xen code. I'll remove it.

>> +/* And the trap vector is... */
>> +#define TRAP_INSTR "li 0,-1; sc" /* XXX just "sc"? */
> 
> Same question / remark here.

Ditto, will remove.

> 
>> +#ifndef __ASSEMBLY__
>> +
>> +#define XENCOMM_INLINE_FLAG (1UL << 63)
> 
> Is this an indication that you mean to revive xencomm.h?

No, this was yet another holdover from the old Xen tree. I'll remove it.

>> +typedef uint64_t xen_ulong_t;
>> +
>> +/* User-accessible registers: nost of these need to be saved/restored
>> + * for every nested Xen invocation. */
> 
> Nit: comment style (and s/nost/most/).
>

Will fix.

>> +struct vcpu_guest_core_regs
>> +{
>> +    uint64_t gprs[32];
>> +    uint64_t lr;
>> +    uint64_t ctr;
>> +    uint64_t srr0;
>> +    uint64_t srr1;
>> +    uint64_t pc;
>> +    uint64_t msr;
>> +    uint64_t fpscr;             /* XXX Is this necessary */
>> +    uint64_t xer;
>> +    uint64_t hid4;              /* debug only */
>> +    uint64_t dar;               /* debug only */
>> +    uint32_t dsisr;             /* debug only */
>> +    uint32_t cr;
>> +    uint32_t __pad;             /* good spot for another 32bit reg */
>> +    uint32_t entry_vector;
>> +};
>> +typedef struct vcpu_guest_core_regs vcpu_guest_core_regs_t;
>> +
>> +typedef uint64_t tsc_timestamp_t; /* RDTSC timestamp */ /* XXX timebase */
>> +
>> +/* ONLY used to communicate with dom0! See also struct exec_domain. */
>> +struct vcpu_guest_context {
>> +    vcpu_guest_core_regs_t user_regs;         /* User-level CPU registers     */
>> +    uint64_t sdr1;                     /* Pagetable base               */
>> +    /* XXX etc */
>> +};
>> +typedef struct vcpu_guest_context vcpu_guest_context_t;
>> +DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
>> +
>> +struct arch_shared_info {
>> +    uint64_t boot_timebase;
>> +};
>> +
>> +struct arch_vcpu_info {
>> +};
>> +
>> +struct xen_arch_domainconfig {
>> +};
>> +
>> +typedef struct xen_pmu_arch { uint8_t dummy; } xen_pmu_arch_t;
>> +
>> +/* Support for multi-processor guests. */
>> +#endif
> 
> Stray comment?

Yup, I'll drop it.

>
> Jan

Thanks,
Shawn

