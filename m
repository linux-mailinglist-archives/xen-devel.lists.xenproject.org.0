Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A32BF29895C
	for <lists+xen-devel@lfdr.de>; Mon, 26 Oct 2020 10:20:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12130.31801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kWyfS-0006R2-PJ; Mon, 26 Oct 2020 09:19:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12130.31801; Mon, 26 Oct 2020 09:19:54 +0000
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
	id 1kWyfS-0006Qg-Ls; Mon, 26 Oct 2020 09:19:54 +0000
Received: by outflank-mailman (input) for mailman id 12130;
 Mon, 26 Oct 2020 09:19:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6Eey=EB=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kWyfR-0006Qa-0Q
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 09:19:53 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ecb3a476-f323-44eb-a5b0-6d249f5651f9;
 Mon, 26 Oct 2020 09:19:51 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kWyfP-0007Wa-Gv; Mon, 26 Oct 2020 09:19:51 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kWyfP-0003V7-8L; Mon, 26 Oct 2020 09:19:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=6Eey=EB=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kWyfR-0006Qa-0Q
	for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 09:19:53 +0000
X-Inumbo-ID: ecb3a476-f323-44eb-a5b0-6d249f5651f9
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id ecb3a476-f323-44eb-a5b0-6d249f5651f9;
	Mon, 26 Oct 2020 09:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=TwqRLlzS+yxeNwh1I7UD8QFuBcRJ1HFGwuFy1gl9RIM=; b=onBis+YKjjNCmETM122acl/iET
	tnYgrOT9FLL/F0YkjiMkz/KnpMdI3UfZRgHGkrpKTv0KUBdrhENx6QVdwYKvLLWp8vK2zTQ/VtQ5z
	hdvPJgWUBRVvtLmOZmU0WzUky/BQlQqrnFX9h7fKxvgMunUqz/YP6yRY5ld5d92ECREM=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kWyfP-0007Wa-Gv; Mon, 26 Oct 2020 09:19:51 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kWyfP-0003V7-8L; Mon, 26 Oct 2020 09:19:51 +0000
Subject: Re: [PATCH] xen/arm: Remove EXPERT dependancy
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Elliott Mitchell <ehem+xen@m5p.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20201022014310.GA70872@mattapan.m5p.com>
 <7bf92deb-b1ba-31b2-0357-2639cd2a1bca@xen.org>
 <alpine.DEB.2.21.2010221403570.12247@sstabellini-ThinkPad-T480s>
 <b4ec906d-ebb6-add9-1bc0-39ab8d588026@xen.org>
 <alpine.DEB.2.21.2010230944090.12247@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <bf3b65d2-2642-f1f6-39f1-2f88433e9901@xen.org>
Date: Mon, 26 Oct 2020 09:19:49 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2010230944090.12247@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 23/10/2020 17:57, Stefano Stabellini wrote:
> On Fri, 23 Oct 2020, Julien Grall wrote:
>> Hi Stefano,
>>
>> On 22/10/2020 22:17, Stefano Stabellini wrote:
>>> On Thu, 22 Oct 2020, Julien Grall wrote:
>>>> On 22/10/2020 02:43, Elliott Mitchell wrote:
>>>>> Linux requires UEFI support to be enabled on ARM64 devices.  While many
>>>>> ARM64 devices lack ACPI, the writing seems to be on the wall of
>>>>> UEFI/ACPI
>>>>> potentially taking over.  Some common devices may need ACPI table
>>>>> support.
>>>>>
>>>>> Presently I think it is worth removing the dependancy on CONFIG_EXPERT.
>>>>
>>>> The idea behind EXPERT is to gate any feature that is not considered to be
>>>> stable/complete enough to be used in production.
>>>
>>> Yes, and from that point of view I don't think we want to remove EXPERT
>>> from ACPI yet. However, the idea of hiding things behind EXPERT works
>>> very well for new esoteric features, something like memory introspection
>>> or memory overcommit.
>>
>> Memaccess is not very new ;).
>>
>>> It does not work well for things that are actually
>>> required to boot on the platform.
>>
>> I am not sure where is the problem. It is easy to select EXPERT from the
>> menuconfig. It also hints the user that the feature may not fully work.
>>
>>>
>>> Typically ACPI systems don't come with device tree at all (RPi4 being an
>>> exception), so users don't really have much of a choice in the matter.
>>
>> And they typically have IOMMUs.
>>
>>>
>>>   From that point of view, it would be better to remove EXPERT from ACPI,
>>> maybe even build ACPI by default, *but* to add a warning at boot saying
>>> something like:
>>>
>>> "ACPI support is experimental. Boot using Device Tree if you can."
>>>
>>>
>>> That would better convey the risks of using ACPI, while at the same time
>>> making it a bit easier for users to boot on their ACPI-only platforms.
>>
>> Right, I agree that this make easier for users to boot Xen on ACPI-only
>> platform. However, based on above, it is easy enough for a developper to
>> rebuild Xen with ACPI and EXPERT enabled.
>>
>> So what sort of users are you targeting?
> 
> Somebody trying Xen for the first time, they might know how to build it
> but they might not know that ACPI is not available by default, and they
> might not know that they need to enable EXPERT in order to get the ACPI
> option in the menu. It is easy to do once you know it is there,
> otherwise one might not know where to look in the menu.

Right, EXPERT can now be enabled using Kconfig. So it is not very 
different from an option Foo has been hidden because the dependency Bar 
has not been selected.

It should be easy enough (if it is not we should fix it) to figure out 
the dependency when searching the option via menuconfig.

> 
> 
>> I am sort of okay to remove EXPERT.
> 
> OK. This would help (even without building it by default) because as you
> go and look at the menu the first time, you'll find ACPI among the
> options right away.

To be honest, this step is probably the easiest in the full process to 
get Xen build and booted on Arm.

I briefly looked at Elliot's v2, and I can't keep thinking that we are 
trying to re-invent EXPERT for ACPI because we think the feature is 
*more* important than any other feature gated by EXPERT.

In fact, all the features behind EXPERT are important. But they have 
been gated by EXPERT because they are not mature enough.

We already moved EXPERT from a command line option to a menuconfig 
option. So it should be easy enough to enable it now. If it still not 
the case, then we should improve it.

But I don't think ACPI is mature enough to deserve a different 
treatment. It would be more useful to get to the stage where ACPI can 
work without any crash/issue first.

> 
> 
>> But I still think building ACPI by default
>> is still wrong because our default .config is meant to be (security)
>> supported. I don't think ACPI can earn this qualification today.
> 
> Certainly we don't want to imply ACPI is security supported. I was
> looking at SUPPORT.md and it is only says:
> 
> """
> EXPERT and DEBUG Kconfig options are not security supported. Other
> Kconfig options are supported, if the related features are marked as
> supported in this document.
> """
> 
> So technically we could enable ACPI in the build by default as ACPI for
> ARM is marked as experimental. However, I can see that it is not a
> great idea to enable by default an unsupported option in the kconfig, so
> from that point of view it might be best to leave ACPI disabled by
> default. Probably the best compromise at this time.
 From my understanding, the goal of EXPERT was to gate such features. 
With your suggestion, it is not clear to me what's the difference 
between "experimental" and option gated by "EXPERT".

Do you mind clarifying?

Cheers,

-- 
Julien Grall

