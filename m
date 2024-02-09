Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 118AE84F24C
	for <lists+xen-devel@lfdr.de>; Fri,  9 Feb 2024 10:29:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678593.1056013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYNBj-0002ij-Cf; Fri, 09 Feb 2024 09:28:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678593.1056013; Fri, 09 Feb 2024 09:28:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYNBj-0002h5-9s; Fri, 09 Feb 2024 09:28:51 +0000
Received: by outflank-mailman (input) for mailman id 678593;
 Fri, 09 Feb 2024 09:28:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rYNBi-0002gz-E4
 for xen-devel@lists.xenproject.org; Fri, 09 Feb 2024 09:28:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rYNBh-0007f1-HN; Fri, 09 Feb 2024 09:28:49 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rYNBh-0004IS-Bc; Fri, 09 Feb 2024 09:28:49 +0000
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
	bh=r3egIsQ76+Zz7dDfZhdkZzns4xBxiI+91N1PKJEsPe0=; b=YtZsNLVyeq9aqOAqRjzZQZZN+P
	sueT610C4CWM64u+Jc6I68xBaQHQ0KDEYq1n6ehg0fZZiWtAcDBGJJlICgD3+AuN5dg+iFe0CQkc3
	SR8M2KNmn9I7xp8Lxy9OfEQbycD7aKJBy3W7UqBxKSo9I8BM5xSDuLe/mE9wlbW5Kyr8=;
Message-ID: <2a335c77-bafb-4a42-a10b-f01c9985c5f8@xen.org>
Date: Fri, 9 Feb 2024 09:28:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] docs/misra: add x86_64 and arm64 asm-offset.c to
 exclude-list
Content-Language: en-GB
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com,
 roger.pau@citrix.com, bertrand.marquis@arm.com,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
References: <b0c855581eed247a32b745906f84d352bf812091.1707324479.git.nicola.vetrini@bugseng.com>
 <ccc568a3-d81c-482c-8768-c5934e3943a8@xen.org>
 <a6ed69c037c23cf2b0854ef52d797921@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <a6ed69c037c23cf2b0854ef52d797921@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 09/02/2024 07:52, Nicola Vetrini wrote:
> Hi Julien,

Hi Nicola,

> 
> On 2024-02-08 22:33, Julien Grall wrote:
>> Hi Nicola,
>>
>> On 08/02/2024 07:55, Nicola Vetrini wrote:
>>> These two files contain several deliberate violations of MISRA C 
>>> rules and
>>> they are not linked in the final Xen binary, therefore they can be 
>>> exempted
>>> from MISRA compliance.
>>
>> I am curious, what are the violations you are talking about?
>>
>> Cheers,
>>
> 
> The one that prompted the exclusion is for R20.12 on arm for the macros 
> DEFINE and OFFSET, where the second argument of OFFSET is a macro and is 
> used as a normal parameter and a stringification operand.
> However, there are other special cases (e.g., the file not being linked, 
> which violates R2.1 and was already decided to deviate that aspect).

Thanks for the clarification. I think it would be worth to add what you 
just wrote in the commit message. This give an idea to the reviewer why 
we excluded it.

With Jan's request addressed:

Acked-by: Julien Grall <jgrall@amazon.com>

> 

-- 
Julien Grall

