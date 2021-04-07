Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E98A356620
	for <lists+xen-devel@lfdr.de>; Wed,  7 Apr 2021 10:11:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106479.203618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU3HA-00056v-2n; Wed, 07 Apr 2021 08:11:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106479.203618; Wed, 07 Apr 2021 08:11:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU3H9-00056L-VG; Wed, 07 Apr 2021 08:10:59 +0000
Received: by outflank-mailman (input) for mailman id 106479;
 Wed, 07 Apr 2021 08:10:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fjXx=JE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lU3H9-00056G-2H
 for xen-devel@lists.xenproject.org; Wed, 07 Apr 2021 08:10:59 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 33e2a9b9-9962-4de6-85cb-6da6f8125a81;
 Wed, 07 Apr 2021 08:10:57 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E30A8B034;
 Wed,  7 Apr 2021 08:10:56 +0000 (UTC)
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
X-Inumbo-ID: 33e2a9b9-9962-4de6-85cb-6da6f8125a81
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617783057; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PquThFOMTwaNicJvaDnFaX3BSOJwDBk2RiGpkgkCpJg=;
	b=RxmLto6bKPEKtGMrZwuiM5fiAHdjiAc1SlVwSlCzyziFKqbh+0SM8AuN0aKn9DVUoKy2T+
	BstdUIsDWZX/bkP1hB848qzolRwu7tSMKBYbEKuFxYnjEuecZYrHBAMe6vPbfvP6WChi+z
	HqB6itmTId7jPFaRNInvKXB2x7O/ZHA=
Subject: Re: [PATCH 3/3] docs/doxygen: doxygen documentation for grant_table.h
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Luca Fancellu <luca.fancellu@arm.com>, bertrand.marquis@arm.com,
 wei.chen@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210406103603.8530-1-luca.fancellu@arm.com>
 <20210406103603.8530-4-luca.fancellu@arm.com>
 <073e28bc-ad94-429d-6384-744864d12b57@suse.com>
 <alpine.DEB.2.21.2104061425040.31460@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e15ed7b9-b153-b767-e625-e7a9d2aa76bf@suse.com>
Date: Wed, 7 Apr 2021 10:10:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2104061425040.31460@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 06.04.2021 23:46, Stefano Stabellini wrote:
> On Tue, 6 Apr 2021, Jan Beulich wrote:
>> On 06.04.2021 12:36, Luca Fancellu wrote:
>>> Modification to include/public/grant_table.h:
>>>
>>> 1) Change anonymous structure to be named structure,
>>>    because doxygen can't deal with them.
>>
>> Especially in the form presented (adding further name space clutter
>> for consumers to fall over) I object to this, most notably ...
>>
>>> @@ -584,7 +599,7 @@ DEFINE_XEN_GUEST_HANDLE(gnttab_swap_grant_ref_t);
>>>   * page granted to the calling domain by a foreign domain.
>>>   */
>>>  struct gnttab_cache_flush {
>>> -    union {
>>> +    union a {
>>
>> ... this one.
> 
> It is unfortunate that none of these tools support anonymous structs or
> unions well. (You might recall we also had issues with the older
> kernel-doc series too, although a bit different.)

While I wouldn't veto such changes, I think it is a very bad approach
to make adjustments like this to cover for a docs tool shortcoming.
Is it entirely unreasonable to have the tool fixed? In fact, if the
issue was run into before, isn't it a bad sign that the tool hasn't
been fixed already, and we merely need to require a certain minimum
version?

> It is difficult to provide a good name here, a suggestion would be more
> than welcome. I agree with you that calling it "a" is a bad idea: "a"
> becomes a globally-visible union name.
> 
> Maybe we could call it: StructName_MemberName, so in this case:
> 
>   union gnttab_cache_flush_a
> 
> It makes sure it is unique and doesn't risk clashing with anything else.
> We can follow this pattern elsewhere as well.
> 
> Any better suggestions?

First and foremost any new additions ought to use a xen_, Xen_, or
XEN_ prefix. For the specific case here, since "a" is already a
rather bad choice for a member name (What does it stand for? In lieu
of any better name we typically use "u" in such cases.), the badness
shouldn't be extended. Sadly the ref as being one way of expressing
the target MFN is also not accompanied by a GFN (as it ought to be),
but an address. Otherwise I would have suggested to abstract the
similar union also used by struct gnttab_copy. In the end I can't
see many alternatives to something like xen_gnttab_cache_flush_target
or xen_gnttab_cache_flush_ref_or_addr.

Jan

