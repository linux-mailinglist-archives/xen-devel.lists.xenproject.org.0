Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58AD53B2CBB
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jun 2021 12:44:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.146670.270006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwMqX-00036I-Qk; Thu, 24 Jun 2021 10:44:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146670.270006; Thu, 24 Jun 2021 10:44:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwMqX-00034R-N7; Thu, 24 Jun 2021 10:44:33 +0000
Received: by outflank-mailman (input) for mailman id 146670;
 Thu, 24 Jun 2021 10:44:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lwMqV-000342-R4
 for xen-devel@lists.xenproject.org; Thu, 24 Jun 2021 10:44:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lwMqV-0006U3-1B; Thu, 24 Jun 2021 10:44:31 +0000
Received: from [54.239.6.182] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lwMqU-0000IY-Qq; Thu, 24 Jun 2021 10:44:31 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:References:Cc:To:From:Subject;
	bh=kB/cuO9J71PCSUG1oXEvChtSpefXwEQF0XrHTCKSrpk=; b=1Mvgrb7a6kqClKUsOqSHHHoIAE
	9WYQvJVDjeRzzhdVIxoE9AN28CSba8yvBKBQjngefySqvstCFZvlN0vqdhfCpy13t2c9JrYcc+FRx
	dzPhNX+onGw608QAQjmyRuvi2IL5BSYvC6feBcTBQ3ntBhtUrtjHQgOI0ztaUvSACPho=;
Subject: Re: [PATCH] iommu/arm: ipmmu-vmsa: Add compatible for Renesas R-Car
 M3-W+ SoC
From: Julien Grall <julien@xen.org>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <1623698292-7464-1-git-send-email-olekstysh@gmail.com>
 <36ae57eb-e7ce-8ca9-0f4e-23b9f1b0c0e7@xen.org>
Message-ID: <f63fe592-6ada-2a0f-1b94-2fd6facfd29e@xen.org>
Date: Thu, 24 Jun 2021 12:44:28 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <36ae57eb-e7ce-8ca9-0f4e-23b9f1b0c0e7@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi,

On 22/06/2021 18:43, Julien Grall wrote:
> Hi Oleksandr,
> 
> On 14/06/2021 21:18, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> The "renesas,r8a77961" string identifies M3-W+ (aka M3-W ES3.0)
>> instead of "renesas,r8a7796" since Linux commit:
>> "9c9f7891093b02eb64ca4e1c7ab776a4296c058f soc: renesas: Identify R-Car 
>> M3-W+".
>> Add new compatible to the Xen driver.
>>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Acked-by: Julien Grall <jgrall@amazon.com>

Committed.

Cheers,

> 
> Cheers,
> 
>> ---
>>   xen/drivers/passthrough/arm/ipmmu-vmsa.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c 
>> b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
>> index 8b8e3a0..1255b0d 100644
>> --- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
>> +++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
>> @@ -1316,6 +1316,7 @@ static const struct dt_device_match 
>> ipmmu_dt_match[] __initconst =
>>       DT_MATCH_COMPATIBLE("renesas,ipmmu-r8a7795"),
>>       DT_MATCH_COMPATIBLE("renesas,ipmmu-r8a77965"),
>>       DT_MATCH_COMPATIBLE("renesas,ipmmu-r8a7796"),
>> +    DT_MATCH_COMPATIBLE("renesas,ipmmu-r8a77961"),
>>       { /* sentinel */ },
>>   };
>>
> 

-- 
Julien Grall

