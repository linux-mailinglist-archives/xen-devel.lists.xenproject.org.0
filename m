Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFD130386F
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 09:56:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74654.134159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4K8U-0002bc-Ei; Tue, 26 Jan 2021 08:55:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74654.134159; Tue, 26 Jan 2021 08:55:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4K8U-0002bG-Bt; Tue, 26 Jan 2021 08:55:42 +0000
Received: by outflank-mailman (input) for mailman id 74654;
 Tue, 26 Jan 2021 08:55:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4K8S-0002bB-II
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 08:55:40 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e05a512f-cc67-4e92-b83c-25ed8e88499a;
 Tue, 26 Jan 2021 08:55:38 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EA345AC4F;
 Tue, 26 Jan 2021 08:55:37 +0000 (UTC)
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
X-Inumbo-ID: e05a512f-cc67-4e92-b83c-25ed8e88499a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611651338; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gDNx/5VFkGWqdF1FKL+hk7NViHmMBn/PXX9LPUt1p8M=;
	b=WpolOfYKSovr6V4tPoD0XTbZfFsvtIxeKJUnYuB9Fvf6MZ5PRi8rGKyQHoxIT/mfl78SnN
	V7G6Q6XsDWiFQ4eDIra8tAj7HyEzdiWctGJo/B4A6fq9l2o/TOwCPEEYT1RW3n11+Zrrj2
	+j1CSZo0EgF55T8b4zNjH3AAL15xl9U=
Subject: Re: [PATCH v10 01/11] docs / include: introduce a new framework for
 'domain context' records
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>
References: <20201008185735.29875-1-paul@xen.org>
 <20201008185735.29875-2-paul@xen.org>
 <4f0b7537-807c-54cc-0c0b-23e30e833f45@suse.com>
 <2f370df1-dba4-ccf5-b06c-ce97916e8858@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <be44c052-eb2f-d596-a255-86d7648ed0d9@suse.com>
Date: Tue, 26 Jan 2021 09:55:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <2f370df1-dba4-ccf5-b06c-ce97916e8858@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 25.01.2021 19:25, Andrew Cooper wrote:
> On 19/10/2020 14:46, Jan Beulich wrote:
>> On 08.10.2020 20:57, Paul Durrant wrote:
>>> --- /dev/null
>>> +++ b/xen/include/public/save.h
>>> @@ -0,0 +1,66 @@
>>> +/*
>>> + * save.h
>>> + *
>>> + * Structure definitions for common PV/HVM domain state that is held by Xen.
>>> + *
>>> + * Copyright Amazon.com Inc. or its affiliates.
>>> + *
>>> + * Permission is hereby granted, free of charge, to any person obtaining a copy
>>> + * of this software and associated documentation files (the "Software"), to
>>> + * deal in the Software without restriction, including without limitation the
>>> + * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
>>> + * sell copies of the Software, and to permit persons to whom the Software is
>>> + * furnished to do so, subject to the following conditions:
>>> + *
>>> + * The above copyright notice and this permission notice shall be included in
>>> + * all copies or substantial portions of the Software.
>>> + *
>>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
>>> + * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
>>> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
>>> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
>>> + * DEALINGS IN THE SOFTWARE.
>>> + */
>>> +
>>> +#ifndef XEN_PUBLIC_SAVE_H
>>> +#define XEN_PUBLIC_SAVE_H
>>> +
>>> +#if defined(__XEN__) || defined(__XEN_TOOLS__)
>>> +
>>> +#include "xen.h"
>>> +
>>> +/*
>>> + * C structures for the Domain Context v1 format.
>>> + * See docs/specs/domain-context.md
>>> + */
>>> +
>>> +struct domain_context_record {
>>> +    uint32_t type;
>>> +    uint32_t instance;
>>> +    uint64_t length;
>> Should this be uint64_aligned_t, such that alignof() will
>> produce consistent values regardless of bitness of the invoking
>> domain?
> 
> Does it matter?  Its just a bitstream, and can appear in the migration
> fd at any arbitrary alignment.
> 
> What matters is that the structure is aligned appropriately for the
> bitness of code operating on these fields.
> 
> Even with the tools ABI fixed to allow a 32-on-64-on-64  toolstack to
> function, I'm not sure that excess alignment would be appropriate.  Sure
> - it would be more efficient for 32bit code to align to the 8 byte
> boundary for the benefit of a 64bit Xen's copy_from_user(), but this
> alignment happens anyway because of how hypercall buffers work.

It _probably_ doesn't matter (hence me having put this as a
question), but a struct in the ABI doesn't mandate how it is
going to be used. I don't expect this to become the (or part
of an) argument to a hypercall. I also don't expect anyone
needing to use alignof() on it. But by not following the
common model for the tools-only parts of the public
interface we'd outright exclude such uses down the road.

Jan

