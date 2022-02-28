Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C064C6E41
	for <lists+xen-devel@lfdr.de>; Mon, 28 Feb 2022 14:31:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280558.478537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOg7a-0007ZI-6P; Mon, 28 Feb 2022 13:31:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280558.478537; Mon, 28 Feb 2022 13:31:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOg7a-0007WK-3O; Mon, 28 Feb 2022 13:31:26 +0000
Received: by outflank-mailman (input) for mailman id 280558;
 Mon, 28 Feb 2022 13:31:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nOg7Y-0007WE-KX
 for xen-devel@lists.xenproject.org; Mon, 28 Feb 2022 13:31:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nOg7Y-00060P-9f; Mon, 28 Feb 2022 13:31:24 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=[192.168.13.237]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nOg7Y-0003bH-3V; Mon, 28 Feb 2022 13:31:24 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=s/saPo8nAz1LL8LB1pQKEjNTvNJRdkcwepnM+DS8WZo=; b=HRYXWdZodSB5eX5oxW5KdYtun1
	hzHy8q+6LoDTLjWJidmNos+9gcGkWOSbOyjBgSHY0Q5SCOCJ9/Ofx3p+Z0DdBpv3xdKE+zM1UXqQ+
	6HHWuzUCbFHhAbXVvn1PgYC0qADDDjnDPQ4zgi9hZ6QeTxnmXceAKhJnkXIG1ih6PNSw=;
Message-ID: <3ad80c26-e093-f20e-4172-44368d918566@xen.org>
Date: Mon, 28 Feb 2022 13:31:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH] xen/arm32: head: Update the documentation for register
 r12
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220228101150.63816-1-julien@xen.org>
 <e9397250-3d68-d6e6-d95f-93d239fc2ef5@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <e9397250-3d68-d6e6-d95f-93d239fc2ef5@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 28/02/2022 13:04, Michal Orzel wrote:
> Hi Julien,

Hi Michal,

Thank you for the review.

> 
> On 28.02.2022 11:11, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Since commit 54c4ae18d158 ("xen/arm32: head: Rework and document
>> launch()"), the boot code is not using the register r12.
>>
>> So update the documentation to show r12 has no specific purpose.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>> ---
>>   xen/arch/arm/arm32/head.S | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
>> index 13cfc837d39c..78274a1c034f 100644
>> --- a/xen/arch/arm/arm32/head.S
>> +++ b/xen/arch/arm/arm32/head.S
>> @@ -79,7 +79,7 @@
>>    *   r9  - paddr(start)
>>    *   r10 - phys offset
>>    *   r11 - UART address
>> - *   r12 - is_secondary_cpu
>> + *   r12 -
>>    *   r13 - SP
>>    *   r14 - LR
>>    *   r15 - PC
>>
> 
> FWICS, there are still 2 instructions in this file assigning #0 or #1 to r12 and each of them
> has a comment "/* r12 := is_secondary_cpu */". >
> So I have 2 questions:
> 1. Do we even need these instructions? (I do not think so)

We don't need them. I will drop them and respin the patch.

Cheers,

-- 
Julien Grall

