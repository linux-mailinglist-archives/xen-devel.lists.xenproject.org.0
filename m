Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C678C3F2B37
	for <lists+xen-devel@lfdr.de>; Fri, 20 Aug 2021 13:29:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169443.309527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH2hi-0001fZ-DY; Fri, 20 Aug 2021 11:28:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169443.309527; Fri, 20 Aug 2021 11:28:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH2hi-0001dY-9h; Fri, 20 Aug 2021 11:28:54 +0000
Received: by outflank-mailman (input) for mailman id 169443;
 Fri, 20 Aug 2021 11:28:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mH2hg-0001dS-JJ
 for xen-devel@lists.xenproject.org; Fri, 20 Aug 2021 11:28:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mH2hg-0000ec-AH; Fri, 20 Aug 2021 11:28:52 +0000
Received: from [54.239.6.178] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mH2hg-0007E9-4W; Fri, 20 Aug 2021 11:28:52 +0000
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
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=FmHYeanjJaz1BIVHvS12jEYNuY36ZBm44NOpDlbAIqI=; b=4cckuUcHL4RpLYNsNQvN/phcQ+
	EVFAGiaVyyJcaL76aYR8TkwJtlXRcFDbUxCu/pKSp4esAxWNZgq6hmT8O9PTFQsbOFE8QDm5um0EP
	QWPQrmRntA56cqR0E8QkBy4LkZQRroMVPdCq1z7ZJFzCXQB3m/MclOSxImGYDsF1wf1Y=;
Subject: Re: [XEN RFC PATCH 17/40] xen/arm: Introduce DEVICE_TREE_NUMA Kconfig
 for arm64
To: Wei Chen <Wei.Chen@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-18-wei.chen@arm.com>
 <1fbcb8a6-67b6-e2d6-6524-cfce7a8a6557@xen.org>
 <DB9PR08MB68571FFA0E971E3A60C588EA9EC19@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <fe477382-c078-9647-49f8-ef40a9e20b50@xen.org>
 <DB9PR08MB6857E4371D0E31C65E952C0E9EC19@DB9PR08MB6857.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
Message-ID: <00d536c1-311c-3f66-c0d2-6bdcc5f1d794@xen.org>
Date: Fri, 20 Aug 2021 12:28:50 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <DB9PR08MB6857E4371D0E31C65E952C0E9EC19@DB9PR08MB6857.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 20/08/2021 11:49, Wei Chen wrote:
> Hi Julien,

Hi Wei,

> 
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: 2021年8月20日 16:41
>> To: Wei Chen <Wei.Chen@arm.com>; xen-devel@lists.xenproject.org;
>> sstabellini@kernel.org; jbeulich@suse.com
>> Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>
>> Subject: Re: [XEN RFC PATCH 17/40] xen/arm: Introduce DEVICE_TREE_NUMA
>> Kconfig for arm64
>>
>> On 20/08/2021 03:30, Wei Chen wrote:
>>> Hi Julien,
>>
>> Hi Wei,
>>
>>>> -----Original Message-----
>>>> From: Julien Grall <julien@xen.org>
>>>> Sent: 2021年8月19日 21:38
>>>> To: Wei Chen <Wei.Chen@arm.com>; xen-devel@lists.xenproject.org;
>>>> sstabellini@kernel.org; jbeulich@suse.com
>>>> Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>
>>>> Subject: Re: [XEN RFC PATCH 17/40] xen/arm: Introduce DEVICE_TREE_NUMA
>>>> Kconfig for arm64
>>>>
>>>> Hi,
>>>>
>>>> On 11/08/2021 11:24, Wei Chen wrote:
>>>>> We need a Kconfig option to distinguish with ACPI based
>>>>> NUMA. So we introduce the new Kconfig option:
>>>>> DEVICE_TREE_NUMA in this patch for Arm64.
>>>>>
>>>>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>>>>> ---
>>>>>     xen/arch/arm/Kconfig | 10 ++++++++++
>>>>>     1 file changed, 10 insertions(+)
>>>>>
>>>>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>>>>> index ecfa6822e4..678cc98ea3 100644
>>>>> --- a/xen/arch/arm/Kconfig
>>>>> +++ b/xen/arch/arm/Kconfig
>>>>> @@ -33,6 +33,16 @@ config ACPI
>>>>>     	  Advanced Configuration and Power Interface (ACPI) support
>> for Xen
>>>> is
>>>>>     	  an alternative to device tree on ARM64.
>>>>>
>>>>> +config DEVICE_TREE_NUMA
>>>>
>>>> The name suggests that NUMA should only be enabled for Device-Tree...
>>>> But the description looks generic.
>>>>
>>>> However, I think the user should only have the choice to say whether
>>>> they want NUMA to be enabled or not. We should not give them the choice
>>>> to enable/disable the parsing for DT/ACPI.
>>>>
>>>> So we should have a generic config that will then select DT (and ACPI
>> in
>>>> the future).
>>>>
>>>
>>> How about we select DT_NUMA default on Arm64. And DT_NUMA select NUMA
>>> like what we have done in patch#6 in x86? And remove the description?
>> I would rather not make NUMA supported by default on Arm64. Instead, we
>> should go throught the same process as other new features and gate it
>> behind UNSUPPORTED until it is mature enough.
>>
> 
> Ok. I agree with this.
> 
>>>
>>> If we make generic NUMA as a selectable option, and depends on
>>> NUMA to select DT or ACPI NUMA. It seems to be quite different from
>>> the existing logic?
>>
>> I am a bit confused. You added just logic to select NUMA from ACPI,
>> right? So are you talking about a different logic?
>>
> 
> No, I didn't want a different one. I thought you wanted it that way.
> Obviously, I mis-understanded your comments.
> 
> Can I understand your previous comments like following:
> 1. We should have a generic config that will then select DT and ACPI:
>     Because we already have CONFIG_NUMA in common layer. So we need to
>     add another one for Arm like CONFIG_ARM_NUMA?

I think so.

>     And in this option, we can select CONFIG_DEVICE_TREE_NUMA
>     automatically if device tree is enabled. If CONFIG_ACPI
>     is enabled, we will select CONFIG_ACPI_NUMA too (in the
>     future)
>     In Xen code, DT_NUMA and ACPI_NUMA code can co-exist, Xen

Distributions should not have to build a different Xen for DT and ACPI. 
So it is more they *must* co-exist.

>     will check the system ACPI support status to decide to use
>     DT_NUMA or ACPI_NUMA?

Yes. A user should only have to say "I want to use NUMA". This is Xen to 
figure out whether we need to compile the support for DT and/or ACPI.

Once we have support for APCI, it doesn't make a lot of sense for the 
users to say "I want to compile with DT and ACPI but I only want NUMA 
when using DT".

Cheers,

-- 
Julien Grall

