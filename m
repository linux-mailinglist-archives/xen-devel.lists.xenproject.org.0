Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7685338A2EC
	for <lists+xen-devel@lfdr.de>; Thu, 20 May 2021 11:46:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.130859.244897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljfFt-0004Bt-VG; Thu, 20 May 2021 09:46:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 130859.244897; Thu, 20 May 2021 09:46:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljfFt-00049d-Qv; Thu, 20 May 2021 09:46:13 +0000
Received: by outflank-mailman (input) for mailman id 130859;
 Thu, 20 May 2021 09:46:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ljfFr-00049M-EK
 for xen-devel@lists.xenproject.org; Thu, 20 May 2021 09:46:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ljfFr-0005SW-9w; Thu, 20 May 2021 09:46:11 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ljfFq-0004De-Qu; Thu, 20 May 2021 09:46:11 +0000
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
	bh=oMc5ISGUUD/1bW8gB68xeYoMO7OT5jBlt80GZRsh4M8=; b=teY/N1I6D6gQkj7LJY++PKgYB1
	yPhmkThv6ds32Rx5HmG6HwtQkd4tM2tznEVZg/iGBSB5kJOa4LdYKhsLrv6c0cDvMDx1EXMHHCSER
	mY4MJYNtTqI+ZvW7j5yKhFySWBmgjaeUWLE2hzddV0YAwJFGy9IB/vSJwqeGIO4slREU=;
Subject: Re: Hand over of the Xen shared info page
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Anastasiia Lukianenko <Anastasiia_Lukianenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrii Chepurnyi <Andrii_Chepurnyi@epam.com>
References: <64bc6ab6ec387acebb40c1b4786dfda1050f9d50.camel@epam.com>
 <8ff05bdf-a6c4-6b14-b39c-7d9b3bb9d279@xen.org>
 <1db54c363eae22613280e7181805abee396fe5e9.camel@epam.com>
 <8d1ecf6c-a0d1-d9bc-5daf-d02a34fff1e6@xen.org>
 <alpine.DEB.2.21.2105191604130.14426@sstabellini-ThinkPad-T480s>
 <4b686071-3260-87b1-d240-8d3c2b48f1f8@epam.com>
From: Julien Grall <julien@xen.org>
Message-ID: <0d502893-f433-30b9-72a5-6842274239f3@xen.org>
Date: Thu, 20 May 2021 10:46:07 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <4b686071-3260-87b1-d240-8d3c2b48f1f8@epam.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 20/05/2021 06:21, Oleksandr Andrushchenko wrote:
> Hi, all!

Hi,


> On 5/20/21 2:11 AM, Stefano Stabellini wrote:
>> On Wed, 19 May 2021, Julien Grall wrote:
>>> On 14/05/2021 10:50, Anastasiia Lukianenko wrote:
>>>> Hi Julien!
>>> Hello,
>>>
>>>> On Thu, 2021-05-13 at 09:37 +0100, Julien Grall wrote:
>>>>> On 13/05/2021 09:03, Anastasiia Lukianenko wrote:
>>>>> The alternative is for U-boot to go through the DT and infer which
>>>>> regions are free (IOW any region not described).
>>>> Thank you for interest in the problem and advice on how to solve it.
>>>> Could you please clarify how we could find free regions using DT in U-
>>>> boot?
>>> I don't know U-boot code, so I can't tell whether what I suggest would work.
>>>
>>> In theory, the device-tree should described every region allocated in address
>>> space. So if you parse the device-tree and create a list (or any
>>> datastructure) with the regions, then any range not present in the list would
>>> be free region you could use.
>> Yes, any "empty" memory region which is neither memory nor MMIO should
>> work.
> 
> You need to account on many things while creating the list of regions:
> 
> device register mappings, reserved nodes, memory nodes, device tree
> 
> overlays parsing etc. It all seem to be a not-that-trivial task and after
> 
> all if implemented it only lives in U-boot and you have to maintain that
> 
> code. So, if some other entity needs the same you need to implement
> 
> that as well.

Yes, there are some complexity. I have suggested other approach in a 
separate thread. Did you look at them?

> And also you can imagine a system without device tree at all...
Xen doesn't provide a stable guest layout. Such system would have to be 
tailored to a given guest configuration, Xen version (can be custom)...

Therefore, hardcoding the value in the system (not in Xen headers!) is 
not going to make it much worse.

> So, I am not saying it is not possible to implement, but I just question if
> 
> such an implementation is really a good way forward.
> 
>>
>>
>>> However, I realized a few days ago that the magic pages are not described in
>>> the DT. We probably want to fix it by marking the page as "reserved" or create
>>> a specific bindings.
>>>
>>> So you will need a specific quirk for them.
>> It should also be possible to keep the shared info page allocated and
>> simply pass the address to the kernel by adding the right node to device
>> tree.
> And then you need to modify your OS and this is not only Linux...
>> To do that, we would have to add a description of the magic pages
>> to device tree, which I think would be good to have in any case. In that
>> case it would be best to add a proper binding for it under the "xen,xen"
>> node.
> 
> I would say that querying Xen for such a memory page seems much
> 
> more cleaner and allows the guest OS either to continue using the existing
> 
> method with memory allocation or using the page provided by Xen.

IIUC your proposal, you are asking to add an hypercall to query which 
guest physical region can be used for the shared info page.

This may solve the problem you have at hand, but this is not scalable. 
There are a few other regions which regions unallocated memory (e.g. 
grant table, grant mapping, foreign memory map,....).

So if we were going to involve Xen, then I think it is better to have a 
generic way to ask Xen for unallocated space.

Cheers,

-- 
Julien Grall

