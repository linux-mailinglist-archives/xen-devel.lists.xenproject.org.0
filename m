Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5DC372DD2
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 18:15:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122563.231156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldxh5-00043J-5U; Tue, 04 May 2021 16:14:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122563.231156; Tue, 04 May 2021 16:14:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldxh5-00042u-2O; Tue, 04 May 2021 16:14:43 +0000
Received: by outflank-mailman (input) for mailman id 122563;
 Tue, 04 May 2021 16:14:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1gXq=J7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ldxh3-000422-CU
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 16:14:41 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e7ecddd5-e8a9-49bb-a161-748115da0f87;
 Tue, 04 May 2021 16:14:40 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3416AB1A6;
 Tue,  4 May 2021 16:14:39 +0000 (UTC)
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
X-Inumbo-ID: e7ecddd5-e8a9-49bb-a161-748115da0f87
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620144879; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xW1+wKt2bKdnpd6LFoRvJpieoTt7d2HR0ECbtlV39XE=;
	b=QirFRRnIpP+btT0j59d9nu/4h6xSnC+3HlphhpdtPUKxkHEJtc2F8BY+uApX00g8M7FAX6
	9mvCe4WLSZLDRzD20jkoFQwOUZVd2D2LOLFkxYtvFfCX5mBnL4mJBeOPDeRKtjGtXq73UL
	CcwKM2GHyoGs/fSdFTyiHqSB5ueFLDw=
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
 <e3f816df-a3ee-f880-ad6f-68c9cc2db517@suse.com>
 <5D19A76C-DBD5-463D-975C-65FBDA0297C4@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c910c146-453c-23e5-e2df-0b8790fb3624@suse.com>
Date: Tue, 4 May 2021 18:14:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <5D19A76C-DBD5-463D-975C-65FBDA0297C4@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 04.05.2021 15:33, Luca Fancellu wrote:
> 
> 
>> On 4 May 2021, at 14:28, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 04.05.2021 15:09, Luca Fancellu wrote:
>>>> On 4 May 2021, at 12:48, Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 04.05.2021 11:46, Luca Fancellu wrote:
>>>>> @@ -451,11 +466,6 @@ DEFINE_XEN_GUEST_HANDLE(gnttab_transfer_t);
>>>>> * bytes to be copied.
>>>>> */
>>>>>
>>>>> -#define _GNTCOPY_source_gref      (0)
>>>>> -#define GNTCOPY_source_gref       (1<<_GNTCOPY_source_gref)
>>>>> -#define _GNTCOPY_dest_gref        (1)
>>>>> -#define GNTCOPY_dest_gref         (1<<_GNTCOPY_dest_gref)
>>>>> -
>>>>> struct gnttab_copy {
>>>>>    /* IN parameters. */
>>>>>    struct gnttab_copy_ptr {
>>>>> @@ -471,6 +481,12 @@ struct gnttab_copy {
>>>>>    /* OUT parameters. */
>>>>>    int16_t       status;
>>>>> };
>>>>> +
>>>>> +#define _GNTCOPY_source_gref      (0)
>>>>> +#define GNTCOPY_source_gref       (1<<_GNTCOPY_source_gref)
>>>>> +#define _GNTCOPY_dest_gref        (1)
>>>>> +#define GNTCOPY_dest_gref         (1<<_GNTCOPY_dest_gref)
>>>>
>>>> Didn't you say you agree with moving this back up some, next to the
>>>> field using these?
>>>
>>> My mistake! I’ll move it in the next patch, did you spot anything else I might have forgot of what we agreed?
>>
>> No, thanks. I don't think I have any more comments to make on this
>> series (once this last aspect got addressed, and assuming no new
>> issues get introduced). But to be clear on that side as well - I
>> don't think I'm up to actually ack-ing the patch (let alone the
>> entire series).
> 
> Ok, at least would you mind to do a review by of the patches we discussed together?

I'm afraid I don't understand: I did look over this one.

Jan

