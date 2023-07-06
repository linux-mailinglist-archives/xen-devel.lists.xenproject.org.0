Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7621174A5CF
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 23:18:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560070.875671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHWLR-0004HY-7K; Thu, 06 Jul 2023 21:16:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560070.875671; Thu, 06 Jul 2023 21:16:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHWLR-0004FK-45; Thu, 06 Jul 2023 21:16:57 +0000
Received: by outflank-mailman (input) for mailman id 560070;
 Thu, 06 Jul 2023 21:16:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qHWLQ-0004FE-2P
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 21:16:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qHWLH-0005Ci-PE; Thu, 06 Jul 2023 21:16:47 +0000
Received: from [54.239.6.185] (helo=[192.168.30.29])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qHWLH-00067N-GZ; Thu, 06 Jul 2023 21:16:47 +0000
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
	bh=vGxvLNh2zcm8SoKqsav3VybWB/G6vNxWOJYJjJjNikg=; b=XVCFyDetj75Oj0s3SDaH8uKqax
	PsITiHDyGgZxBlFB3LS7OG6CrGakqzTsyfsxJxwpOhPXbTMVaXJijop19ddWhvlzgpmplAWXJB2N2
	253CiYj4hsL4R1KxNVdybsrU6Rip7E2gk1OhWhuMC+jTQI3DHnVxSj3zCcNrC7zN0mpg=;
Message-ID: <38817030-c342-c45c-2374-086f565de5ba@xen.org>
Date: Thu, 6 Jul 2023 22:16:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [RFC PATCH] xen/arm: Rebranding dom0less feature
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: George Dunlap <george.dunlap@cloud.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>, P S <pairspace@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Henry Wang <Henry.Wang@arm.com>,
 Community Manager <community.manager@xenproject.org>,
 Doug Goldstein <cardoe@cardoe.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <8601CDD7-87F7-4FD0-A6E6-BAEAB12E7956@arm.com>
 <234199F8-DBB1-42B6-9A4C-8800EEF60997@gmail.com>
 <CA+zSX=Y3_g_aq4+sDK7CuZajywVqQ4xOrq7hKZ80eUT3uSxzuQ@mail.gmail.com>
 <alpine.DEB.2.22.394.2307051436120.761183@ubuntu-linux-20-04-desktop>
 <CA+zSX=ashTi590+cVss_3zyLESC8S=zVSMLjTKD00s6xfjZbJA@mail.gmail.com>
 <A89C2FC7-999E-4FCE-8A05-4F4B86573DBA@arm.com>
 <4aec2aca-e2e6-d9e4-1f73-b5f98245033a@xen.org>
 <4717B214-33FF-4B8B-B213-E6C0767D69C6@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <4717B214-33FF-4B8B-B213-E6C0767D69C6@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 06/07/2023 14:04, Luca Fancellu wrote:
> 
>>>>>
>>>>> The "start VMs from Xen on boot" functionality is the *only* thing that a big chunk of the users of this functionality want;  referring to
>>>>> it as "Hyperlaunch Lite" or "Hyperlaunch -1" will undermine the value of the functionality.
>>>>>
>>>>> What if we use "Measured Hyperlaunch", or "Hyperlaunch Measured Boot" to refer to the full measured boot functionality?
>>>>
>>>> I think this is the best way.
>>>>
>>>>
>>>>> Or, "Hyperlaunch DT" for "Booting VMs from Xen using Device Tree" (without the involvement of a domB), "Hyperlaunch Boot Domain /
>>>>> Hyperlaunch domB" for a more general "domB" functionality, and "Hyperlaunch Measured Boot" for the full functionality (assuming there's
>>>>> more to this than simply having a domB involved)?
>>>>
>>>>
>>>> We need an overarching name to cover the feature "start VMs from Xen on
>>>> boot" on both ARM and x86. From my understanding and from the original
>>>> emails on the subject, the name "hyperlaunch" was it.
>>>>
>>>> Sure; but think "guitar" vs "acoustic guitar" vs "electric guitar".  "Electric guitar" is new, "guitar" covers them both, but you sometimes need a way to specify "acoustic".  Right now target configurations we're talking about include:
>>>>
>>>> 1. Booting all your domains directly from Xen using DT configurations
>>>> 2. Booting a domB, which then executes some more complicated programmatic configuration to launch VMs before disappearing
>>>> 3. Doing full measured boot on the whole system using a domB.
>>>>
>>>> If "Hyperlaunch" means 1-3, we not only need a way to specify that you're talking about 3, but *also* a way to specify that you're talking about 1.  In the vast majority of cases for the foreseeable future are going to be 1.  Additionally, we want to make sure that "Hyperlaunch" *actually* turns out to mean 1-3, and not just 1.
>>>>
>>>> The thing I like about "Hyperlaunch DT" is that to me it sounds pretty cool but also is very descriptive: I haven't talked to people building these systems, but it seems like saying, "The hypervisor launches VMs based on a Device Tree passed to it at boot" will be immediately understood, and stick in people's minds.
>>> Personally, I like the name “Hyperlaunch DT”, because it tells me that we are launching VMs and the DT is involved, if I understood correctly the design,
>>> it would be the same also on x86 (and in every architecture that will come later) so being “Hyperlaunch DT” an arch agnostic name makes it a good
>>> candidate for phase out dom0less name and for the future when a common code will use the DT to launch VMs at Xen boot.
>>
>> I assume that DT means Device-Tree here. If so, I find a name a bit misleading because we are talking about the way to pass the configuration rather than what the feature is doing.
>>
>> My assumption here is that a DomB solution would still use the Device-Tree to describe the domains.
> 
> The sentence below makes sense to me, “DT”, “domB/Boot/Boot Domain/BD”, “Measured Boot/MB” can do the work of distinguish the functionalities, even if the Device tree is involved in all of them.

Throwing another name we discussed today at the pub. How about: 
"Hyperlaunch static"

This would indicate the domains have been statically configured whereas 
I guess the one from DomB may be more dynamic?

-- 
Julien Grall

