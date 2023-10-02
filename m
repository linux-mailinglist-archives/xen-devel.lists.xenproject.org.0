Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 966C87B4D63
	for <lists+xen-devel@lfdr.de>; Mon,  2 Oct 2023 10:44:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.611215.950677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnEWY-0007xJ-Vz; Mon, 02 Oct 2023 08:43:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 611215.950677; Mon, 02 Oct 2023 08:43:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnEWY-0007vL-R1; Mon, 02 Oct 2023 08:43:30 +0000
Received: by outflank-mailman (input) for mailman id 611215;
 Mon, 02 Oct 2023 08:43:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qnEWY-0007vF-2i
 for xen-devel@lists.xenproject.org; Mon, 02 Oct 2023 08:43:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qnEWW-0007Py-Np; Mon, 02 Oct 2023 08:43:28 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qnEWW-0005bW-GT; Mon, 02 Oct 2023 08:43:28 +0000
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
	bh=KZTZ5StwX/lyBxdwf/CA/WEv6ejGNlH5tmDFkA+CRUo=; b=VIU5hkhvJYwRhfc8KimJbb8CqB
	ecOMyvjW7uCAgv8RjUo/6BbaAOV8Vt69lt9phfYiCZivSZYPPSm7+4GMrFNZ8fkayLsab9CiJyH1N
	M6EeAni7hBuuUQ7PbEl+4LcfGv2B75ep9dzalCS9W+i2Q5Q0H16wjEqW+maZIGB7eLlQ=;
Message-ID: <bee6b147-214d-4f8b-9a50-e9321ea29444@xen.org>
Date: Mon, 2 Oct 2023 09:43:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] Update Xen version to 4.18-rc
Content-Language: en-GB
To: Henry Wang <Henry.Wang@arm.com>, Juergen Gross <jgross@suse.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <jgrall@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20230929075857.87092-1-julien@xen.org>
 <20230929075857.87092-3-julien@xen.org>
 <a0d6f669-1e1d-47ec-9670-a9e5c3d7f130@suse.com>
 <43F7D136-6C39-42C3-95E7-D1751A7B83D1@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <43F7D136-6C39-42C3-95E7-D1751A7B83D1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 29/09/2023 09:07, Henry Wang wrote:
> 
> 
>> On Sep 29, 2023, at 16:04, Juergen Gross <jgross@suse.com> wrote:
>>
>> On 29.09.23 09:58, Julien Grall wrote:
>>> From: Julien Grall <jgrall@amazon.com>
>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>> ---
>>>   README       | 16 ++++++++--------
>>>   SUPPORT.md   |  2 +-
>>>   xen/Makefile |  2 +-
>>>   3 files changed, 10 insertions(+), 10 deletions(-)
>>> diff --git a/README b/README
>>> index a491c8dce55b..f45e1ef1cdca 100644
>>> --- a/README
>>> +++ b/README
>>> @@ -1,11 +1,11 @@
>>> -###############################################
>>> -__  __            _  _    _  ___
>>> -\ \/ /___ _ __   | || |  / |( _ )
>>> - \  // _ \ '_ \  | || |_ | |/ _ \
>>> - /  \  __/ | | | |__   _|| | (_) |
>>> -/_/\_\___|_| |_|    |_|(_)_|\___/
>>> -
>>> -###############################################
>>> +#################################################
>>> +                  _  _    _  ___
>>> +__  _____ _ __   | || |  / |( _ )       _ __ ___
>>> +\ \/ / _ \ '_ \  | || |_ | |/ _ \ _____| '__/ __|
>>> + >  <  __/ | | | |__   _|| | (_) |_____| | | (__
>>> +/_/\_\___|_| |_|    |_|(_)_|\___/      |_|  \___|
>>> +
>>> +#################################################
>>
>> Is it on purpose to use "xen" instead of "Xen"?
> 
> I actually had the same question, but not sure if it really matters so didn’t
> add any comments… Do we have some convention on this? So far I
> have seen “xen”, “XEN” and “Xen” in different contexts.

I don't know if there are any convention. But we usually try to keep 
consistent within the same file.

In this case, the original word was with a uppercase 'x'. So I should 
have kept as-is.

Cheers,

-- 
Julien Grall

