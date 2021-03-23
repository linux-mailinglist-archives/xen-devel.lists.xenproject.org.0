Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B2D3465DA
	for <lists+xen-devel@lfdr.de>; Tue, 23 Mar 2021 18:03:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100749.192157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOkQF-0004Sz-4C; Tue, 23 Mar 2021 17:02:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100749.192157; Tue, 23 Mar 2021 17:02:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOkQF-0004Sa-12; Tue, 23 Mar 2021 17:02:27 +0000
Received: by outflank-mailman (input) for mailman id 100749;
 Tue, 23 Mar 2021 17:02:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YFj+=IV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lOkQE-0004SU-A2
 for xen-devel@lists.xenproject.org; Tue, 23 Mar 2021 17:02:26 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 18478468-362f-42bb-be53-d175361308a5;
 Tue, 23 Mar 2021 17:02:25 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 461E7AD4A;
 Tue, 23 Mar 2021 17:02:24 +0000 (UTC)
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
X-Inumbo-ID: 18478468-362f-42bb-be53-d175361308a5
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1616518944; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6WZPEt7+j7Dula8GKruSy3kfukKaToM3CKCXJX7/QoE=;
	b=OtIptgrT16Szsz3+mqKe9JvQh32/NiN9zW5m2Exs5RVcTXZcMwozetnT1mRrGLU/nGQAMC
	4+FasF8jlHwPfTYMbaUwU1QtlY22pL/8+73NaXe7g8bLlTuJQJ9ujKn/+l+4JqKkjVuGjg
	011h2vfK+BFQ9noszhII4o1fztKv4uc=
Subject: Re: [ANNOUNCE] Xen 4.15 - release status, branching tomorrow
To: Ian Jackson <iwj@xenproject.org>
Cc: xen-devel@lists.xenproject.org, community.manager@xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>, committers@xenproject.org,
 Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
 =?UTF-8?B?RnLDqWTDqXJpYyBQaWVycmV0?= <frederic.pierret@qubes-os.org>
References: <24666.1682.595069.435575@mariner.uk.xensource.com>
 <0bfab829-3841-b2cd-96f9-874340cf75c2@suse.com>
 <24666.7414.232768.961456@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f0c1df6d-2fcc-11b7-1a90-9a0aa2019686@suse.com>
Date: Tue, 23 Mar 2021 18:02:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <24666.7414.232768.961456@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 23.03.2021 17:53, Ian Jackson wrote:
> Jan Beulich writes ("Re: [ANNOUNCE] Xen 4.15 - release status, branching tomorrow"):
>> On 23.03.2021 16:17, Ian Jackson wrote:
>>>   I think it may be time to reconcile ourselves to not fixing this,
>>>   and deciding on a suitable plan B.  Do we need to put something in
>>>   the release notes, or SUPPORT.md, or implement a mitigation of some
>>>   kind ?
>>
>> One option of course is, like was just done for 4.13.3, to revert.
>> Iirc Andrew had some thoughts towards making the new piece of code
>> conditional upon the original issue actually hitting.
> 
> I would be very happy to consider a revert it someone would give me
> references and explain to me the implications in words of one
> syllable.

Reference: e1de4c196a2e "x86/timer: Fix boot on Intel systems using
ITSSPRC static PIT clock gating"

Reverting would unbreak Xen on the Ryzen 1800X system where the
breakage was reported for, and likely a few others. It would at the
same time re-introduce Xen failing to boot on at least some Icelake
(and yet newer) systems.

>> Another
>> (somewhat similar) option might be to hide the new piece of code
>> behind a default-off command line option.
> 
> Likewise.

Well, not sure what to say here. Introducing a command line option
to allow making Icelake systems boot (by use of the option) while
keeping things working by default on older hardware is about as
simple as an explanation here can get, I guess.

Jan

