Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFCD63EE57
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 11:48:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450475.707756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0h6k-0008Ut-D7; Thu, 01 Dec 2022 10:47:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450475.707756; Thu, 01 Dec 2022 10:47:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0h6k-0008RR-AN; Thu, 01 Dec 2022 10:47:58 +0000
Received: by outflank-mailman (input) for mailman id 450475;
 Thu, 01 Dec 2022 10:47:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p0h6i-0008RJ-La
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 10:47:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p0h6i-000635-Jk
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 10:47:56 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.7.195]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p0h6i-0000YV-CZ; Thu, 01 Dec 2022 10:47:56 +0000
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
	bh=DEAF1xPv9xHDPshhCwfLeBeP27EoEPRKAeRyuOJ+J/A=; b=OPeS4fDMQr5Nf3UJy4GRUBEa6b
	ey5oCikijTTgUgPAsK3xaix2BA2AHbmMqPOJJckb8c8s9nJtHmBMQfTUbwFpBxNINElZbbRWpN/YB
	G8FgnhaztPHDu54tjseBwOvJ1JXQtxKZB0jhWaM/yuM1Nbw27hxA85scoDAouLn+toH4=;
Message-ID: <6a5af398-270b-f57c-091c-78ebea8630ec@xen.org>
Date: Thu, 1 Dec 2022 10:47:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH v1 5/5] CODING_STYLE: add .clang-format
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, Edwin Torok <edvin.torok@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich
 <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <cover.1669829264.git.edvin.torok@citrix.com>
 <bf4013cdb5f3e66693551b5e45b3f975b5a48795.1669829264.git.edvin.torok@citrix.com>
 <7e6b8e69-70d2-8178-205d-8c20b993162d@xen.org>
 <7DF6F06F-A65A-4F1F-8FDA-BF0E8977F99B@citrix.com>
 <c3af2730-d503-e139-644a-480a506c94d1@xen.org>
 <99df302d-8bc5-55a7-a97e-dcc8eee41d2c@suse.com>
 <3e6e6948-7852-751e-a025-9fe36e9cfb82@xen.org>
 <82bdfded-6271-d262-136d-57b4b1a92a9b@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <82bdfded-6271-d262-136d-57b4b1a92a9b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 01/12/2022 10:44, Juergen Gross wrote:
> On 01.12.22 11:12, Julien Grall wrote:
>>> We might want to add a comment to xs_wire.h like the one in ring.h in 
>>> order to
>>> document the requirement of the type definition of uint32_t.
>>
>> The problem with this approach is you made more difficult for any 
>> userspace application to use the headers. So I would argue that the 
>> Linux copy can remove "stdint.h" if needed.
> 
> Today there is exactly one public header including stdint.h, and I'd argue
> that this was a mistake.
> 
> xs_wire.h is especially rather uninteresting for any user space application
> but a Xenstore implementation. All consumers of xs_wire.h are probably
> either in the Xen tree, or operating system kernels. User space 
> applications
> should use libxenstore for accessing the Xenstore, so I don't see an
> advantage in breaking the usual philosophy of the Xen public headers NOT
> including external headers like stdint.h.

I think Edwin example is a pretty good justification for including 
stdint.h.

If you have a coding style requiring to order header alphabetically, 
then the developer may not even be able to include stdint.h without any 
hackery (e.g. introducing a header that will always be before the Xen 
public headers).

Cheers,

-- 
Julien Grall

