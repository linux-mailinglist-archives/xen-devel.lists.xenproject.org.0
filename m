Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EBA7C8937
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 17:56:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616743.958964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrKWJ-0008QN-Aw; Fri, 13 Oct 2023 15:56:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616743.958964; Fri, 13 Oct 2023 15:56:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrKWJ-0008Ny-86; Fri, 13 Oct 2023 15:56:11 +0000
Received: by outflank-mailman (input) for mailman id 616743;
 Fri, 13 Oct 2023 15:56:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qrKWH-0008Ns-JT
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 15:56:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qrKWE-0004vf-GK; Fri, 13 Oct 2023 15:56:06 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qrKWE-00064H-7r; Fri, 13 Oct 2023 15:56:06 +0000
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
	bh=GFWC1CR/QpRRePL+0y4n3jLIotx0DNsKOQyNvZClT9Q=; b=uUbFa4Vf+YXVLsZS4op/qamZW/
	A1hrnUvlOp8jD7KEtvPFVtHmef416ssNWpaFiGb4CusDVN4iay1wsEVbhbSWE65VqzZ0JCtfXyWd8
	wzUtJtktdr4xefrnl0S51+8hEGLuUHTMRvi3lZHZCULI90TlqJhb353M6nVDppf4pA8o=;
Message-ID: <a1c3de32-7fcb-4c3d-a95b-7aa58c493f52@xen.org>
Date: Fri, 13 Oct 2023 16:56:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen 4.18 release: Reminder about code freeze
Content-Language: en-GB
To: George Dunlap <george.dunlap@cloud.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Henry Wang <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Jan Beulich
 <jbeulich@suse.com>, "jgross@suse.com" <jgross@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 "community.manager@xenproject.org" <community.manager@xenproject.org>
References: <AS8PR08MB7991D1099E32CC9F03B0E0F692FCA@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2309271603590.1403502@ubuntu-linux-20-04-desktop>
 <a31ce6cb-6234-5e7f-5cd4-ed190f029811@citrix.com>
 <alpine.DEB.2.22.394.2309271658500.1403502@ubuntu-linux-20-04-desktop>
 <CA+zSX=ZbeUFrfAUJShooJFJ+d89f4xdXfJJ9HoJKRh4UStkTFQ@mail.gmail.com>
 <alpine.DEB.2.22.394.2310121535580.3431292@ubuntu-linux-20-04-desktop>
 <CA+zSX=Y5dMVFM6dVNgBRHxKc0C1e5WGgweQ0FaXXCfAFGH1aPA@mail.gmail.com>
 <a93839b8-932a-4634-9549-081df950afb2@xen.org>
 <CA+zSX=a972GC=_FKK2eGkArPb6RszCHDN0+6JKFJiMjoMpAySQ@mail.gmail.com>
 <f973db5f-da72-4aa2-a35e-1e6652b181bf@xen.org>
 <CA+zSX=bpq6sJmP7TzC+3vgTJyZcCdZc5M-BGEaOkkXt7BoQZJg@mail.gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CA+zSX=bpq6sJmP7TzC+3vgTJyZcCdZc5M-BGEaOkkXt7BoQZJg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 13/10/2023 14:30, George Dunlap wrote:
> On Fri, Oct 13, 2023 at 2:00 PM Julien Grall <julien@xen.org> wrote:
>>>>> If the problem is the delay between the xenevtchn_notify() in
>>>>> introduce_domain() and the domain_conn_reset() afterwards in
>>>>> do_domain(), would it make sense instead to move the notification into
>>>>> do_introduce(), after the domain_conn_reset()?  It is, after all, in
>>>>> response to XS_INTRODUCE that we want to send the notification, not in
>>>>> dom0_init() or read_state_connection() (which seems to be more about
>>>>> restoring a domain).
>>>>
>>>> I understand that the event channel notification was specifically added
>>>> for dom0less. But I don't see why we don't want to send it to dom0 as well.
>>>>
>>>> Technically, dom0 has exactly the same problem as dom0less domains it
>>>> boots before Xenstored is running and therefore it may need to know when
>>>> it is ready to receive commands.
>>>
>>> It seemed to work fine before 2022, when the notification was
>>> introduced.
>>
>> Indeed. But my point is that in theory the behavior between dom0 and
>> dom0less domain should not be different. With your proposal we would
>> continue to diverge with seems rather strange.
>>
>> Do you at least agree that on the paper, Xenstored should notify it is
>> ready to accept commands the same way for every domain?
> 
> I don't know enough about the start-of-day to know why dom0 did fine
> without a notification for nearly 20 years, but dom0less domUs don't.
> To answer your question I'd need the documentation that Andrew wants;
> or at least the answers to the two questions which you deferred to
> Juergen.  I assume that dom0 doesn't really need it, because it did
> fine without it; I assume that dom0less domUs do really need it,
> because otherwise people wouldn't have spent the effort to introduce
> it.
> 
>>> Personally I'd just take the patch as I wrote it, restoring dom0's
>>> pre-2022 behavior (after review and testing of course); but if you
>>> wanted to test & resubmit with a similar notification inside
>>> dom0_init(), I wouldn't object to it.
>>
>> Just to clarify, you suggest the revert because you are concerned that
>> it could break dom0. Is that correct?
> 
> I'm not sure why you're calling it a revert.  

Because we are going to remove a behavior that is present in at least a 
release. So...

> The initial patch that
> introduced it didn't mention wanting to include dom0 specifically; on
> the contrary it said:
> 
> "The extra notification is harmless for domains that don't require it."

... even if this is what the commit message says, we can't tell whether 
someone would start to rely on it. I definitely see use-cases for it.

But I agree that the chance they are actualy used is slim as we didn't 
document it.

> 
> My reasons for leaving dom0 notification out of my patch were:
> 
> 1. It's awkward to keep the dom0 notification without doing a lot of
> refactoring (which should be avoided at this point in the release) or
> making things kind of ugly and difficult to maintain (lots of specific
> if statements)
> 
> 2. Since dom0 did fine for 20 years without it, it seemed that it
> wasn't necessary
> 
> 3. Since nobody seems to actually know what's going on, there's a
> chance it's actually harmful (although that chance is relatively
> small, given the amount of time the extra notification has been in the
> tree).

Your reasoning makes sense. I don't fully agree with it, but at the end 
of the day we need to have a solution for dom0less guests... So if the 
others agree with you, then I will disagree and commit.

That said, I think the commit message should explain why removing dom0 
notification is ok.

Cheers,

-- 
Julien Grall

