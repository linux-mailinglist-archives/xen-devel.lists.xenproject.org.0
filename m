Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AACB647137
	for <lists+xen-devel@lfdr.de>; Thu,  8 Dec 2022 14:59:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.457181.715051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3HQF-0008JH-JG; Thu, 08 Dec 2022 13:58:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 457181.715051; Thu, 08 Dec 2022 13:58:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3HQF-0008GS-G6; Thu, 08 Dec 2022 13:58:47 +0000
Received: by outflank-mailman (input) for mailman id 457181;
 Thu, 08 Dec 2022 13:58:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p3HQE-0008GL-V2
 for xen-devel@lists.xenproject.org; Thu, 08 Dec 2022 13:58:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p3HQE-0001lX-8f; Thu, 08 Dec 2022 13:58:46 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239] helo=[192.168.4.36])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p3HQE-0001ov-1O; Thu, 08 Dec 2022 13:58:46 +0000
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
	bh=t0b0iCUbDhSN+c+FZPBcFhKj7dAPNsgaDaM85bezckg=; b=ooDbe3J1ISJ1AR+c5rziKmHvjs
	yumapVV14unS3oUEXh2SUKIJPOE/Wb8EdAuFOxPH/NLkJWrxHWjzsJjCgLDsmw68fY+tCbvBHBqpi
	Ev2qSRAlkvagN9PLH/OfFUDCXIZ9U7x4mP9DhfFmVqBv2bs/B0Qt2a0kmD9crWIT93bE=;
Message-ID: <9b8cace3-1593-8400-0633-da04f12b9849@xen.org>
Date: Thu, 8 Dec 2022 13:58:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH] MAINTAINERS: Clarify check-in requirements for
 mixed-author patches
Content-Language: en-US
To: George Dunlap <george.dunlap@cloud.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20221208104924.76637-1-george.dunlap@cloud.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221208104924.76637-1-george.dunlap@cloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi George,

On 08/12/2022 10:49, George Dunlap wrote:
> From: George Dunlap <george.dunlap@citrix.com>
> 
> There was a question raised recently about the requriements for

Typo: s/requriements/requirements/

> checking in a patch which was originally written by one maintainer,
> then picked up and modified by a second maintainer, and which they now both
> agree should be checked in.
> 
> It was proposed that in that case, the following set of tags would suffice:
> 
>     Signed-off-by: First Author <...>
>     Signed-off-by: Second Author <...>
>     Reviewed-by: First Author <...>
> 
> The rationale was as follows:
> 
> 1. The patch will be a mix of code, whose copyright is owned by the
> various authors (or the companies they work for).  It's important to
> keep this information around in the event, for instance, of a license
> change or something else requiring knowledge of the copyright owner.
> 
> 2. The Signed-off-by of the Second Author approves not only their own
> code, but First Author's code; the Reviewed-by of the First Author
> approves not only their own code, but the Second Author's code.  Thus
> all the code has been approved by a maintainer, as well as someone who
> was not the author.
> 
> In support of this, several arguments were put forward:
> 
> * We shouldn't make it harder for maintainers to get their code in
>    than for non-maintiners

Typo: s/non-maintiners/maintainers/

> 
> * The system we set up should not add pointless bureaucracy; nor
>    discourage collaboration; nor encourage contributors to get around
>    the rules by dropping important information.  (For instance, by
>    removing the first SoB, so that the patch appears to have been
>    written entirely by Second Author.)
> 
> Concerns were raised about two maintainers from the same company
> colluding to get a patch in from their company; but such maintainers
> could already collude, by working on the patch in secret, and posting
> it publicly with only a single author's SoB, and having the other
> person review it.
> 
> There's also something slightly strange about adding "Reviewed-by" to
> code that you've written; but in the end you're reviewing not only the
> code itself, but the final arrangement of it.  There's no need to
> overcomplicate things.
> 
> Encode this in MAINTAINERS as follows:
> 
> * Refine the wording of requirement #2 in the check-in policy; such
> that *each change* must have approval from someone other than *the
> person who wrote it*.
> 
> * Add a paragraph explicitly stating that the multiple-SoB-approval
>    system satisfies the requirements, and why.
> 
> Signed-off-by: George Dunlap <george.dunlap@cloud.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Somewhat unrelated. I see you switched to you @cloud.com e-mails. Are 
the @citrix.com to work in the future? If not, then you (and other from 
citrix) may want to send an e-mail to update MAINTAINERS accordingly.

Cheers,

-- 
Julien Grall

