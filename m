Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 677B06E5F5C
	for <lists+xen-devel@lfdr.de>; Tue, 18 Apr 2023 13:09:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522755.812327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pojDB-0002ii-7S; Tue, 18 Apr 2023 11:09:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522755.812327; Tue, 18 Apr 2023 11:09:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pojDB-0002fq-1o; Tue, 18 Apr 2023 11:09:25 +0000
Received: by outflank-mailman (input) for mailman id 522755;
 Tue, 18 Apr 2023 11:09:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pojD9-0002fk-Jy
 for xen-devel@lists.xenproject.org; Tue, 18 Apr 2023 11:09:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pojD9-0002KQ-0P; Tue, 18 Apr 2023 11:09:23 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.26.51]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pojD8-0003Bm-Ql; Tue, 18 Apr 2023 11:09:22 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Cc:
	References:To:Subject:MIME-Version:Date:Message-ID;
	bh=KMIVDdkVie5RqyZErClAY/QTxpxyjPi6ztY4PyqW7zY=; b=jr8wPqVwALu3BByITVYGWvNvbG
	gRGuYTpcvYINiNxbexjyWJbJ2D7S7qdv8q9yVuh5F5hOVIaQ6NOfycBBfS/Mb/jW3YBOG1z3z4q6o
	uWv8O0y/SVHmBg6T6gyg/kQ9pG6YmO2IYf64Ql5qNGw9+c3VPF5sYRj1VLhQg3mql2cI=;
Message-ID: <64326e46-096e-0f86-2aa9-31a72d3cd004@xen.org>
Date: Tue, 18 Apr 2023 12:09:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: xen cache colors in ARM
Content-Language: en-US
To: Oleg Nikitenko <oleshiiwood@gmail.com>
References: <CA+SAi2uwrKFYN1tkYJ1_LVC-f+b-xb46RWTUv6wDOUO41yx8zg@mail.gmail.com>
 <bad09a6f-d41e-ab8e-2291-7fde3b646710@xen.org>
 <CA+SAi2uPZ=Dq1GxF9Kj1zCO=nbb55ruVG31kH-TgdpR6bLznvA@mail.gmail.com>
 <CA+SAi2s4WLiMEVa3u8rJRNZDpCpLTvnDygpObSUKxau-Q8dfyA@mail.gmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Carlo Nonato <carlo.nonato@minervasys.tech>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CA+SAi2s4WLiMEVa3u8rJRNZDpCpLTvnDygpObSUKxau-Q8dfyA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

I have added back xen-devel and the others. Please reply to all, so they 
can have the full conversation.

On 18/04/2023 11:13, Oleg Nikitenko wrote:
>> HW
> Board: Xilinx ZynqMP
>> Where are the banks located?
> 
>> Where are the banks located?
> I did not catch this question. Could you rephrase it ?

I am referring to the memory bank. But you provided the board, so we 
should be able to infer them.

> 
>> Where do you load the various modules (e.g. kernel, xen...)?
> BOOTMOD_XEN,
> BOOTMOD_FDT,
> BOOTMOD_KERNEL

At which address do you load them? What are there size?

> 
> Should I use another branch ?
> If yes then which one ?

I don't know which branch would work on Xilinx ZynqMP with cache 
coloring (although I would assume that upstream + the series on the ML 
[1] work).


 > A company's active branch is xlnx_rebase_4.16.

The branch you pointed out is not directly maintained by Xen Project and 
from what you wrote below there are some differences with upstream. So 
it would be best if you speak directly with Xilinx/AMD. Stefano in CC 
should be able to assist you.

Cheers,

