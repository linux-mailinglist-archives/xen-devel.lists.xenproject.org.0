Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 153C28732BD
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 10:41:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688993.1073873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhnlk-0006wj-Ey; Wed, 06 Mar 2024 09:41:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688993.1073873; Wed, 06 Mar 2024 09:41:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhnlk-0006uj-C1; Wed, 06 Mar 2024 09:41:00 +0000
Received: by outflank-mailman (input) for mailman id 688993;
 Wed, 06 Mar 2024 09:40:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rhnli-0006ud-W4
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 09:40:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rhnlg-0002va-U2; Wed, 06 Mar 2024 09:40:56 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rhnlg-0003GQ-OU; Wed, 06 Mar 2024 09:40:56 +0000
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
	bh=Fb4QIs2E09TeP9Ic2+DwL4sBKHqXS4NERNnQ8agFh8E=; b=yIkleGITnirJOFnDo0zhUE/Px4
	1njfUzl8A0GXAuX87JXuMHrsJ37rGXOfjm4ki8X5yV3IexSNne/vh1oFHXNhHCVHi1yxaaBO7FDxs
	+Yguzt+u24p3Fe+8MDLRLc+OptBSajV9Hfzl3vsGBvNVO/8Q2AfBYdQiJxqE/iDs5N1s=;
Message-ID: <b07ec4be-b7bf-4bf7-8959-4e1d49060530@xen.org>
Date: Wed, 6 Mar 2024 09:40:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] SUPPORT.md: clarify support of booting 32-bit Xen on
 ARMv8
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20240229121352.11264-1-michal.orzel@amd.com>
 <d1b7a4fd-0754-45f7-8c58-db36f0e94cfc@xen.org>
 <94176748-8438-460d-9434-6d18add55cef@amd.com>
 <544718e1-4855-4af1-a450-6362a8cd08f0@xen.org>
 <216e9119-a7f9-43f3-80f9-f1c15685cad3@amd.com>
 <alpine.DEB.2.22.394.2402291307300.853156@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2402291307300.853156@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 29/02/2024 21:07, Stefano Stabellini wrote:
> On Thu, 29 Feb 2024, Michal Orzel wrote:
>>
>> On 29/02/2024 13:40, Julien Grall wrote:
>>>
>>>
>>> On 29/02/2024 12:37, Michal Orzel wrote:
>>>> Hi Julien,
>>>
>>> Hi Michal,
>>>
>>>>
>>>> On 29/02/2024 13:35, Julien Grall wrote:
>>>>> On 29/02/2024 12:13, Michal Orzel wrote:
>>>>>> Since commit bd1001db0af1 ("xen/arm: arm32: Allow Xen to boot on
>>>>>> unidentified CPUs"), it's been possible to boot 32-bit Xen on ARMv8A CPUs
>>>>>> in AArch32 state (assuming HW supports EL2 execution in AArch32). Clarify
>>>>>> the support statement and mark it as Tech Preview, as this use case is
>>>>>> uncommon and hasn't really been tested/hardened.
>>>>>>
>>>>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>>>>> ---
>>>>>>     SUPPORT.md | 1 +
>>>>>>     1 file changed, 1 insertion(+)
>>>>>>
>>>>>> diff --git a/SUPPORT.md b/SUPPORT.md
>>>>>> index a90d1108c9d9..acc61230bb5e 100644
>>>>>> --- a/SUPPORT.md
>>>>>> +++ b/SUPPORT.md
>>>>>> @@ -40,6 +40,7 @@ supported in this document.
>>>>>>         Status: Supported
>>>>> I would consider to use 'Status, Xen in aarch64 mode: Supported' and then...
>>>>>
>>>>>>         Status, Cortex A57 r0p0-r1p1: Supported, not security supported
>>>>>>         Status, Cortex A77 r0p0-r1p0: Supported, not security supported
>>>>>> +    Status, Xen in AArch32 mode: Tech Preview
>>>>>
>>>>> ... move this line closer. What do you think?
>>>> That works for me too (+AArch64 instead of aarch64).
>>>
>>> Ah yes. I keep forgetting capitalizing properly :).
>>>
>>>> Shall I respin the patch?
>>>
>>> Up to you. I am happy to fix it. But I will wait a day or two just to
>>> give a chance for the others to comment.
>> That works for me, let's wait for Bertrand and Stefano.
> 
> I am fine with it

Committed.

Cheers,

-- 
Julien Grall

