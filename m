Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6592E621A87
	for <lists+xen-devel@lfdr.de>; Tue,  8 Nov 2022 18:26:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440378.694557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osSMl-0002CL-47; Tue, 08 Nov 2022 17:26:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440378.694557; Tue, 08 Nov 2022 17:26:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osSMl-0002AB-1R; Tue, 08 Nov 2022 17:26:27 +0000
Received: by outflank-mailman (input) for mailman id 440378;
 Tue, 08 Nov 2022 17:26:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1osSMk-0002A5-CL
 for xen-devel@lists.xenproject.org; Tue, 08 Nov 2022 17:26:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1osSMj-0004Ky-RS; Tue, 08 Nov 2022 17:26:25 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232] helo=[192.168.3.98])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1osSMj-0003gN-L0; Tue, 08 Nov 2022 17:26:25 +0000
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
	bh=pq+aovixWz5f+jUh/zfTLKQel4PuNHX91XIkvFXAIKw=; b=0VSossTVJiFzWPalVjJH1DH/iC
	AeWOdyuSKpUrTGIwfxaAtznffpJw9dEOQUyq/7ZraozENmngHqYVJxlH8pgQqNPO+57oFqoa8K/2n
	sJhNR8XYQN6WswWurnIqaGRZ9tIlv0Q9T/M/Pp/YQGVleUTLmgRs0lN8tL4pDG7rCtww=;
Message-ID: <1f8c90cd-8037-84eb-d6f7-c639f8a87585@xen.org>
Date: Tue, 8 Nov 2022 17:26:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH for-4.17 v3 07/15] CODING_STYLE(tools/ocaml): add 'make
 format' and remove tabs
Content-Language: en-US
To: Edwin Torok <edvin.torok@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Henry Wang <Henry.Wang@arm.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>
References: <cover.1667920496.git.edvin.torok@citrix.com>
 <16f52592270e36670947fbcbe1e4d91f1daf9823.1667920496.git.edvin.torok@citrix.com>
 <4baa6580-a779-f1e4-b504-59895fa97309@xen.org>
 <B27F889D-619C-4D34-92F0-AFB95DA84547@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <B27F889D-619C-4D34-92F0-AFB95DA84547@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 08/11/2022 17:02, Edwin Torok wrote:
> 
> 
>> On 8 Nov 2022, at 16:03, Julien Grall <julien@xen.org> wrote:
>>
>> Hi,
>>
>> On 08/11/2022 15:33, Edwin Török wrote:
>>> See CODING_STYLE: Xen uses spaces, not tabs.
>>> * OCaml code:
>>> Using `ocp-indent` for now to just make minimal modifications in
>>> tabs vs spaces and get the right indentation.
>>> We can introduce `ocamlformat` later.
>>> * C stubs:
>>> just replace tabs with spaces now, using `indent` or `clang-format`
>>> would change code too much for 4.17.
>>> This avoids perpetuating a formatting style that is inconsistent with
>>> the rest of Xen, and that makes preparing and submitting patches more
>>> difficult (OCaml indentation tools usually only support spaces, not tabs).
>>> Contains a bugfix for `abi-check` script to handle the change in the
>>> amount of whitespace.
>>> No functional change.
>>> Signed-off-by: Edwin Török <edvin.torok@citrix.com>
>>> --
>>> Reason for inclusion in 4.17:
>>> - makes it easier to backport changes from master to 4.17
>>
>> Right, but you will have the problem when backporting to 4.16 and older. So the overhead will always be there for a couple of years.
> 
> 
> There will always be more than one Xen release in support, which means we'd never be able to fix this.

Note that I haven't said this should never be done. This just need to be 
correctly timed. Doing it in the middle of a deep freeze doesn't look 
right to me.

[...]

>>> - avoid perpetuating a different coding style (I thought tabs were
>>>    mandated by Xen, and was about to fix up my editor config to match
>>>    when I realized Xen already mandates the use of spaces)
>>> - should make submitting patches for OCaml easier (OCaml indentation
>>>    tools know only about spaces, so I either can't use them, or have to
>>>    manually adjust indentation every time I submit a patch)
>>> - it can be verified that the only change here is the Makefile change
>>>    for the new rule, 'git log -p -1 -w' should be otherwise empty
>>
>> While I understand the goal and support, this seems to be a bit too late to do it in Xen 4.17 (we are only a couple of weeks away). At this stage of the release we should only do bug fix.
> 
> I think it can be fairly easily proven that there is no functional change by rerunning the make format command manually, and by looking at the diff with ignore whitespace as suggested above.

That's not really the point here. The point is that if we start to allow 
large coding style change (whether automatic or manual) very late in the 
release then it will be hard to reject it in the future.

In fact we already have guidelines for that. If you look at [1], only 
bug fixes should be done past the code freeze (23rd September).

As I wrote before, this patch only seem to be a cosmetic/quality 
improvement. IOW this is not a bug fix and would not qualify for 4.17.

> I understand the reluctance in including it (which is why I was not sure whether to post it in the first place), but I think it might be beneficial to do it.
> There is a large backlog of work in oxenstored that got piled up during the past couple of years of XSA work, and it'd be a lot easier to update and upstream those if we wouldn't have to worry
> about indentation at all.

This is an argument for including this patch in Xen 4.18. As I wrote 
above, I am not against that.

> 
> Usually patches on LCM and security branches are avoided to reduce the risk of breaking anything, but a reindentation patch should not really break anything (well other than the abi-check script in the build, but I fixed that to accept both ways).

What does LCM stands for?

> 
> One alternative would be that I add another step after reformat that runs sed and turns spaces back into tabs for now, and that way I can still run 'make format' at each step while preparing patches for master, or 4.17 or security patches and get something consistent, and that minimizes other whitespace changes, but it wouldn't completely eliminate them (e.g. there are pieces of code that are just wrongly indented, so there'd be at least a diff to fix all that).

I would view this as a feature. Which again doesn't qualify for Xen 4.17 
release. This doesn't mean the patch couldn't be backported afterwards.

Cheers,

[1] 
AS8PR08MB7991145C8063D6939AFFED8F92829@AS8PR08MB7991.eurprd08.prod.outlook.com

> 
> 
> Best regards,
> --Edwin
> 
>>
>> Cheers,
> 
> 
>>
>>
>> -- 
>> Julien Grall
> 

-- 
Julien Grall