> 
> Regards,
> Oleg
> 
> вт, 18 апр. 2023 г. в 12:31, Oleg Nikitenko <oleshiiwood@gmail.com>:
> 
>> Hi Julien,
>>
>> Thanks for the answer.
>>
>> A company's active branch is xlnx_rebase_4.16.
>> There are added there patches
>>
>>  From c14a26b9c9e6dc5711f3155e44adee8dfa634e33 Mon Sep 17 00:00:00 2001
>> From: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
>> Date: Mon, 25 Apr 2022 11:21:19 +0100
>> Subject: [PATCH 1/6] xen/arm: smmuv1: Remove iommu group when deassign
>>
>>  From 6a7ace399f70f0001664d727476c59f211f389f5 Mon Sep 17 00:00:00 2001
>> From: Stefano Stabellini <stefano.stabellini@amd.com>
>> Date: Thu, 23 Jun 2022 11:52:47 -0700
>> Subject: [PATCH 2/6] libxl: add support for emulated TPM on ARM
>>
>>  From 6dc26f1d82a8942dc5a00c55ee29ce4be5359529 Mon Sep 17 00:00:00 2001
>> From: Tanmay Shah <tanmay.shah@xilinx.com>
>> Date: Wed, 3 Aug 2022 08:56:56 -0700
>> Subject: [PATCH 3/6] xen/eemi: Add EEMI calls to support SGI registration
>>
>>  From 9fd67311c1253a170b1364de070a7535551bba52 Mon Sep 17 00:00:00 2001
>> From: Tanmay Shah <tanmay.shah@amd.com>
>> Date: Thu, 4 Aug 2022 16:34:31 -0700
>> Subject: [PATCH 4/6] xen: eemi: make xen passthrough for unknown EEMI calls
>>   from Dom0
>>
>>  From f81a621a28dfde7b8d0d5c5c125f2f250291b7e8 Mon Sep 17 00:00:00 2001
>> From: Michal Orzel <michal.orzel@amd.com>
>> Date: Mon, 29 Aug 2022 15:09:07 +0200
>> Subject: [PATCH 5/6] platforms: xilinx: Add support for mapping PM nodes
>> into
>>   64-bit addresses
>>
>>  From 47ce40314bbec31b683da56d007d14603f002d0c Mon Sep 17 00:00:00 2001
>> From: Ayan Kumar Halder <ayankuma@amd.com>
>> Date: Tue, 30 Aug 2022 12:48:25 +0100
>> Subject: [PATCH 6/6] Arm: Enable BOOT_PIN_CTRL for Dom0
>>
>> Regards,
>> Oleg
>>
>> вт, 18 апр. 2023 г. в 11:59, Julien Grall <julien@xen.org>:
>>
>>> +Stefano, + Bertrand, +Carlo,
>>>
>>> On 18/04/2023 09:43, Oleg Nikitenko wrote:
>>>> Hello,
>>>
>>> Hi,
>>>
>>>> I tried to turn on this scheme and ran into panic.
>>>> Where was I wrong ?
>>>
>>> This feature has not been merged in Xen upstream yet. So can you tell us
>>> what patches did you apply or which tree?
>>>
>>>>
>>>> Xen command line
>>>> xen,xen-bootargs = "console=dtuart dtuart=serial0 dom0_mem=1600M
>>>> dom0_max_vcpus=2 dom0_vcpus_pin bootscrub=0 vwfi=native sched=null
>>>> timer_slop=0 way_szize=65536 xen_colors=0-3 dom0_colors=4-7";
>>>
>>> Can you provide the following information:
>>>    * HW
>>>    * Where are the banks located?
>>>    * Where do you load the various modules (e.g. kernel, xen...)?
>>>
>>>>
>>>> Xen config color build settings
>>>> CONFIG_COLORING=y
>>>>
>>>> Xen log:
>>>> (XEN) I/O virtualisation enabled
>>>> (XEN)  - Dom0 mode: Relaxed
>>>> (XEN) P2M: 40-bit IPA with 40-bit PA and 8-bit VMID
>>>> (XEN) P2M: 3 levels with order-1 root, VTCR 0x0000000080023558
>>>> (XEN) Scheduling granularity: cpu, 1 CPU per sched-resource
>>>> (XEN) Coloring general information
>>>> (XEN) Way size: 64kB
>>>> (XEN) Max. number of colors available: 16
>>>> (XEN) Xen color(s): [ 0 ]
>>>> (XEN) alternatives: Patching with alt table 00000000002cc690 ->
>>>> 00000000002ccc0c
>>>> (XEN) Color array allocation failed for dom0
>>>> (XEN)
>>>> (XEN) ****************************************
>>>> (XEN) Panic on CPU 0:
>>>> (XEN) Error creating domain 0
>>>> (XEN) ****************************************
>>>> (XEN)
>>>> (XEN) Reboot in five seconds...
>>>
>>> Cheers,
>>>
>>> --
>>> Julien Grall
>>>
>>
> 

[1] 
https://lore.kernel.org/xen-devel/20230123154735.74832-1-carlo.nonato@minervasys.tech

-- 
Julien Grall

