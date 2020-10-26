Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DBD29966C
	for <lists+xen-devel@lfdr.de>; Mon, 26 Oct 2020 20:06:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12556.32675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kX7nz-0005Z3-3Q; Mon, 26 Oct 2020 19:05:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12556.32675; Mon, 26 Oct 2020 19:05:19 +0000
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
	id 1kX7ny-0005Yf-Vt; Mon, 26 Oct 2020 19:05:18 +0000
Received: by outflank-mailman (input) for mailman id 12556;
 Mon, 26 Oct 2020 19:05:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6Eey=EB=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kX7nx-0005Ya-H3
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 19:05:17 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9b9b8d5d-b9bb-478a-a681-3493e922afd5;
 Mon, 26 Oct 2020 19:05:16 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kX7nu-0003fx-RA; Mon, 26 Oct 2020 19:05:14 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kX7nu-00024x-EH; Mon, 26 Oct 2020 19:05:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=6Eey=EB=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kX7nx-0005Ya-H3
	for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 19:05:17 +0000
X-Inumbo-ID: 9b9b8d5d-b9bb-478a-a681-3493e922afd5
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 9b9b8d5d-b9bb-478a-a681-3493e922afd5;
	Mon, 26 Oct 2020 19:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=MD5w1Mwew/Mf6nmoUUblqsberfJCG0aBF4mUDoPN/c8=; b=eXwfShyITaz7LMd8bJTWohVoyQ
	CQmR+9V1rvqlhNrbTvxKsph7NQdX5jiLrTAzvkX4YIP6WvSa9FpEkf/x6KGztKSCup+nmiBCxyMKx
	mi4sy4pl9Eq7dZkdRK4VJhtitTjsBnlA6wRLz/bAmTLyb5rp+7S/8YvxvheanrZA2nuA=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kX7nu-0003fx-RA; Mon, 26 Oct 2020 19:05:14 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239] helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kX7nu-00024x-EH; Mon, 26 Oct 2020 19:05:14 +0000
Subject: Re: [XEN PATCH v1] xen/arm : Add support for SMMUv3 driver
To: Ash Wilding <Ash.Wilding@arm.com>, Rahul Singh <Rahul.Singh@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Jan Beulich
 <jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
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
From: Julien Grall <julien@xen.org>
Message-ID: <9cf9f8d3-b699-de3c-781f-f7ad1b498899@xen.org>
Date: Mon, 26 Oct 2020 19:05:12 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <BF2E5EF7-575B-4A8F-BC00-3F2B73754886@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 26/10/2020 12:10, Ash Wilding wrote:
> Hi,

Hi Ash,

>> 1. atomic_set_release
>> 2. atomic_fetch_andnot_relaxed
>> 3. atomic_cond_read_relaxed
>> 4. atomic_long_cond_read_relaxed
>> 5. atomic_long_xor
>> 6. atomic_set_release
>> 7. atomic_cmpxchg_relaxed might be we can use atomic_cmpxchg that is
>>     implemented in XEN need to check.
>> 8. atomic_dec_return_release
>> 9. atomic_fetch_inc_relaxed
> 
> 
> If we're going to pull in Linux's implementations of the above atomics
> helpers for SMMUv3, and given the majority of SMMUv3 systems are v8.1+
> with LSE, perhaps this would be a good time to drop the current
> atomic.h in Xen completely and pull in both Linux's LL/SC and LSE
> helpers,

When I originally answered to the thread, I thought about suggesting 
importing LSE. But I felt it was too much to ask in order to merge the 
SMMUv3 code.

However, I would love to have support for LSE in Xen as this would solve 
other not yet fully closed security issue with LL/SC (see XSA-295 [2]).

Would Arm be willing to add support for LSE before merging the SMMUv3?

As an alternative, it might also be possible to provide "dumb" 
implementation for all the helpers even if they are stricter than 
necessary for the memory ordering requirements.

then use a new Kconfig to toggle between them?

I would prefer to follow the same approach as Linux and allow Xen to 
select at boot time which implementations to use. This would enable 
distro to provide a single binary that boot on all Armv8 and still allow 
Xen to select the best set of instructions.

Xen already provides a framework to switch between two sets of 
instructions at boot. This was borrowed from Linux, so I don't expect a 
big hurdle to get this supported.

> 
> Back in 5d45ecabe3 [1] Jan mentioned we probably want to avoid relying
> on gcc atomics helpers as we can't switch between LL/SC and LSE
> atomics. 

I asked Jan to add this line in the commit message :). My concern was 
that even if we provided a runtime switch (or sanity check for XSA-295), 
the GCC helpers would not be able to take advantage (the code is not 
written by Xen community).

Cheers,

> [1] https://xenbits.xen.org/gitweb/?p=xen.git;a=commit;h=5d45ecabe3

[2] https://xenbits.xen.org/xsa/advisory-295.html

> 
> 

-- 
Julien Grall

