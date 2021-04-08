Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0AC357C10
	for <lists+xen-devel@lfdr.de>; Thu,  8 Apr 2021 07:59:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107032.204581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUNhB-0007qL-P5; Thu, 08 Apr 2021 05:59:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107032.204581; Thu, 08 Apr 2021 05:59:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUNhB-0007pw-LT; Thu, 08 Apr 2021 05:59:13 +0000
Received: by outflank-mailman (input) for mailman id 107032;
 Thu, 08 Apr 2021 05:59:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e/uL=JF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lUNhA-0007pr-LN
 for xen-devel@lists.xenproject.org; Thu, 08 Apr 2021 05:59:12 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 95d2a5ac-4fa1-4e45-a4f7-78348abf45cf;
 Thu, 08 Apr 2021 05:59:11 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C9A49AFF0;
 Thu,  8 Apr 2021 05:59:10 +0000 (UTC)
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
X-Inumbo-ID: 95d2a5ac-4fa1-4e45-a4f7-78348abf45cf
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617861550; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vC86PYGgQMb1wZaGNQa7XS4J1uayXt8bj0eXJ/Vtguk=;
	b=SlC5Zl0hivgWapOQTNsaLWwT5YKQj4ReWhi9CR2e+Ny1A6mDv2eoxjRiVxp+kYBaH4X8g0
	kNOtEhZjHtC8AW6jlBt2RFOWDYPbf51HxAHBgemmJ/hL4jpX8aXLmqar4/DG2okGQ0BPrp
	0JxtufVVglYxNdg0XH8esWfVUO/aLP0=
Subject: Re: [PATCH 3/3] docs/doxygen: doxygen documentation for grant_table.h
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Luca Fancellu <luca.fancellu@arm.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210406103603.8530-1-luca.fancellu@arm.com>
 <20210406103603.8530-4-luca.fancellu@arm.com>
 <073e28bc-ad94-429d-6384-744864d12b57@suse.com>
 <alpine.DEB.2.21.2104061425040.31460@sstabellini-ThinkPad-T480s>
 <e15ed7b9-b153-b767-e625-e7a9d2aa76bf@suse.com>
 <DF5BE432-F79E-4874-92DF-60A4DCD9EDBD@arm.com>
 <5cad4ffb-44ec-4cde-f5bb-f59dc3ca59ca@suse.com>
 <alpine.DEB.2.21.2104071424190.31460@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fff2bc3a-701a-51e4-59fe-b26261c6c6bc@suse.com>
Date: Thu, 8 Apr 2021 07:59:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2104071424190.31460@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 07.04.2021 23:26, Stefano Stabellini wrote:
> On Wed, 7 Apr 2021, Jan Beulich wrote:
>> On 07.04.2021 10:42, Luca Fancellu wrote:
>>> Just to be sure that we are in the same page, are you suggesting to modify the name
>>> In this way?
>>>
>>> struct gnttab_cache_flush {
>>> -    union {
>>> +    union xen_gnttab_cache_flush_a {
>>>         uint64_t dev_bus_addr;
>>>         grant_ref_t ref;
>>>     } a;
>>>
>>> Following this kind of pattern: xen_<upper struct name>_<member name> ?
>>
>> While in general I would be fine with this scheme, for field names like
>> "a" or "u" it doesn't fit well imo.
> 
> "a" is a bad name anyway, even for the member. We can take the
> opportunity to find a better name. Almost anything would be better than
> "a". Maybe "refaddr"?

We need to be careful with changing _anything_ in the public interface.
Consumers importing our headers directly (as was e.g. done for the old
linux-2.6.18-xen.hg tree) could break with a field name change as much
as with any other changes to what had been made available to them.

Jan

