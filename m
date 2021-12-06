Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 653024698E2
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 15:28:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239121.414465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muEyd-0004xg-Ng; Mon, 06 Dec 2021 14:28:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239121.414465; Mon, 06 Dec 2021 14:28:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muEyd-0004vV-KC; Mon, 06 Dec 2021 14:28:23 +0000
Received: by outflank-mailman (input) for mailman id 239121;
 Mon, 06 Dec 2021 14:28:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1muEyc-0004uv-GK
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 14:28:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1muEyZ-0007Fl-M8; Mon, 06 Dec 2021 14:28:19 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.26.205]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1muEyZ-0004WD-Fw; Mon, 06 Dec 2021 14:28:19 +0000
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
	bh=Y07Z0IucIf7KAhsvg+ocjOpbTTJeKNdY3IVrIFYq6MM=; b=ema2e6nHCMRM+BagCv1mxsYbL+
	abxmG4aKREQz7HqnvePSmWWzo+p2jmS1KUOarzA68tfAc6uRqxMzCbjiuqPocBdObJT8J4Yih11RV
	AzB0rzp+Xk362zZ845kRoevNj1K1sBLQ0OPgbJ2JhqflZzGUpxtg6VqBhlOhhFf+g2ug=;
Message-ID: <c3e698ab-afd7-9638-3f7c-c7599908e173@xen.org>
Date: Mon, 6 Dec 2021 14:28:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [PATCH 1/7] xz: add fall-through comments to a switch statement
To: Jan Beulich <jbeulich@suse.com>, Ian Jackson <iwj@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f96f014c-057a-80a7-b19d-04d7234d3f64@suse.com>
 <0ed245fa-58a7-a5f6-b82e-48f9ed0b6970@suse.com>
 <a36df6b5-9f55-a199-e8d3-3f6cd58a054d@xen.org>
 <b28ec75a-f5e5-cd3d-12b5-20338c7c88e0@xen.org>
 <0c0e67f3-5e0a-f047-ca09-1cf078e6b094@suse.com>
 <71ef250c-be92-2b2f-0f07-ce32c17d8050@xen.org>
 <ceec5b56-65fc-8bb4-b9e0-1e16aea8c412@suse.com>
 <c2d312c2-c413-4e07-1c0c-8652cab40784@xen.org>
 <0b808ce0-23a2-65ae-dfb3-b167d5565b31@suse.com>
 <6bcd1555-ee0d-dd6d-55ca-0ca0e64c3623@xen.org>
 <bef5ff51-475a-e8c4-83fc-950df4516399@suse.com>
 <24992.55453.893877.246946@mariner.uk.xensource.com>
 <2b4195da-21a8-6c30-27c8-43e943b821a1@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <2b4195da-21a8-6c30-27c8-43e943b821a1@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 06/12/2021 13:44, Jan Beulich wrote:
> On 26.11.2021 13:52, Ian Jackson wrote:
>> Jan Beulich writes ("Re: [PATCH 1/7] xz: add fall-through comments to a switch statement"):
>>> On 26.11.2021 11:04, Julien Grall wrote:
>>>> For this case, you provided some sort of an explanation but so far, I am
>>>> still waiting for a link to confirm that the signed-off-by match the one
>>>> on the ML.
>>>
>>> I haven't been able to easily find a mail archive holding this patch.
>>
>> I 100% agree with Julien on all points in this thread.
>>
>> Please can we keep the Linux S-o-b.
>>
>> Note that S-o-b is not a chain of *approval* (whose relevance to us is
>> debateable) but but a chain of *custody and transmission* for
>> copyright/licence/gdpr purposes.  That latter chain is hightly
>> relevant to us.
>>
>> All such S-o-b should be retained.
>>
>> Of course if you got the patch somewhere other than the Linux commit,
>> then the chain of custody doesn't pass through the Linux commit.  But
>> in that case I expect you to be able to say where you got it.
> 
> I've submitted v2 with S-o-b restored as far as necessary to meet this
> requirement. I did not restore all of them, because I continue to not
> see the value of retaining them. You saying "is highly relevant to us"
> is a statement, but not an explanation of why tags beyond those in the
> original submissions need retaining.
> 
> Without me seeing the need / value, I'm afraid I see only two ways
> forward: Either things are acceptable as they are now (and will be for
> future similar imports), or it needs to be someone else to put time
> into spotting and then pulling in such changes.

I am a bit confused how this would require more time. They are already 
in the commit message from Linus's git and you have a correct commit id. 
So this is merely a copy/paste.

I am not going to ack it but I am also not going to Nack it if another 
maintainer agrees with your approach.

Cheers,

-- 
Julien Grall

