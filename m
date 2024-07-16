Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A73D932121
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2024 09:22:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.759364.1169061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTcVk-0003kW-R0; Tue, 16 Jul 2024 07:22:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759364.1169061; Tue, 16 Jul 2024 07:22:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTcVk-0003j1-Nx; Tue, 16 Jul 2024 07:22:08 +0000
Received: by outflank-mailman (input) for mailman id 759364;
 Tue, 16 Jul 2024 07:22:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sTcVi-0003it-VN
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2024 07:22:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sTcVg-0007MZ-TK; Tue, 16 Jul 2024 07:22:04 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.244])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sTcVg-0001hN-OF; Tue, 16 Jul 2024 07:22:04 +0000
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
	bh=4yqsR1PFKnBq/x9zDUbQI1eDoRBmOzOd+x+B7GtZprM=; b=Pbqaw2ktVA6brU059L2bXu+N+r
	re7LGo6UE0qx0j74APzs4hL5UiB4AJel+/eX2wRlqlfipi4BMwtZqYgV2nb0vrmwXSSZx8OL2sBmT
	VtLdqivJ+mkRBCrfAvkPoLMZvGI1rTQjq88Z+CjjALas/I1ZgC1SUmT5Z4pKbJQVd2HU=;
Message-ID: <884ea922-946c-4344-ab29-6f2eb4be69f7@xen.org>
Date: Tue, 16 Jul 2024 08:22:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] docs/checklist: Fix XEN_EXTRAVERSION
 inconsistency for release candidates
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240715155051.3375999-1-andrew.cooper3@citrix.com>
 <3b188f84-50f7-4e13-bcde-1d6076e5cc2d@xen.org>
 <423412a9-e969-4126-8e39-7e77e67d2fd8@suse.com>
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
In-Reply-To: <423412a9-e969-4126-8e39-7e77e67d2fd8@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 16/07/2024 07:47, Jan Beulich wrote:
> On 15.07.2024 18:56, Julien Grall wrote:
>> On 15/07/2024 16:50, Andrew Cooper wrote:
>>> An earlier part of the checklist states:
>>>
>>>     * change xen-unstable README. The banner (generated using figlet) should say:
>>>         - "Xen 4.5" in releases and on stable branches
>>>         - "Xen 4.5-unstable" on unstable
>>>         - "Xen 4.5-rc" for release candidate
>>>
>>> Update the notes about XEN_EXTRAVERSION to match.
>>
>> We have been tagging the tree with 4.5.0-rcX. So I think it would be
>> better to update the wording so we use a consistent naming.
> 
> I find:
> 
> 4.18-rc
> 4.17-rc
> 4.16-rc
> 4.15-rc

Hmmm... I don't think we are looking at the same thing. I was 
specifically looking at the tag and *not* XEN_EXTRAVERSION.

42sh> git tag | grep rc

3.0.2-rc
3.2.0-rc1
3.2.0-rc2
3.2.0-rc3
3.2.0-rc4
3.2.0-rc5
3.2.0-rc6
3.3.0-rc1
3.3.0-rc2
[...]
4.14.0-rc1
4.14.0-rc2
4.14.0-rc3
4.14.0-rc4
4.14.0-rc5
4.15.0-rc1
4.15.0-rc2
4.15.0-rc3
4.15.0-rc4
4.15.0-rc5
4.16.0-rc1
4.16.0-rc2
4.16.0-rc3
4.16.0-rc4
4.17.0-rc1
4.17.0-rc2
4.17.0-rc3
4.17.0-rc4
4.18.0-rc1
4.18.0-rc2
4.18.0-rc3

> 
> Do I need to go any further? Your 4.5 example also doesn't fully fit because
> at that time we were, in addition, still appending RC numbers (up to and
> including 4.9 as it looks). In 4.10 it then (intermediately) indeed was
> 4.10.0-rc. In 4.11 it became 4.11-rc.

See above.

> 
> That said I wouldn't strictly mind the .0 infix. It's just that imo shorter
> is better, and the .0 doesn't really convey any useful information anymore
> now that we don't do / tag stable release RCs any longer.

So you are arguing for shortening the name. I am arguing for consistency 
across the naming. We can do both, but we would need to tag the tree 
with "4.X-rcY".

Cheers,

-- 
Julien Grall

