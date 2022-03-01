Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 747314C88B4
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 11:01:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.281063.479241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOzJV-0003tL-Jv; Tue, 01 Mar 2022 10:01:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 281063.479241; Tue, 01 Mar 2022 10:01:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOzJV-0003qq-Gv; Tue, 01 Mar 2022 10:01:01 +0000
Received: by outflank-mailman (input) for mailman id 281063;
 Tue, 01 Mar 2022 10:00:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TZGk=TM=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1nOzJT-0003qh-R1
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 10:00:59 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 7d8b62b9-9946-11ec-8539-5f4723681683;
 Tue, 01 Mar 2022 11:00:58 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1C005ED1;
 Tue,  1 Mar 2022 02:00:57 -0800 (PST)
Received: from [10.57.5.142] (unknown [10.57.5.142])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B55943F73D;
 Tue,  1 Mar 2022 02:00:55 -0800 (PST)
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
X-Inumbo-ID: 7d8b62b9-9946-11ec-8539-5f4723681683
Subject: Re: [PATCH] xen/arm: Remove unused BOOT_RELOC_VIRT_START
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <jgrall@amazon.com>
References: <20220228100633.57593-1-julien@xen.org>
 <ca501104-4563-d9ca-ffb1-ca4fdb1dd084@arm.com>
 <ff6c4f25-156b-c305-7e43-2cf63c784045@xen.org>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <c673f051-bbe2-debb-b1cc-b016483a998b@arm.com>
Date: Tue, 1 Mar 2022 11:00:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ff6c4f25-156b-c305-7e43-2cf63c784045@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Julien,

On 01.03.2022 10:57, Julien Grall wrote:
> On 01/03/2022 08:28, Michal Orzel wrote:
>> Hi Julien,
> 
> Hi Michal,
> 
>> On 28.02.2022 11:06, Julien Grall wrote:
>>> From: Julien Grall <julien.grall@arm.com>
>>>
>>> We stopped relocating Xen since commit f60658c6ae "xen/arm: Stop
>>> relocating Xen".
>>>
>>> At the same time, update the memory layout description.
>>>
>>> Signed-off-by: Julien Grall <julien.grall@arm.com>
>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>> Are these two entries needed? I'd say one is enough.
> From my understanding, it is necessary. The person is the same here but the companies are different.
> 
> So I should properly account that the work was originaly done while working for Arm (see [1]) and was updated while I was working for Amazon.
> 
> Even I didn't touch the patch, I still need to add a signed-off-by because of the DCO [2].
> 
Interesting. Thank you very much for the explanation.

>>> ---
>>
>> Apart from that:
>> Reviewed-by: Michal Orzel <michal.orzel@arm.com>
> 
> Cheers,
> 
> [1] https://xenbits.xen.org/gitweb/?p=people/julieng/xen-unstable.git;a=commit;h=dfa041f32ae2fef6132d40df7cbce93b6e385937
> [2] https://developercertificate.org/
> 

Cheers,
Michal

