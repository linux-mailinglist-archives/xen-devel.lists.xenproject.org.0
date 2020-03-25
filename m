Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF44193026
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2020 19:12:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHATN-0002yw-B5; Wed, 25 Mar 2020 18:09:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pb40=5K=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jHATL-0002yr-An
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2020 18:09:47 +0000
X-Inumbo-ID: cf069148-6ec3-11ea-8689-12813bfff9fa
Received: from mail-ed1-f65.google.com (unknown [209.85.208.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cf069148-6ec3-11ea-8689-12813bfff9fa;
 Wed, 25 Mar 2020 18:09:46 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id e5so3727870edq.5
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2020 11:09:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VC1q3gvs39mz0XugIUWQwCvvYpwjY1qXsdq/q5X52eY=;
 b=hne1bZJU6KS+Dg4ZsNh2GCAp8zXs1oSBRzeW4Ch3By2vHrPPuFMXcRlJRX77UOeLco
 +272umlBsxmSt4+fzZZYaOVta1SPiv6qtZ91YauBeOLl4rEAEafllaLQRSXCYnpoho9z
 6lsYYzpGh+jwIrSIoVI8OhlhQ4ugipIQEzElq9aFDVcZsiSpWbaN+fwvyyne68cSEZa3
 dlWUhxBPpUEZnM/wlHwVBIXYzzJhvKBgyTfMsGq1VRJzMKL342BY9VD1hnFs4IBMWIPR
 tblaTzLc/Wsn58oktBMM81Wvrryl7JqQCmXtWSzhbalJ2IkOgC5w+iGoJlE8NzeN9nSD
 M6zg==
X-Gm-Message-State: ANhLgQ0uvB3KzcE8nOMzTkLwI8pzxOo4ZKhAUYBcjRnH8UZCSS5IhBWv
 6c6HRdMqXJm59OCW05K/dB4=
X-Google-Smtp-Source: ADFU+vuMhInj20VKhdGcgmUIZWmRckdnNo99Z9EjYC92daHqUJtKcyzGpsvPEgIvt4uKq5Y1n32VBA==
X-Received: by 2002:a50:eb4c:: with SMTP id z12mr4172658edp.387.1585159785494; 
 Wed, 25 Mar 2020 11:09:45 -0700 (PDT)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-234.amazon.com.
 [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id y21sm492413edu.48.2020.03.25.11.09.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Mar 2020 11:09:44 -0700 (PDT)
To: Jan Beulich <jbeulich@suse.com>
References: <20200322161418.31606-1-julien@xen.org>
 <20200322161418.31606-4-julien@xen.org>
 <80c98b3e-efa7-66e6-bd47-61bc0560f535@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <993d82aa-9f19-0b27-a562-53f4c9b2a7a4@xen.org>
Date: Wed, 25 Mar 2020 18:09:43 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <80c98b3e-efa7-66e6-bd47-61bc0560f535@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Subject: Re: [Xen-devel] [PATCH 03/17] xen/mm: Move the MM types in a
 separate header
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Jan,

On 25/03/2020 15:00, Jan Beulich wrote:
> On 22.03.2020 17:14, julien@xen.org wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> It is getting incredibly difficult to use typesafe GFN/MFN/PFN in the
>> headers because of circular dependency. For instance, asm-x86/page.h
>> cannot include xen/mm.h.
>>
>> In order to convert more code to use typesafe, the types are now moved
>> in a separate header that requires only a few dependencies.
> 
> We definitely need to do this, so thanks for investing the
> time. I think though that we want to settle up front (and
> perhaps record in a comment in the new header) what is or
> is not suitable to go into the new header. After all you're
> moving not just type definitions, but also simple helper
> functions.

I am expecting headers to use the typesafe helpers (such mfn_add) in the 
long term. So I would like the new header to contain the type 
definitions and any wrappers that would turn 'generic' operations safe.

I am not entirely sure yet how to formalize the rules in the header. Any 
ideas?

> 
>> --- a/xen/include/xen/mm.h
>> +++ b/xen/include/xen/mm.h
>> @@ -1,50 +1,7 @@
>>   /******************************************************************************
>>    * include/xen/mm.h
>>    *
>> - * Definitions for memory pages, frame numbers, addresses, allocations, etc.
>> - *
>>    * Copyright (c) 2002-2006, K A Fraser <keir@xensource.com>
>> - *
>> - *                         +---------------------+
>> - *                          Xen Memory Management
>> - *                         +---------------------+
>> - *
>> - * Xen has to handle many different address spaces.  It is important not to
>> - * get these spaces mixed up.  The following is a consistent terminology which
>> - * should be adhered to.
>> - *
>> - * mfn: Machine Frame Number
>> - *   The values Xen puts into its own pagetables.  This is the host physical
>> - *   memory address space with RAM, MMIO etc.
>> - *
>> - * gfn: Guest Frame Number
>> - *   The values a guest puts in its own pagetables.  For an auto-translated
>> - *   guest (hardware assisted with 2nd stage translation, or shadowed), gfn !=
>> - *   mfn.  For a non-translated guest which is aware of Xen, gfn == mfn.
>> - *
>> - * pfn: Pseudophysical Frame Number
>> - *   A linear idea of a guest physical address space. For an auto-translated
>> - *   guest, pfn == gfn while for a non-translated guest, pfn != gfn.
>> - *
>> - * dfn: Device DMA Frame Number (definitions in include/xen/iommu.h)
>> - *   The linear frame numbers of device DMA address space. All initiators for
>> - *   (i.e. all devices assigned to) a guest share a single DMA address space
>> - *   and, by default, Xen will ensure dfn == pfn.
>> - *
>> - * WARNING: Some of these terms have changed over time while others have been
>> - * used inconsistently, meaning that a lot of existing code does not match the
>> - * definitions above.  New code should use these terms as described here, and
>> - * over time older code should be corrected to be consistent.
>> - *
>> - * An incomplete list of larger work area:
>> - * - Phase out the use of 'pfn' from the x86 pagetable code.  Callers should
>> - *   know explicitly whether they are talking about mfns or gfns.
>> - * - Phase out the use of 'pfn' from the ARM mm code.  A cursory glance
>> - *   suggests that 'mfn' and 'pfn' are currently used interchangeably, where
>> - *   'mfn' is the appropriate term to use.
>> - * - Phase out the use of gpfn/gmfn where pfn/mfn are meant.  This excludes
>> - *   the x86 shadow code, which uses gmfn/smfn pairs with different,
>> - *   documented, meanings.
>>    */
>>   
>>   #ifndef __XEN_MM_H__
>> @@ -54,100 +11,11 @@
>>   #include <xen/types.h>
>>   #include <xen/list.h>
>>   #include <xen/spinlock.h>
>> -#include <xen/typesafe.h>
>>   #include <xen/kernel.h>
>> +#include <xen/mm_types.h>
> 
> Is there anything left in the header here which requires the
> explicit inclusion of xen/kernel.h?

The header was introduced for the sole purpose of the typesafe version 
of the min/max helpers. So it should be possible to drop the include.

I will have a look and remove it if we can.

Cheers,

-- 
Julien Grall

