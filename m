Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C21C4C889C
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 10:58:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.281056.479231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOzFz-0002Pn-4j; Tue, 01 Mar 2022 09:57:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 281056.479231; Tue, 01 Mar 2022 09:57:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOzFz-0002NW-1B; Tue, 01 Mar 2022 09:57:23 +0000
Received: by outflank-mailman (input) for mailman id 281056;
 Tue, 01 Mar 2022 09:57:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nOzFx-0002NQ-QW
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 09:57:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nOzFx-0002v5-ED; Tue, 01 Mar 2022 09:57:21 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235] helo=[192.168.6.66])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nOzFx-0002mG-7k; Tue, 01 Mar 2022 09:57:21 +0000
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
	bh=YVjhYH6kRAXW0WlGzpTvDmInUEioXLDF5vGnBFvgXbo=; b=XO3vnzYxXviPamMXcnHd/Y38U/
	Wfd5lIAiZ8pSBb/bJXFmPnJniuyW1zcXpytWoT4v3ABSBNO4kzMEAjqtIy2anWRP70IR3THvCHDvE
	0er3L1rvijAkGZx+vtOrFqNpR/PW9dGXvboDX+eIihqv0uUh5cVo57W2F/WRcT0GYQTw=;
Message-ID: <ff6c4f25-156b-c305-7e43-2cf63c784045@xen.org>
Date: Tue, 1 Mar 2022 09:57:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH] xen/arm: Remove unused BOOT_RELOC_VIRT_START
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <jgrall@amazon.com>
References: <20220228100633.57593-1-julien@xen.org>
 <ca501104-4563-d9ca-ffb1-ca4fdb1dd084@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <ca501104-4563-d9ca-ffb1-ca4fdb1dd084@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/03/2022 08:28, Michal Orzel wrote:
> Hi Julien,

Hi Michal,

> On 28.02.2022 11:06, Julien Grall wrote:
>> From: Julien Grall <julien.grall@arm.com>
>>
>> We stopped relocating Xen since commit f60658c6ae "xen/arm: Stop
>> relocating Xen".
>>
>> At the same time, update the memory layout description.
>>
>> Signed-off-by: Julien Grall <julien.grall@arm.com>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Are these two entries needed? I'd say one is enough.
 From my understanding, it is necessary. The person is the same here but 
the companies are different.

So I should properly account that the work was originaly done while 
working for Arm (see [1]) and was updated while I was working for Amazon.

Even I didn't touch the patch, I still need to add a signed-off-by 
because of the DCO [2].

>> ---
> 
> Apart from that:
> Reviewed-by: Michal Orzel <michal.orzel@arm.com>

Cheers,

[1] 
https://xenbits.xen.org/gitweb/?p=people/julieng/xen-unstable.git;a=commit;h=dfa041f32ae2fef6132d40df7cbce93b6e385937
[2] https://developercertificate.org/

-- 
Julien Grall

