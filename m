Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C456372B03
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 15:28:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122389.230838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldv5z-0002xY-LP; Tue, 04 May 2021 13:28:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122389.230838; Tue, 04 May 2021 13:28:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldv5z-0002x9-I7; Tue, 04 May 2021 13:28:15 +0000
Received: by outflank-mailman (input) for mailman id 122389;
 Tue, 04 May 2021 13:28:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1gXq=J7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ldv5x-0002wz-VB
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 13:28:13 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eb30eb11-e99d-4291-9783-5a5d3127cae0;
 Tue, 04 May 2021 13:28:12 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1C885AF2F;
 Tue,  4 May 2021 13:28:12 +0000 (UTC)
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
X-Inumbo-ID: eb30eb11-e99d-4291-9783-5a5d3127cae0
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620134892; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AaFdGfB8BZpSS75FzAWGpKYG+lMXN2kqMmw3gSrRoSo=;
	b=fcJ8k92/e/CFi0J1rMoovhZYquKhkQeAtXHNHCk8aQoqplc/lBZ0oohvfwaRUZ+4yN8CC5
	oPHN/GY1ay+5jxN0AqCSw+4yOWN0bnQER/E7BWsU/cgYbvA/P2DUEtFNvpDb2/swJiJ5oN
	ki0Vwr+kAOmVAcxmZugGjalxkF+fddo=
Subject: Re: [PATCH v4 3/3] docs/doxygen: doxygen documentation for
 grant_table.h
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>, wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210504094606.7125-1-luca.fancellu@arm.com>
 <20210504094606.7125-4-luca.fancellu@arm.com>
 <37e5b461-40fe-ac78-59b9-033ff8cdc6d1@suse.com>
 <1853929B-AC45-42AF-8FE4-7B23C700B2E2@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e3f816df-a3ee-f880-ad6f-68c9cc2db517@suse.com>
Date: Tue, 4 May 2021 15:28:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <1853929B-AC45-42AF-8FE4-7B23C700B2E2@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 04.05.2021 15:09, Luca Fancellu wrote:
>> On 4 May 2021, at 12:48, Jan Beulich <jbeulich@suse.com> wrote:
>> On 04.05.2021 11:46, Luca Fancellu wrote:
>>> @@ -451,11 +466,6 @@ DEFINE_XEN_GUEST_HANDLE(gnttab_transfer_t);
>>>  * bytes to be copied.
>>>  */
>>>
>>> -#define _GNTCOPY_source_gref      (0)
>>> -#define GNTCOPY_source_gref       (1<<_GNTCOPY_source_gref)
>>> -#define _GNTCOPY_dest_gref        (1)
>>> -#define GNTCOPY_dest_gref         (1<<_GNTCOPY_dest_gref)
>>> -
>>> struct gnttab_copy {
>>>     /* IN parameters. */
>>>     struct gnttab_copy_ptr {
>>> @@ -471,6 +481,12 @@ struct gnttab_copy {
>>>     /* OUT parameters. */
>>>     int16_t       status;
>>> };
>>> +
>>> +#define _GNTCOPY_source_gref      (0)
>>> +#define GNTCOPY_source_gref       (1<<_GNTCOPY_source_gref)
>>> +#define _GNTCOPY_dest_gref        (1)
>>> +#define GNTCOPY_dest_gref         (1<<_GNTCOPY_dest_gref)
>>
>> Didn't you say you agree with moving this back up some, next to the
>> field using these?
> 
> My mistake! I’ll move it in the next patch, did you spot anything else I might have forgot of what we agreed?

No, thanks. I don't think I have any more comments to make on this
series (once this last aspect got addressed, and assuming no new
issues get introduced). But to be clear on that side as well - I
don't think I'm up to actually ack-ing the patch (let alone the
entire series).

Jan

