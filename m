Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB9A7FE034
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 20:19:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644159.1004823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8Q4j-0007Td-MJ; Wed, 29 Nov 2023 19:18:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644159.1004823; Wed, 29 Nov 2023 19:18:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8Q4j-0007Qq-Jf; Wed, 29 Nov 2023 19:18:21 +0000
Received: by outflank-mailman (input) for mailman id 644159;
 Wed, 29 Nov 2023 19:18:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s3b2=HK=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1r8Q4h-0007Qk-HX
 for xen-devel@lists.xenproject.org; Wed, 29 Nov 2023 19:18:19 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0cb28efc-8eec-11ee-98e4-6d05b1d4d9a1;
 Wed, 29 Nov 2023 20:18:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 5A9B08285C21;
 Wed, 29 Nov 2023 13:18:16 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id dwlEij6kzSgQ; Wed, 29 Nov 2023 13:18:15 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 008518285C2D;
 Wed, 29 Nov 2023 13:18:14 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id YT8NXt9NpWc0; Wed, 29 Nov 2023 13:18:14 -0600 (CST)
Received: from [10.11.0.3] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 502B58285C21;
 Wed, 29 Nov 2023 13:18:14 -0600 (CST)
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
X-Inumbo-ID: 0cb28efc-8eec-11ee-98e4-6d05b1d4d9a1
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 008518285C2D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1701285495; bh=tKGf3lYcdnayBK81t/8qEZwDaX4NSY3OPcUybDLbS+E=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=FMvgCZn4FDWA1st/qQuLdt04RXV0U/zUb/o9Fe1RR65hLJsIEuihXbfvY/qEWCPA8
	 4/OZ01il/TaFUUa1MPEBCCYyr2oZLpzDAefC2mUdCWHthplmhHmvaaJq6WieWcQvF+
	 W9eiWt8ELHWjxl38XFYs+usLsf1ygmOOQ3as1b2Y=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <4f67d4c0-d90a-4778-800b-87108cd1d3f8@raptorengineering.com>
Date: Wed, 29 Nov 2023 13:18:13 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/14] xen/asm-generic: introduce generic device.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <cover.1701093907.git.oleksii.kurochko@gmail.com>
 <67172a4fbf88833480203fcb1e2c640b6d39a556.1701093907.git.oleksii.kurochko@gmail.com>
 <98023f51-5953-4384-918d-ae726d74ef7c@raptorengineering.com>
 <e29665f849d23a768262c6d1a7436916a7ec887c.camel@gmail.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <e29665f849d23a768262c6d1a7436916a7ec887c.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/29/23 6:49 AM, Oleksii wrote:
> On Tue, 2023-11-28 at 15:28 -0600, Shawn Anastasio wrote:
>> Hi Oleksii,
>>
>> On 11/27/23 8:13 AM, Oleksii Kurochko wrote:
>>> diff --git a/xen/arch/ppc/include/asm/irq.h
>>> b/xen/arch/ppc/include/asm/irq.h
>>> index 5c37d0cf25..49193fddff 100644
>>> --- a/xen/arch/ppc/include/asm/irq.h
>>> +++ b/xen/arch/ppc/include/asm/irq.h
>>> @@ -3,7 +3,9 @@
>>>  #define __ASM_PPC_IRQ_H__
>>>  
>>>  #include <xen/lib.h>
>>> +#ifdef CONFIG_HAS_DEVICE_TREE
>>
>> I realize that you were likely following PPC's device.h which also
>> checks CONFIG_HAS_DEVICE_TREE, but I'm not sure that it makes sense
>> to
>> check this conditional in PPC code at all -- we will always have
>> HAS_DEVICE_TREE (selected by PPC) and I can't imagine a scenario
>> where
>> this will ever not be the case.
> What about case if ACPI is used? Does ACPI is supported by PPC?
> 
> But if you are sure that CONFIG_HAS_DEVICE_TREE will be always selected
> then I am OK to remove this change.
> 

ACPI isn't supported by any PPC platform, we always use device tree.

>>
>> Unless Jan (or someone else) disagrees, I'd rather this conditional
>> be
>> dropped inside of PPC code.
> I'll double check but I think I had a compilation issue if it isn't
> defined.
>

I'm not encountering any issues locally with the conditional dropped,
but if you are able to reproduce them then let me know.

> Thanks.
> 
> ~ Oleksii

Thanks,
Shawn

