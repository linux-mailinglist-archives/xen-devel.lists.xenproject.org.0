Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9800628E523
	for <lists+xen-devel@lfdr.de>; Wed, 14 Oct 2020 19:13:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6920.18099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSkKv-0001i8-2s; Wed, 14 Oct 2020 17:13:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6920.18099; Wed, 14 Oct 2020 17:13:13 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSkKu-0001hj-Vn; Wed, 14 Oct 2020 17:13:12 +0000
Received: by outflank-mailman (input) for mailman id 6920;
 Wed, 14 Oct 2020 17:13:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MeL6=DV=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kSkKs-0001he-Nf
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 17:13:10 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 12e80ea1-d492-49f0-9274-195e11de360d;
 Wed, 14 Oct 2020 17:13:09 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kSkKq-0002Dj-1M; Wed, 14 Oct 2020 17:13:08 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kSkKp-0008UZ-Ob; Wed, 14 Oct 2020 17:13:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=MeL6=DV=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kSkKs-0001he-Nf
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 17:13:10 +0000
X-Inumbo-ID: 12e80ea1-d492-49f0-9274-195e11de360d
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 12e80ea1-d492-49f0-9274-195e11de360d;
	Wed, 14 Oct 2020 17:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=asYEsBCK7FHR113gjIQRyzHFSpY0wsQypVEj1ka1RUk=; b=BM7COcwL6CQGYYFLVwr85Mz3O4
	HhXiezYeDaVjHEGKyvQ7S6amyO0+/RWqsYIt9KR0Ho7ABnOnyAf1mYDXSsWOFOWr6AbrJATJvHWp3
	lm8iHsUJynBFGUXdsxfLGfzzuaoooUo4SiMN5SBG4q7ynDpzQ1fM4bNIGM0qwutEIDGo=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kSkKq-0002Dj-1M; Wed, 14 Oct 2020 17:13:08 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kSkKp-0008UZ-Ob; Wed, 14 Oct 2020 17:13:07 +0000
Subject: Re: [PATCH] xen/arm: Warn user on cpu errata 832075
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <f11fe960a111530501fd0c20893bec4e32edf3cb.1602671985.git.bertrand.marquis@arm.com>
 <26742825-25fc-0f82-2b20-d536e8380b2a@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <53a6355c-b01c-f1a4-72dd-ea84b00bbd49@xen.org>
Date: Wed, 14 Oct 2020 18:13:05 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <26742825-25fc-0f82-2b20-d536e8380b2a@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Andrew,

On 14/10/2020 12:35, Andrew Cooper wrote:
> On 14/10/2020 11:41, Bertrand Marquis wrote:
>> When a Cortex A57 processor is affected by CPU errata 832075, a guest
>> not implementing the workaround for it could deadlock the system.
>> Add a warning during boot informing the user that only trusted guests
>> should be executed on the system.
>> An equivalent warning is already given to the user by KVM on cores
>> affected by this errata.
>>
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> ---
>>   xen/arch/arm/cpuerrata.c | 21 +++++++++++++++++++++
>>   1 file changed, 21 insertions(+)
>>
>> diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
>> index 6c09017515..8f9ab6dde1 100644
>> --- a/xen/arch/arm/cpuerrata.c
>> +++ b/xen/arch/arm/cpuerrata.c
>> @@ -240,6 +240,26 @@ static int enable_ic_inv_hardening(void *data)
>>   
>>   #endif
>>   
>> +#ifdef CONFIG_ARM64_ERRATUM_832075
>> +
>> +static int warn_device_load_acquire_errata(void *data)
>> +{
>> +    static bool warned = false;
>> +
>> +    if ( !warned )
>> +    {
>> +        warning_add("This CPU is affected by the errata 832075.\n"
>> +                    "Guests without required CPU erratum workarounds\n"
>> +                    "can deadlock the system!\n"
>> +                    "Only trusted guests should be used on this system.\n");
>> +        warned = true;
> 
> This is an antipattern, which probably wants fixing elsewhere as well.
> 
> warning_add() is __init.  It's not legitimate to call from a non-init
> function, and a less useless build system would have modpost to object.

You are right. We didn't spot any issue because CPU hotplug is not yet 
supported on Arm.

> 
> The ARM_SMCCC_ARCH_WORKAROUND_1 instance asserts based on system state,
> but this provides no safety at all.

Right.

> 
> 
> What warning_add() actually does is queue messages for some point near
> the end of boot.  It's not clear that this is even a clever thing to do.

Well, the goal is to have a single place where you can find out what are 
all the inconsistencies on the platform. It can be difficult to figure 
that out with...

> 
> I'm very tempted to suggest a blanket change to printk_once().

A simple printk. But I guess we could add a wrapper that would add all a 
line of **** before and after to make easier to spot.

Cheers,

-- 
Julien Grall

