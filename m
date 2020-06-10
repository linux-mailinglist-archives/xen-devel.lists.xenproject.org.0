Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1161F5540
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2020 14:59:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jj0Ja-00060a-3O; Wed, 10 Jun 2020 12:58:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Pg3b=7X=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jj0JZ-00060V-31
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2020 12:58:45 +0000
X-Inumbo-ID: 1db3337c-ab1a-11ea-b42f-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1db3337c-ab1a-11ea-b42f-12813bfff9fa;
 Wed, 10 Jun 2020 12:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ypaabz3MyQhwB1jtzoYnE928VskRiyBmbBymtak8xno=; b=3buah2BdDn2fczthROP/3iblx0
 zH+5dGqhhZroS+J9n/P89MqS/M4M/TFwK3+CAIUL3Armx17g6rykWY+II7TOL1w11FLsUio9nzbEK
 m7RIeS8etkjBkgjHYcUwekIpl/XMbJGnFCKjCgry1/00T4LoEs04Wk1SCcXN1Ema2d3k=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jj0JY-0007Hx-4Y; Wed, 10 Jun 2020 12:58:44 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jj0JX-0006iQ-UO; Wed, 10 Jun 2020 12:58:44 +0000
Subject: Re: Keystone Issue
To: CodeWiz2280 <codewiz2280@gmail.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <CALYbLDiNtHZusupf8=yhKtw1EA7HjMP3o3+WGdv9Omv9v8yVHg@mail.gmail.com>
 <77006AAF-BC3B-4C6E-BDFC-577CF87DE64E@arm.com>
 <CALYbLDheT8jWSAqJJZvvjzWGvygJaJ6UG7ejgpLLYeQB-tCsJA@mail.gmail.com>
 <CALYbLDjZu-YzqZPjCk785=4hpd3BRsoXeotd3ygESD_Ezm63Yg@mail.gmail.com>
 <99E77330-049F-4471-ABF9-13F9AB4E95B5@arm.com>
 <CALYbLDizxgaXJzhNVeKVZ6q-Hbttm1T+ZPP7f-1PDvi49VFOjA@mail.gmail.com>
 <alpine.DEB.2.21.2006080911500.2815@sstabellini-ThinkPad-T480s>
 <CALYbLDh8F0JuGmRY0C1Nhp_b4FP041KMa14pOmyoSBtHcz=A2A@mail.gmail.com>
 <363A05E0-61C6-4AE4-9C84-EEAC466989D8@arm.com>
 <b28cbead-c7ce-7848-4e21-109a022e64da@xen.org>
 <03607739-A4FF-486A-899A-F5F36870225A@arm.com>
 <2ec6255c-9d28-92e7-bd0a-59edb9fc078a@xen.org>
 <6033f9cecbf10f50f4a713ce52105426@kernel.org>
 <32FA85C2-7685-49D2-875B-9FA1C138C92A@arm.com>
 <d16faf89f25a6183bc6cbdc6148af4b4@kernel.org>
 <5C2DB5F7-832E-4B02-A99A-8B5C7CEC7645@arm.com>
 <CALYbLDiYPmcetVh3XDf=qgo+gLHAM-VhU4xKP2jKd51H3RKgVA@mail.gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <8afa2936-69c7-c481-fdf5-e578582c15e2@xen.org>
Date: Wed, 10 Jun 2020 13:58:41 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CALYbLDiYPmcetVh3XDf=qgo+gLHAM-VhU4xKP2jKd51H3RKgVA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Marc Zyngier <maz@kernel.org>, nd <nd@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 10/06/2020 13:39, CodeWiz2280 wrote:
>>>> So the only way to solve this is actually to do the interrupt
>>>> deactivate inside Xen (using a maintenance interrupt).
>>>
>>> That's a terrible hack, and one that would encourage badly integrated HW.
>>> I appreciate the need to "make things work", but I'd be wary of putting
>>> this in released SW. Broken HW must die. I have written more than my share
>>> of these terrible hacks (see TX1 support), and I deeply regret it, as
>>> it has only given Si vendors an excuse not to fix things.
>>
>> Fully agree and I also had to do some hacks for the TX1 ;-)
>>
>>>
>>>> I remember that I also had to do something specific for the
>>>> configuration of edge/level and priorities to have an almost proper
>>>> behaviour.
>>>
>>> Well, the moment the GIC observes secure accesses when they should be
>>> non-secure, all bets are off and you have to resort to the above hacks.
>>> The fun part is that if you have secure SW running on this platform,
>>> you can probably DoS it from non-secure. It's good, isn't it?
>>
>> Definitely is but if I remember correctly they have 2 kind of SoC: one that can be only used in non-secure and an other which is meant to be use with secure and non secure.
>>
>> Bertrand
>>
>>>
>>>> Sadly I have no access to the code anymore, so I would need to guess
>>>> back what that was..
>>>
>>> I'd say this *is* a good thing.
> The problem is that a hack may be my only solution to getting this
> working on this platform.  If TI says that they don't support it then
> i'm stuck.

OOI, what's your end goal for Xen on Keystone?

Cheers,

-- 
Julien Grall

