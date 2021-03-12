Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5DB33944C
	for <lists+xen-devel@lfdr.de>; Fri, 12 Mar 2021 18:09:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.97264.184719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKlHn-0002sm-VK; Fri, 12 Mar 2021 17:09:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 97264.184719; Fri, 12 Mar 2021 17:09:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKlHn-0002sN-S3; Fri, 12 Mar 2021 17:09:15 +0000
Received: by outflank-mailman (input) for mailman id 97264;
 Fri, 12 Mar 2021 17:09:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F/Rg=IK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lKlHm-0002sI-Mg
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 17:09:14 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 52e8bb95-f68d-47d6-8f96-cf68e8a10ec6;
 Fri, 12 Mar 2021 17:09:13 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BE87DAF4D;
 Fri, 12 Mar 2021 17:09:12 +0000 (UTC)
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
X-Inumbo-ID: 52e8bb95-f68d-47d6-8f96-cf68e8a10ec6
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615568952; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vw9vlbcIxDvZFDSO3qxsyXQsarWP/6D8iLVj5PTnuSc=;
	b=P9Dv19Ahfoo6UePhZeclE36VMD8hzQawnnZAzNuWJf+cT4cMqFZurIm/tzHl0ccwUwN0v/
	2VuwSvOJM5vHs77bGRxFnjMi0dYrF4R54hjOKgmCNVlD6CLNNNe3YVkfe+inp1XKrcFWZ1
	oKdsj8x2g4B2OS1ixC0gv0w/c9DL8uk=
Subject: Re: [PATCH for-next 5/6] xen: Add files needed for minimal riscv
 build
To: Connor Davis <connojdavis@gmail.com>
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <cover.1614265718.git.connojdavis@gmail.com>
 <7652ce3486c026a3a9f7d850170ea81ba8a18bdb.1614265718.git.connojdavis@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <84f490e8-7035-565d-4b20-6e46ccc800f2@suse.com>
Date: Fri, 12 Mar 2021 18:09:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <7652ce3486c026a3a9f7d850170ea81ba8a18bdb.1614265718.git.connojdavis@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 25.02.2021 16:24, Connor Davis wrote:
> --- /dev/null
> +++ b/xen/include/public/arch-riscv.h
> @@ -0,0 +1,183 @@
> +/******************************************************************************
> + * arch-riscv.h
> + *
> + * Guest OS interface to RISC-V Xen.
> + * Initially based on the ARM implementation
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to
> + * deal in the Software without restriction, including without limitation the
> + * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
> + * sell copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
> + * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> + * DEALINGS IN THE SOFTWARE.
> + *
> + * Copyright 2019 (C) Alistair Francis <alistair.francis@wdc.com>
> + */
> +
> +#ifndef __XEN_PUBLIC_ARCH_RISCV_H__
> +#define __XEN_PUBLIC_ARCH_RISCV_H__
> +
> +#include <xen/types.h>
> +
> +#define  int64_aligned_t  int64_t __attribute__((aligned(8)))
> +#define uint64_aligned_t uint64_t __attribute__((aligned(8)))
> +
> +#ifndef __ASSEMBLY__
> +#define ___DEFINE_XEN_GUEST_HANDLE(name, type)                  \
> +    typedef union { type *p; unsigned long q; }                 \
> +        __guest_handle_ ## name;                                \
> +    typedef union { type *p; uint64_aligned_t q; }              \
> +        __guest_handle_64_ ## name
> +
> +/*
> + * XEN_GUEST_HANDLE represents a guest pointer, when passed as a field
> + * in a struct in memory. On rv64 it is 8 bytes long and 8-byte aligned.
> + *
> + * XEN_GUEST_HANDLE_PARAM represents a guest pointer, when passed as a
> + * hypercall argument. It is 4 bytes on rv32 and 8 bytes on rv64.
> + */
> +#define __DEFINE_XEN_GUEST_HANDLE(name, type) \
> +    ___DEFINE_XEN_GUEST_HANDLE(name, type);   \
> +    ___DEFINE_XEN_GUEST_HANDLE(const_##name, const type)
> +#define DEFINE_XEN_GUEST_HANDLE(name)   __DEFINE_XEN_GUEST_HANDLE(name, name)
> +#define __XEN_GUEST_HANDLE(name)        __guest_handle_64_ ## name
> +#define XEN_GUEST_HANDLE(name)          __XEN_GUEST_HANDLE(name)
> +#define XEN_GUEST_HANDLE_PARAM(name)    __guest_handle_ ## name
> +#define set_xen_guest_handle_raw(hnd, val)                  \
> +    do {                                                    \
> +        typeof(&(hnd)) _sxghr_tmp = &(hnd);                 \
> +        _sxghr_tmp->q = 0;                                  \
> +        _sxghr_tmp->p = val;                                \
> +    } while ( 0 )
> +#define set_xen_guest_handle(hnd, val) set_xen_guest_handle_raw(hnd, val)
> +
> +#if defined(__GNUC__) && !defined(__STRICT_ANSI__)
> +/* Anonymous union includes both 32- and 64-bit names (e.g., r0/x0). */
> +# define __DECL_REG(n64, n32) union {          \
> +        uint64_t n64;                          \
> +        uint32_t n32;                          \
> +    }
> +#else
> +/* Non-gcc sources must always use the proper 64-bit name (e.g., x0). */
> +#define __DECL_REG(n64, n32) uint64_t n64
> +#endif
> +
> +struct vcpu_guest_core_regs
> +{
> +    unsigned long zero;
> +    unsigned long ra;
> +    unsigned long sp;
> +    unsigned long gp;
> +    unsigned long tp;
> +    unsigned long t0;
> +    unsigned long t1;
> +    unsigned long t2;
> +    unsigned long s0;
> +    unsigned long s1;
> +    unsigned long a0;
> +    unsigned long a1;
> +    unsigned long a2;
> +    unsigned long a3;
> +    unsigned long a4;
> +    unsigned long a5;
> +    unsigned long a6;
> +    unsigned long a7;
> +    unsigned long s2;
> +    unsigned long s3;
> +    unsigned long s4;
> +    unsigned long s5;
> +    unsigned long s6;
> +    unsigned long s7;
> +    unsigned long s8;
> +    unsigned long s9;
> +    unsigned long s10;
> +    unsigned long s11;
> +    unsigned long t3;
> +    unsigned long t4;
> +    unsigned long t5;
> +    unsigned long t6;

Please avoid use of "unsigned long" in the public headers. Consumers,
potentially even cross-bitness or cross-arch ones, may have a different
view on what unsigned long is. uint<N>_t wants using here, and if you
mean to abstract 32-bit and 64-bit right away, then something like a
register_t typedef may want introducing.

Also iirc all the integer registers can also be referred to as x<N>,
in which case it might be nice to allow for both names (in a union).
You have a __DECL_REG() further up, but you don't appear to be using
it ...

> --- a/xen/include/public/hvm/save.h
> +++ b/xen/include/public/hvm/save.h
> @@ -106,6 +106,8 @@ DECLARE_HVM_SAVE_TYPE(END, 0, struct hvm_save_end);
>  #include "../arch-x86/hvm/save.h"
>  #elif defined(__arm__) || defined(__aarch64__)
>  #include "../arch-arm/hvm/save.h"
> +#elif defined(__riscv)
> +#include "../arch-riscv/hvm/save.h"

Does the compiler not also provide __riscv__? If it does, using it
here (and elsewhere) would fit better with the existing logic.

Jan

