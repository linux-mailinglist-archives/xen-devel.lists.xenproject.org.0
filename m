Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 819AD9E793F
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2024 20:47:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.850492.1264911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJeIM-0005Cy-J8; Fri, 06 Dec 2024 19:47:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 850492.1264911; Fri, 06 Dec 2024 19:47:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJeIM-0005AV-GJ; Fri, 06 Dec 2024 19:47:22 +0000
Received: by outflank-mailman (input) for mailman id 850492;
 Fri, 06 Dec 2024 19:47:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tJeIL-0005AP-Si
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2024 19:47:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tJeIK-007AYY-13;
 Fri, 06 Dec 2024 19:47:20 +0000
Received: from [2a02:8012:3a1:0:9908:37eb:1c5c:6583]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tJeIK-00354i-1S;
 Fri, 06 Dec 2024 19:47:20 +0000
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
	bh=wjRdal2gy2+JogKCKVtWGBw+/Ydy87n0Xyd2hXGUAa0=; b=Md4MxSCmI1QotOqGTQThz6JRuK
	1gVZY03nWMa2JpDWUX+CIrYekcV7UJYR66ltxRbgVOc1kk5QBCooukRfKxbiryMJo65Gq043w1Cvm
	NB0JKWeomc7GYXP8WLcYJaTvbKixOv8Cg9DZL4sBxEhBG6V8jmz0dZKMzcxMbAEG2JVY=;
Message-ID: <ac0627a3-9d27-4d36-9d07-def68e97d70a@xen.org>
Date: Fri, 6 Dec 2024 19:47:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC for-4.19] docs/checklist: Start tagging new dev
 windows
Content-Language: en-GB
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>
References: <20240715164639.3378294-1-andrew.cooper3@citrix.com>
 <7db0879f-93a3-4690-8ba5-1f0897027e47@xen.org>
 <81c65915-cecc-4edf-8636-3be56a411c50@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <81c65915-cecc-4edf-8636-3be56a411c50@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrew,

Reviving this thread as we are preparing for Xen 4.20.

On 16/07/2024 07:57, Jan Beulich wrote:
> On 15.07.2024 18:58, Julien Grall wrote:
>> On 15/07/2024 17:46, Andrew Cooper wrote:
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>
>> With one remark below:
>>
>> Reviewed-by: Julien Grall <jgrall@amazon.com>
>>
>>> ---
>>> CC: Jan Beulich <JBeulich@suse.com>
>>> CC: Stefano Stabellini <sstabellini@kernel.org>
>>> CC: Julien Grall <julien@xen.org>
>>> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>>
>>> This is about figuring out when a change was first introduced.  Take
>>> 10b719dc88 for example (completely random pick).
>>>
>>> The right answer is `git tag --contains $sha` and look for the oldest
>>> RELEASE-$X.  In this case it's Xen 4.6, but the tags are not numerically
>>> sorted so the answer is towards the end of the list of 166 tags.
>>>
>>> The better answer would be to `git describe $sha` because git has an algorithm
>>> to do this nicely.  In this case, it's 4.5.0-rc4-934-g10b719dc8830 because we
>>> branch first and tag RELEASE-4.6.0 on the branch, rather than releasing off
>>> master.
>>>
>>> With 0082626f35af (opening of the 4.6 tree) containing an annotated tag of
>>> 4.6-dev, git describe now gives 4.6-dev-902-g10b719dc8830 which far more
>>> helpful when doing code archeology.
>>
>> I think some of this explanation should be in the commit message.
> 
> Imo it could even be moved up verbatim.

Would you be fine if I move your explanation in the commit message and 
commit it?

Cheers,

-- 
Julien Grall


