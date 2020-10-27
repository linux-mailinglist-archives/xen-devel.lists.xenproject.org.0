Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E47FD29B210
	for <lists+xen-devel@lfdr.de>; Tue, 27 Oct 2020 15:38:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12940.33424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXQ6m-0007aB-7I; Tue, 27 Oct 2020 14:37:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12940.33424; Tue, 27 Oct 2020 14:37:56 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXQ6m-0007Zk-38; Tue, 27 Oct 2020 14:37:56 +0000
Received: by outflank-mailman (input) for mailman id 12940;
 Tue, 27 Oct 2020 14:37:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RClw=EC=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kXQ6k-0007ZY-9i
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 14:37:54 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 29737194-3685-4ef2-a65f-9a9b6808bb6a;
 Tue, 27 Oct 2020 14:37:53 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kXQ6h-0000kW-GQ; Tue, 27 Oct 2020 14:37:51 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kXQ6h-0006Bk-8a; Tue, 27 Oct 2020 14:37:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=RClw=EC=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kXQ6k-0007ZY-9i
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 14:37:54 +0000
X-Inumbo-ID: 29737194-3685-4ef2-a65f-9a9b6808bb6a
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 29737194-3685-4ef2-a65f-9a9b6808bb6a;
	Tue, 27 Oct 2020 14:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=dA2U/WBpIiNLs6m7784iLFfwRN40j+t9fnVMroKcBrs=; b=3EhmVNgVbNQGQVWDgSPCjbm9xF
	xs3ptOyf+6LvfOzr/P84rJqhYvZuAL/0ZdKHSszH88Fs0hJDZ2XMTZRK/YoNHTTLEZrzjUU9dDTXt
	8dqrbDO7ELX4eHPrpzFOHu4NbX5lH5yn/V1+7F0N9cXibuWB9B10cr444VG+bU5ZN2vI=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kXQ6h-0000kW-GQ; Tue, 27 Oct 2020 14:37:51 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kXQ6h-0006Bk-8a; Tue, 27 Oct 2020 14:37:51 +0000
Subject: Re: [XEN PATCH v1] xen/arm : Add support for SMMUv3 driver
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Ash Wilding <Ash.Wilding@arm.com>, Rahul Singh <Rahul.Singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <b085e894773842ac320b818aa6f84289d0a128ed.1602591365.git.rahul.singh@arm.com>
 <cd433f0a-ed0b-ce82-c356-d6deaa053a30@xen.org>
 <BBF09ABE-29A6-4990-8DA2-B44086E9C88C@arm.com>
 <1082f30e-0ce8-00b1-e120-194ff874a9ba@xen.org>
 <alpine.DEB.2.21.2010221631440.12247@sstabellini-ThinkPad-T480s>
 <D8EF4B06-B64D-4264-8C86-DA1B5A1146D2@arm.com>
 <7314936f-6c1e-5ca6-a33b-973c8e61ba3b@xen.org>
 <D9F93137-412F-47E5-A55C-85D1F3745618@arm.com>
 <2813ea2b-bfc4-0590-47ef-86089ad65a5d@xen.org>
 <0E2548E0-0504-43B6-8DD7-D5B7BACCEB6E@arm.com>
 <BF2E5EF7-575B-4A8F-BC00-3F2B73754886@arm.com>
 <9cf9f8d3-b699-de3c-781f-f7ad1b498899@xen.org>
 <F573C8D3-3473-43CD-BA98-8D59E0188AF8@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <13baac40-8b10-0def-4e44-0d8f655fcaf1@xen.org>
Date: Tue, 27 Oct 2020 14:37:49 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <F573C8D3-3473-43CD-BA98-8D59E0188AF8@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 27/10/2020 14:19, Bertrand Marquis wrote:
> Hi Julien,

Hi Bertrand,

> 
>> On 26 Oct 2020, at 19:05, Julien Grall <julien@xen.org> wrote:
>>
>> On 26/10/2020 12:10, Ash Wilding wrote:
>>> Hi,
>>
>> Hi Ash,
>>
>>>> 1. atomic_set_release
>>>> 2. atomic_fetch_andnot_relaxed
>>>> 3. atomic_cond_read_relaxed
>>>> 4. atomic_long_cond_read_relaxed
>>>> 5. atomic_long_xor
>>>> 6. atomic_set_release
>>>> 7. atomic_cmpxchg_relaxed might be we can use atomic_cmpxchg that is
>>>>     implemented in XEN need to check.
>>>> 8. atomic_dec_return_release
>>>> 9. atomic_fetch_inc_relaxed
>>> If we're going to pull in Linux's implementations of the above atomics
>>> helpers for SMMUv3, and given the majority of SMMUv3 systems are v8.1+
>>> with LSE, perhaps this would be a good time to drop the current
>>> atomic.h in Xen completely and pull in both Linux's LL/SC and LSE
>>> helpers,
>>
>> When I originally answered to the thread, I thought about suggesting importing LSE. But I felt it was too much to ask in order to merge the SMMUv3 code.
>>
>> However, I would love to have support for LSE in Xen as this would solve other not yet fully closed security issue with LL/SC (see XSA-295 [2]).
>>
>> Would Arm be willing to add support for LSE before merging the SMMUv3?
> 
> We are willing to work on LSE but I cannot commit on me and my team to start working on this subject before the end of the year.

That's fine. There are other way we can bridge the gap between Xen and 
Linux in order to get the latest version (see more below).

> 
> So I think it would be good to integrate this version of SMMUv3 and we can then update it to the latest Linux one once LSE has been added.

As I pointed out in my first e-mail on this thread, I am quite concerned 
that we are going to (re-)introduce bugs that have been fixed in Linux.
Did you investigate that this is not going to happen?

However, I think we can manage to get the latest version without 
requiring LSE. It should be possible to provide dumb version of most the 
helpers.

> 
> I think it make sense in the meantime to discuss how this should be designed but it might be a good idea to make a specific discussion thread for that.

Make sense. Can you start a new thread?

Cheers,

-- 
Julien Grall

