Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3321FF5A7
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 16:50:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlvsD-0003Mm-DB; Thu, 18 Jun 2020 14:50:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AXO0=77=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jlvsB-0003Mb-Uc
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 14:50:35 +0000
X-Inumbo-ID: 0e752a5a-b173-11ea-baa8-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0e752a5a-b173-11ea-baa8-12813bfff9fa;
 Thu, 18 Jun 2020 14:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Yu0MZi/6HCce73HsqklCSPKPrUWmB2tMw9OQRD7ZdtY=; b=tKfNQ4/0vjC7yAW4yVe1NNKdUM
 4gvBJKp9rjto+ZTz9MLL4HqVD7snSwdi0UK2UOrMszz2YI5y1mtpIOmu+0FY3R9mHwrV4CibI+hTJ
 7lw/Ymk6pSO6TjlIkpZt7roJKlzhPQMGH3ECXWELR1F/GB+Qxb36rQSAOvHlKpJihtSc=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jlvs4-0002No-S2; Thu, 18 Jun 2020 14:50:28 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jlvs4-0004O7-Kq; Thu, 18 Jun 2020 14:50:28 +0000
Subject: Re: UEFI support in ARM DomUs
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <CAMmSBy9R57ntWmzNZDvwcvJM1f1wwD7ogWvCshipAcPX4x-TmQ@mail.gmail.com>
 <DB6PR0402MB276072324DC3E1E9BD9A96BE88890@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <c3856c1f-52bf-92fd-5226-4b09229e2127@epam.com>
 <alpine.DEB.2.21.2006040829390.6774@sstabellini-ThinkPad-T480s>
 <d6b39cd7-eeaa-f82b-df62-051f9f715968@epam.com>
From: Julien Grall <julien@xen.org>
Message-ID: <54dcfce1-c401-0581-8620-dc8790209a87@xen.org>
Date: Thu, 18 Jun 2020 15:50:25 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <d6b39cd7-eeaa-f82b-df62-051f9f715968@epam.com>
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
Cc: Anastasiia Lukianenko <Anastasiia_Lukianenko@epam.com>,
 Juergen Gross <jgross@suse.com>, Peng Fan <peng.fan@nxp.com>,
 Roman Shaposhnik <roman@zededa.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Nataliya Korovkina <malus.brandywine@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 18/06/2020 06:22, Oleksandr Andrushchenko wrote:
> 
> On 6/4/20 6:31 PM, Stefano Stabellini wrote:
>> On Thu, 4 Jun 2020, Oleksandr Andrushchenko wrote:
>>> On 6/4/20 4:57 AM, Peng Fan wrote:
>>>> Grall <julien@xen.org>;
>>>>> Nataliya Korovkina <malus.brandywine@gmail.com>
>>>>> Subject: UEFI support in ARM DomUs
>>>> We have made U-Boot run inside XEN DomU, but just only PV console part,
>>>> not implement other frontend drivers currently. Would this help for your
>>>> case if enable EFI in U-Boot?
>>> Well, we have a working PV block implementation on top of that on iMX8
>>>
>>> platform, mostly ported from mini-os. Currently we are finalizing the work
>>>
>>> and cleaning up (it's going to take a week or so hopefully). Then, we we'll post
>>>
>>> it on our public github. We are also thinking about upstreaming the work, but it may
>>>
>>> take quite some time if the whole idea fits u-boot's view on such an extension at all.
>> Yes please to both of you! :-)
>>
>> In the meantime, while we wait for those changes to go upstream in
>> uboot, could you please post a branch on github and a link on this email
>> thread?
> 
> It took a bit more time than we expected, but here we go [1]:
> 
> this is in form of a pull-request as we would love to hear from the
> 
> community and it is easier to discuss the code (please leave comments there)
> 
> 1. There is code originating from MiniOS and work done by Peng, so we
> 
> would like to ask the respective copyright owners to raise their hands and

Not everyone are closely watching xen-devel. So if you want to find out 
who are the copyright owners, then your best solution is to go through 
the git log and CC the authors.

> 
> let us *fix inappropriate licensing* if any.
> 
> 2. Please note, the series has a HACK to move the RAM base as it is expected by
> 
> our test platform (iMX8), so others will need to remove or modify that.
> 
> 3. There is a limitation already noted by Peng that we do not have serial output
> 
> until MMU is setup, so we have introduced xen_early_printk helper which always
> 
> works, so you can use that for early stage debugging.
> 
> 4. Minimal memory size supported is ~129M because of dtb placement by Xen tools

Hmmm... Why? What's wrong with booting a guest with just 64MB?

> 
> 5. We use -D__XEN__ to access some of the hidden defines we need such as
> 
> GUEST_RAM0_BASE and the friends as there is no other way but manually defining the
> 
> same which is not cute.

I have replied to this in the pull request. But I want to bring the 
conversation here to have a wider discussion.

For a first, __XEN__ should really only be defined by the hypervisor and 
not used by the guest. This is used to gate non-stable ABI (such as the 
tools) and anything behind it hasn't been vetted to work in other build 
configuration that the one used by Xen.

In general, we expect the guest to discover everything for the 
device-tree because the memory layout is not stable (we want to be able 
to reshuffle as we add more features).

I know that EDK2/Tianocore can be built once and work on every Xen 
configuration. It would be ideal that U-boot follow the same. If it is 
really not possible, then we should explore a path that is preventing to 
define __XEN__.

How much does U-boot expect to know about the memory layout? Does it 
require to know all the memory banks? Or would it be sufficient for it 
to know the start address of the first bank and the minimum of RAM?

Cheers,

-- 
Julien Grall

