Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D65A6A91D
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 15:53:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.922404.1326299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvHH2-0006lg-8U; Thu, 20 Mar 2025 14:53:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 922404.1326299; Thu, 20 Mar 2025 14:53:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvHH2-0006ju-5U; Thu, 20 Mar 2025 14:53:32 +0000
Received: by outflank-mailman (input) for mailman id 922404;
 Thu, 20 Mar 2025 14:53:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tvHH0-0006jm-D6
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 14:53:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tvHGz-00F2Hd-0s;
 Thu, 20 Mar 2025 14:53:29 +0000
Received: from [2a02:8012:3a1:0:699c:37d:6a29:da07]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tvHGy-00BLKU-2f;
 Thu, 20 Mar 2025 14:53:28 +0000
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
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=LrScI3rTxyZW/M0Iv9GCN03ywh+yLzqaSMP/oU5wQek=; b=EYYnwTimA5iyGdCJ4mRFSQ+na4
	dCcz1f7Gm7U0jG9BO900cThdcvmFGfcw0nMdxS9Z5op+je8S1bc9mUwv9MD66LNETx5BalQpVln90
	yfKM0pWyCZTVNi+q0KbrS/8svSF1PwN8TwYdHywNMVdJWOF2kON5qzl3r3R6ZVZGXSB0=;
Message-ID: <6fee9106-1455-4919-bd23-220ab229f93e@xen.org>
Date: Thu, 20 Mar 2025 14:53:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC for-4.19] docs/checklist: Start tagging new dev
 windows
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>
References: <20240715164639.3378294-1-andrew.cooper3@citrix.com>
 <7db0879f-93a3-4690-8ba5-1f0897027e47@xen.org>
 <81c65915-cecc-4edf-8636-3be56a411c50@suse.com>
 <ac0627a3-9d27-4d36-9d07-def68e97d70a@xen.org>
In-Reply-To: <ac0627a3-9d27-4d36-9d07-def68e97d70a@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 06/12/2024 19:47, Julien Grall wrote:
> Hi Andrew,
> 
> Reviving this thread as we are preparing for Xen 4.20.
> 
> On 16/07/2024 07:57, Jan Beulich wrote:
>> On 15.07.2024 18:58, Julien Grall wrote:
>>> On 15/07/2024 17:46, Andrew Cooper wrote:
>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>
>>> With one remark below:
>>>
>>> Reviewed-by: Julien Grall <jgrall@amazon.com>
>>>
>>>> ---
>>>> CC: Jan Beulich <JBeulich@suse.com>
>>>> CC: Stefano Stabellini <sstabellini@kernel.org>
>>>> CC: Julien Grall <julien@xen.org>
>>>> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>>>
>>>> This is about figuring out when a change was first introduced.  Take
>>>> 10b719dc88 for example (completely random pick).
>>>>
>>>> The right answer is `git tag --contains $sha` and look for the oldest
>>>> RELEASE-$X.  In this case it's Xen 4.6, but the tags are not 
>>>> numerically
>>>> sorted so the answer is towards the end of the list of 166 tags.
>>>>
>>>> The better answer would be to `git describe $sha` because git has an 
>>>> algorithm
>>>> to do this nicely.  In this case, it's 4.5.0-rc4-934-g10b719dc8830 
>>>> because we
>>>> branch first and tag RELEASE-4.6.0 on the branch, rather than 
>>>> releasing off
>>>> master.
>>>>
>>>> With 0082626f35af (opening of the 4.6 tree) containing an annotated 
>>>> tag of
>>>> 4.6-dev, git describe now gives 4.6-dev-902-g10b719dc8830 which far 
>>>> more
>>>> helpful when doing code archeology.
>>>
>>> I think some of this explanation should be in the commit message.
>>
>> Imo it could even be moved up verbatim.
> 
> Would you be fine if I move your explanation in the commit message and 
> commit it?


Ping?

Cheers,

-- 
Julien Grall


