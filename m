Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2804B697887
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 09:57:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495767.766190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSDaZ-0006NY-KS; Wed, 15 Feb 2023 08:56:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495767.766190; Wed, 15 Feb 2023 08:56:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSDaZ-0006L0-HT; Wed, 15 Feb 2023 08:56:31 +0000
Received: by outflank-mailman (input) for mailman id 495767;
 Wed, 15 Feb 2023 08:56:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pSDaX-0006Ku-Oy
 for xen-devel@lists.xenproject.org; Wed, 15 Feb 2023 08:56:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pSDaT-0004a7-At; Wed, 15 Feb 2023 08:56:25 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225] helo=[10.85.33.158])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pSDaT-000749-3P; Wed, 15 Feb 2023 08:56:25 +0000
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
	bh=ChXxNLgZrt8cs+YdRM5CSWoalFYptnizjkAY8RQ3toU=; b=F3XfCPN6Cu9I3f5gDQHabwHfhK
	wL9Nw4T/z92a5vFwsG/BM0tHYgM72w8aQ0tX8itpLeG4VUfpmaH3PIC2CaKfpH/4j2ikoZln+uxC+
	h5J6IfhUvCgL2yO8DEHD6+/2h1SS+c1blyFegOBwNCY2QEv9BdnMxa3dd20+AUhG/N+A=;
Message-ID: <cd1fc5e2-7af6-3945-2d64-8bf2f728f633@xen.org>
Date: Wed, 15 Feb 2023 08:56:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.1
Subject: Re: [PATCH 2/2] xen/misra: add entries to exclude-list.json
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Jan Beulich <jbeulich@suse.com>
Cc: Luca Fancellu <luca.fancellu@arm.com>, wei.chen@arm.com,
 bertrand.marquis@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Michal Orzel
 <michal.orzel@amd.com>, Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230214085635.3170962-1-luca.fancellu@arm.com>
 <20230214085635.3170962-3-luca.fancellu@arm.com>
 <b893c489-53e1-7e23-c3c8-9fd6bc846e5d@suse.com>
 <alpine.DEB.2.22.394.2302141415520.2025117@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2302141415520.2025117@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 14/02/2023 22:25, Stefano Stabellini wrote:
>> Patch 1's example has a "comment" field, which no entry makes use of.
>> Without that, how does it become clear _why_ a particular file is to
>> be excluded? The patch description here also doesn't provide any
>> justification ...
> 
> It would be good to have a couple of pre-canned justifications as the
> reason for excluding one file could be different from the reason for
> excluding another file. Some of the reasons:

I think the reasons should be ambiguous. This is ...

> - imported from Linux

... the case here but...

This reason is pretty clear to me but...

> - too many false positives

... not here. What is too many?

> 
> 
> That said, we don't necessarily need to know the exact reason for
> excluding one file to be able to start scanning xen with cppcheck
> automatically. If someone wants to remove a file from the exclude list
> in the future they just need to show that cppcheck does a good job at
> scanning the file and we can handle the number of violations.

I disagree. A good reasoning from the start will be helpful to decide 
when we can remove a file from the list. Furthermore, we need to set 
good example for any new file we want to exclude.

Furthermore, if we exclude some files, then it will be difficult for the 
reviewers to know when they can be removed from the list. What if this 
is fine with CPPCheck but not EClair (or any other)?

> 
> I take that with this exclude list, not accounting for rule 20.7,
> cppcheck reports zero violations overall?

So the goal right now is to have zero violations from the start? 
Shouldn't it instead be that we don't increase the number violations?

If so, we would want a baseline including the files that have "too many 
violation". The advantage is it will be easier to reduce the violations 
in small chunk and the reviewer can confirm that a patch help.

Cheers,

-- 
Julien Grall

