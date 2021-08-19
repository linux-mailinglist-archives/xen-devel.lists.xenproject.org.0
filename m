Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C18243F202D
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 20:50:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169094.308876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGn7k-0004M3-68; Thu, 19 Aug 2021 18:50:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169094.308876; Thu, 19 Aug 2021 18:50:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGn7k-0004J3-2E; Thu, 19 Aug 2021 18:50:44 +0000
Received: by outflank-mailman (input) for mailman id 169094;
 Thu, 19 Aug 2021 18:50:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ErsO=NK=cs.pub.ro=costin.lupu@srs-us1.protection.inumbo.net>)
 id 1mGn7i-0004IV-EV
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 18:50:42 +0000
Received: from mx.upb.ro (unknown [141.85.13.241])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 59ddb5c4-011e-11ec-a652-12813bfff9fa;
 Thu, 19 Aug 2021 18:50:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id B0EF0B5600E2;
 Thu, 19 Aug 2021 21:50:40 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id yMAnOzFgBRrC; Thu, 19 Aug 2021 21:50:37 +0300 (EEST)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id 458F0B56011C;
 Thu, 19 Aug 2021 21:48:52 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id xQFHefCxj5i1; Thu, 19 Aug 2021 21:48:52 +0300 (EEST)
Received: from [192.168.1.35] (unknown [86.121.144.181])
 by mx.upb.ro (Postfix) with ESMTPSA id 427FDB56022F;
 Thu, 19 Aug 2021 21:28:51 +0300 (EEST)
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
X-Inumbo-ID: 59ddb5c4-011e-11ec-a652-12813bfff9fa
X-Virus-Scanned: amavisd-new at upb.ro
Subject: Re: [PATCH 1/4] public: Add page related definitions for accessing
 guests memory
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1628519855.git.costin.lupu@cs.pub.ro>
 <b397d346dcd6243d1957b3e4cfe7a09a6bd1c1b4.1628519855.git.costin.lupu@cs.pub.ro>
 <d92ed571-521e-70f1-af20-1423dbbf4014@suse.com>
From: Costin Lupu <costin.lupu@cs.pub.ro>
Message-ID: <416aeea9-db0e-d730-7e8d-2b2302371714@cs.pub.ro>
Date: Thu, 19 Aug 2021 21:28:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <d92ed571-521e-70f1-af20-1423dbbf4014@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Jan,

Thanks for your comments. I've just sent a v2.

Cheers,
Costin

On 8/10/21 9:41 AM, Jan Beulich wrote:
> On 09.08.2021 16:47, Costin Lupu wrote:
>> These changes introduce the page related definitions needed for mapping and
>> accessing guests memory. These values are intended to be used by any toolstack
>> component that needs to map guests memory. Until now, the values were defined
>> by the xenctrl.h header, therefore whenever a component had to use them it also
>> had to add a dependency for the xenctrl library.
>>
>> For this patch we set the same values for both x86 and ARM architectures.
>>
>> Signed-off-by: Costin Lupu <costin.lupu@cs.pub.ro>
>> ---
>>  xen/include/public/arch-arm/page.h | 34 ++++++++++++++++++++++++++
>>  xen/include/public/arch-x86/page.h | 34 ++++++++++++++++++++++++++
>>  xen/include/public/page.h          | 38 ++++++++++++++++++++++++++++++
>>  3 files changed, 106 insertions(+)
>>  create mode 100644 xen/include/public/arch-arm/page.h
>>  create mode 100644 xen/include/public/arch-x86/page.h
>>  create mode 100644 xen/include/public/page.h
> 
> I'm not convinced of these warranting introduction of new headers, but
> I'm also not meaning to say that I'm strictly opposed. I don't recall
> this aspect having had any consideration, yet.
> 
>> --- /dev/null
>> +++ b/xen/include/public/arch-arm/page.h
>> @@ -0,0 +1,34 @@
>> +/******************************************************************************
>> + * page.h
>> + *
>> + * Page definitions for accessing guests memory on ARM
>> + *
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
>> + *
>> + * Copyright (c) 2021, Costin Lupu
>> + */
>> +
>> +#ifndef __XEN_PUBLIC_ARCH_ARM_PAGE_H__
>> +#define __XEN_PUBLIC_ARCH_ARM_PAGE_H__
>> +
>> +#define XEN_PAGE_SHIFT           12
>> +#define XEN_PAGE_SIZE            (1UL << XEN_PAGE_SHIFT)
>> +#define XEN_PAGE_MASK            (~(XEN_PAGE_SIZE - 1))
> 
> The latter two, being identical ...
> 
>> --- /dev/null
>> +++ b/xen/include/public/arch-x86/page.h
>> @@ -0,0 +1,34 @@
>> +/******************************************************************************
>> + * page.h
>> + *
>> + * Page definitions for accessing guests memory on x86
>> + *
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
>> + *
>> + * Copyright (c) 2021, Costin Lupu
>> + */
>> +
>> +#ifndef __XEN_PUBLIC_ARCH_X86_PAGE_H__
>> +#define __XEN_PUBLIC_ARCH_X86_PAGE_H__
>> +
>> +#define XEN_PAGE_SHIFT           12
>> +#define XEN_PAGE_SIZE            (1UL << XEN_PAGE_SHIFT)
>> +#define XEN_PAGE_MASK            (~(XEN_PAGE_SIZE - 1))
> 
> ... not just for x86, but in general, should imo move ...
> 
>> --- /dev/null
>> +++ b/xen/include/public/page.h
>> @@ -0,0 +1,38 @@
>> +/******************************************************************************
>> + * page.h
>> + *
>> + * Page definitions for accessing guests memory
>> + *
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
>> + *
>> + * Copyright (c) 2021, Costin Lupu
>> + */
>> +
>> +#ifndef __XEN_PUBLIC_PAGE_H__
>> +#define __XEN_PUBLIC_PAGE_H__
>> +
>> +#if defined(__i386__) || defined(__x86_64__)
>> +#include "arch-x86/page.h"
>> +#elif defined (__arm__) || defined (__aarch64__)
>> +#include "arch-arm/page.h"
>> +#else
>> +#error "Unsupported architecture"
>> +#endif
> 
> ... here. I don't think though that 1UL is an appropriate construct
> to use: Imo the smallest type this should evaluate to is xen_ulong_t,
> the constant should also be usable in assembly sources, and it would
> better also suitably sign-extend when used in e.g. XEN_PAGE_MASK.
> 
> Jan
> 
>> +#endif /* __XEN_PUBLIC_PAGE_H__ */
>>
> 

