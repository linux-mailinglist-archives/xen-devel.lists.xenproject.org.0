Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DFE2AD740
	for <lists+xen-devel@lfdr.de>; Tue, 10 Nov 2020 14:15:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.23369.50060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcTUL-0001ap-FF; Tue, 10 Nov 2020 13:15:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 23369.50060; Tue, 10 Nov 2020 13:15:09 +0000
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
	id 1kcTUL-0001aQ-Bo; Tue, 10 Nov 2020 13:15:09 +0000
Received: by outflank-mailman (input) for mailman id 23369;
 Tue, 10 Nov 2020 13:15:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xL7T=EQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kcTUJ-0001aI-Qp
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 13:15:07 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b251ff40-e675-4d8f-a5bc-bc5231568bde;
 Tue, 10 Nov 2020 13:15:04 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EEF06ABD6;
 Tue, 10 Nov 2020 13:15:03 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xL7T=EQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kcTUJ-0001aI-Qp
	for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 13:15:07 +0000
X-Inumbo-ID: b251ff40-e675-4d8f-a5bc-bc5231568bde
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id b251ff40-e675-4d8f-a5bc-bc5231568bde;
	Tue, 10 Nov 2020 13:15:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605014104;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9si9W8u3F5evKhqgh7QdWPPNH2bY3QcqUEHMhYPU1/E=;
	b=jD0NgWRKHWzNdaoTjpLMEkQomSF1Pu/l5zZyhOX7n9ElgTP4siIFKr2a4rt0rR4kqrlH9o
	FhytsiO8yAID36HRAG3b8BU6RsyghqVvL/2eBHdMFyGDmXh0lIAqzqb8liXYMj3DlfUPpj
	X8CNeHK8pzeG/oy5q4SELJT8SUmTazk=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id EEF06ABD6;
	Tue, 10 Nov 2020 13:15:03 +0000 (UTC)
Subject: Re: [PATCH] docs: fix documentation to notice credit2 is the default
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20201110112118.99960-1-roger.pau@citrix.com>
 <b9ca219d-b6d7-9f59-3ede-9b4c9225e01b@suse.com>
 <20201110124900.2hjgn45i7ynf33p3@Air-de-Roger>
 <035d10c0-2774-8d1c-b55f-e075f04344e7@citrix.com>
 <20d3ee40-950f-e4f9-00d0-a5274c17771f@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1e44b5b1-7406-c459-eac5-78af76ccbf34@suse.com>
Date: Tue, 10 Nov 2020 14:15:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <20d3ee40-950f-e4f9-00d0-a5274c17771f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 10.11.2020 14:13, Jürgen Groß wrote:
> On 10.11.20 14:07, Andrew Cooper wrote:
>> On 10/11/2020 12:49, Roger Pau Monné wrote:
>>> On Tue, Nov 10, 2020 at 12:31:14PM +0100, Jürgen Groß wrote:
>>>> On 10.11.20 12:21, Roger Pau Monne wrote:
>>>>> Fix the command line document to account for credit2 now being the
>>>>> default scheduler.
>>>>>
>>>>> Fixes: dafd936dddbd ('Make credit2 the default scheduler')
>>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>>>> ---
>>>>>    docs/misc/xen-command-line.pandoc | 2 +-
>>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
>>>>> index 4ae9391fcd..789aead148 100644
>>>>> --- a/docs/misc/xen-command-line.pandoc
>>>>> +++ b/docs/misc/xen-command-line.pandoc
>>>>> @@ -1876,7 +1876,7 @@ with read and write permissions.
>>>>>    ### sched
>>>>>    > `= credit | credit2 | arinc653 | rtds | null`
>>>>> -> Default: `sched=credit`
>>>>> +> Default: `sched=credit2`
>>>>>    Choose the default scheduler.
>>>>>
>>>> Tried that before:
>>>>
>>>> https://lists.xen.org/archives/html/xen-devel/2019-01/msg01097.html
>>>>
>>>> And Andrew didn't like it...
>>> One way or another we need to get this fixed in the document. Listing
>>> credit as the still the default is wrong.
>>
>> I agree that what is there is wrong, but so is saying credit2.
>>
>> This documentation is for users, because develops know exactly how they
>> configured their schedulers, and won't actually need to refer to it.
>>
>> As a consequence, it depends heavily on what a specific
>> distro/downstream chose, config-wise.
>>
>>> I think there are several places in xen-command-line.pandoc that just
>>> contain the default values set in Kconfig, so IMO if we want to
>>> change this it should be done wholesale rather than picking on every
>>> default value change. Opinions?
>>
>> xen-command-line.pandoc wholly predates Kconfig.  We're only in this
>> mess because previous patches haven't been appropriately reviewed.
>>
>> Lets fix it up to be correct, but lets not delay fixing this to look for
>> potential other cases.
> 
> The ultimate fix would be to generate this document according to
> Kconfig settings. :-D

Except that's not suitable for putting up as a web page for
everyone to use as "cannoical" reference. Every distro could
do so, sure.

Jan

